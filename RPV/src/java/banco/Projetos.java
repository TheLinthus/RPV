/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package banco;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Eixo;
import model.Professor;
import model.Projeto;

/**
 *
 * @author Caio Alexandre
 */
public class Projetos extends JDBC {
    
    public int getCampus(int userId) {
        int ret = 0;
        try {
            connect();
            ResultSet rs = con.createStatement().executeQuery("SELECT campus FROM professor WHERE idprofessor = "+userId);

            if (rs.next()) {
                ret = rs.getInt("campus");
            }
            disconnect();
        } catch (ClassNotFoundException | SQLException ex) {
        }
        return ret;
    }
    
    public String professorVinculado(int idProjeto) {
        String nome = "";
        try {
            connect();
            ResultSet rs = con.createStatement().executeQuery("SELECT b.nome FROM rpv.projeto AS a INNER JOIN rpv.professor AS b ON a.professor_idprofessor = b.idprofessor WHERE a.idprojeto = " + idProjeto);

            if (rs.next()) {
                nome = rs.getString("nome");
            }
            disconnect();
        } catch (ClassNotFoundException | SQLException ex) {
        }
        return nome;
    }

    public ArrayList<model.Projeto> getProjetos(model.Coordenador c) {

        ArrayList<model.Projeto> list = new ArrayList<model.Projeto>();
        try {
            connect();

            Statement com = con.createStatement();

            ResultSet rs = com.executeQuery(
                    "SELECT a.*, " //Selecionar Projeto
                    + "c.tipo AS eixo_tipo, " //seu eixo (tipo)
                    + "d.nome AS campus_nome, " //campus (nome)
                    + "e.nome AS professor_nome " //professor (nome)
                    + "FROM rpv.projeto a " //da tabela projeto
                    + "INNER JOIN rpv.coordenador b " //em que o coordenador (somente se)
                    + "ON a.eixo_ideixo = b.eixo_ideixo " //pertence do mesmo eixo
                    + "AND a.campus_idcampus = b.campus_idcampus " //e campus.
                    + "LEFT OUTER JOIN rpv.eixo c " //Pega o tipo de eixo (se existe)
                    + "ON a.eixo_ideixo = c.ideixo " //pelo id do eixo.
                    + "LEFT OUTER JOIN rpv.campus d " //Pega o nome do campus (se existe)
                    + "ON a.campus_idcampus = d.idcampus " //pelo id do campus.
                    + "LEFT OUTER JOIN rpv.professor e " //Pega o nome do professor (se existe)
                    + "ON a.professor_idprofessor = e.idprofessor " //pelo id do professor.
                    + "WHERE b.professor_idprofessor = " + c.getId());//Onde o Coordenador responsavel é o de id 'x'

            while (rs.next()) {
                model.Projeto p = new model.Projeto();              //Cria um projeto para preencher com os dados requisitados
                String palavraschave = rs.getString("palavraschave");
                if (palavraschave == null) {
                    palavraschave = "";
                }
                p.setArquivoPDF(rs.getInt("arquivos_idarquivos"));
                p.setCampus(new model.Campus(rs.getInt("campus_idcampus"), rs.getString("campus_nome")));
                p.setEixo(new Eixo(rs.getInt("eixo_ideixo"), rs.getString("eixo_tipo")));
                p.setEquipe(rs.getString("equipe"));
                p.setFim(rs.getDate("d_fim"));
                p.setId(rs.getInt("idprojeto"));
                p.setInicio(rs.getDate("d_inicio"));
                p.setNome(rs.getString("nome"));
                p.setPalavrasChave(palavraschave.split(","));
                p.setPrazoDeExecucao(rs.getInt("p_execucao"));
                p.setTitulo(rs.getString("titulo"));
                Professor prof = new Professor();
                prof.setNome(rs.getString("professor_nome"));
                prof.setId(rs.getInt("professor_idprofessor"));
                p.setProfessor(prof);
                p.setStatus(rs.getInt("status"));
                list.add(p);                                        //Adiciona na lista o projeto
            }

        } catch (SQLException | ClassNotFoundException ex) {
        }
        disconnect();
        return list;
    }

    public int salvarPorjeto(Projeto p) throws ClassNotFoundException, SQLException {
        connect();

        Statement com = con.createStatement();

        boolean equipe = (p.getEquipe() != null && !p.getEquipe().isEmpty());
        if (equipe) {
            for (int i = 0; i < p.getEquipe().split(";").length; i++) {
                if (i == 0) {
                    com.execute("INSERT INTO rpv.equipe(membro) VALUES('" + p.getEquipe().split(";")[i] + "')");
                } else {
                    com.execute("INSERT INTO rpv.equipe(idequipe,membro) VALUES(last_insert_id(),'" + p.getEquipe().split(";")[i] + "')");
                }
            }
        }

        int id = 0;

        PreparedStatement com2 = con.prepareStatement("INSERT INTO rpv.projeto("
                + "d_inicio,d_fim,equipe,titulo,palavraschave,"
                + "professor_idprofessor,nome,eixo_ideixo,campus_idcampus) "
                + "VALUES("
                + "?,?," + (equipe ? "last_insert_id()" : "null") + ",?,?,?,?,?,?)");
        com2.setDate(1, new java.sql.Date(p.getInicio().getTime()));
        com2.setDate(2, new java.sql.Date(p.getFim().getTime()));
        com2.setString(3, p.getTitulo());
        String palavrasChave = "";
        for (int i = 0; i < p.getPalavrasChave().length; i++) {
            palavrasChave += p.getPalavrasChave()[i] + (i == p.getPalavrasChave().length - 1 ? "" : ",");
        }
        com2.setString(4, palavrasChave);
        com2.setInt(5, p.getProfessor().getId());
        com2.setString(6, p.getNome());
        com2.setInt(7, p.getEixoId());
        com2.setInt(8, p.getCampusId());

        com2.execute();

        ResultSet rs = com.executeQuery("SELECT last_insert_id() AS id");
        if (rs.next()) {
            id = rs.getInt("id");
        } else {
            throw new SQLException("Impossivel recuperar id do Projeto inserido!");
        }

        disconnect();
        return id;
    }

    public void reavaliar(String[] projetos) {
        try {
            connect();

            Statement com = con.createStatement();

            for (String id : projetos) {
                com.execute("UPDATE rpv.projeto SET status = " + 2 + " WHERE idprojeto = " + id);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            disconnect();
        }
    }
}
