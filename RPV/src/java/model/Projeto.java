/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import banco.JDBC;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Pedro
 */
public class Projeto {

    JDBC jdbc = new JDBC();
    private int id;
    private String nome;
    private String titulo;
    private String equipe;
    private int prazoDeExecucao;
    private Date inicio;
    private Date fim;
    private String[] palavrasChave;
    private Campus campus;
    private Eixo eixo;
    private int arquivoPDF;
    private Professor professor;
    private int status;

    public Projeto() {
        nome = "";
        titulo = "";
        equipe = "";
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public boolean salvar() {
        try {
            id = new banco.Projetos().salvarPorjeto(this);
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    
    public void alterarhomologacao(int id, int homologar) {
        jdbc.homologar("UPDATE projeto SET status=" + homologar + " WHERE idprojeto=" + id);
    }
   /* public void alterarProjeto(int id, String datainicio, String datafim, String titulo, String palavraschave, String descricao, int eixo, int campus, int equipe) {
        jdbc.alterarProjeto("UPDATE projeto SET d_inicio=" + datainicio + ",d_fim="+datafim+",titulo="+titulo+",palavraschave"+palavraschave+",nome="+descricao+","
                + "eixo_ideixo"+eixo+",campus="+campus+",equipe="+equipe+", WHERE idprojeto=" + id);
    }
*/
    public void atualizar() {
        try {
            Projeto temp = buscarProjeto(id).get(0);

            this.titulo = temp.titulo;
            this.professor = temp.professor;
            this.palavrasChave = temp.palavrasChave;
            this.nome = temp.nome;
            this.inicio = temp.inicio;
            this.fim = temp.fim;
            this.equipe = temp.equipe;
            this.eixo = temp.eixo;
            this.campus = temp.campus;
            this.arquivoPDF = temp.arquivoPDF;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Projeto> buscarProjeto(int id) throws SQLException {
        ArrayList<Projeto> projetos = new ArrayList<Projeto>();
        String sql = "SELECT * FROM rpv.projeto WHERE idprojeto = " + id;

        try {
            projetos = jdbc.buscarProjeto(sql);


        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return projetos;
    }

    public String emailProfessor(int idProjeto) {
        String email = "";
        email = jdbc.buscarEmailProfessor(idProjeto);
        return email;
    }

    public static ArrayList<Projeto> listarProjetos(Coordenador c) {
        try {
            return new banco.Projetos().getProjetos(c);
        } catch (Exception ex) {
            throw ex;
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEquipe() {
        return equipe;
    }

    public void setEquipe(String equipe) {
        this.equipe = equipe;
    }

    public int getPrazoDeExecucao() {
        return prazoDeExecucao;
    }

    public void setPrazoDeExecucao(int prazoDeExecucao) {
        this.prazoDeExecucao = prazoDeExecucao;
    }

    public Date getInicio() {
        if (inicio == null) {
            return new Date();
        }
        return inicio;
    }

    public void setInicio(Date inicio) {
        this.inicio = inicio;
    }

    public Date getFim() {
        if (fim == null) {
            return new Date();
        }
        return fim;
    }

    public void setFim(Date fim) {
        this.fim = fim;
    }

    public String[] getPalavrasChave() {
        return palavrasChave;
    }

    public String getPalavraChave() {
        StringBuilder builder = new StringBuilder();
        for (String s : palavrasChave) {
            builder.append(s);
        }
        return builder.toString();
    }

    public void setPalavrasChave(String[] palavrasChave) {
        this.palavrasChave = palavrasChave;
    }

    public String getCampus() {
        return campus.toString();
    }

    public int getCampusId() {
        return campus.getId();
    }

    public void setCampus(Campus campus) {
        this.campus = campus;
    }

    public String getEixo() {
        return eixo.toString();
    }

    public int getEixoId() {
        return eixo.getId();
    }

    public void setEixo(Eixo eixo) {
        this.eixo = eixo;
    }

    public int getArquivoPDF() {
        return arquivoPDF;
    }

    public void setArquivoPDF(int arquivoPDF) {
        this.arquivoPDF = arquivoPDF;
    }

    public Professor getProfessor() {
        return professor;
    }

    public void setProfessor(Professor professor) {
        this.professor = professor;
    }
}
