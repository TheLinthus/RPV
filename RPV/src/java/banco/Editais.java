package banco;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Coordenador;
import model.Edital;
import model.Eixo;
import model.Professor;
import model.Projeto;

/**
 *
 * @author Garcia
 */
public class Editais extends JDBC {

    public ArrayList<model.Edital> getEditais(model.Coordenador c) {
        
        ArrayList<model.Edital> list = new ArrayList<model.Edital>();
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
                model.Edital e = new model.Edital();              //Cria um projeto para preencher com os dados requisitados
                
                e.setArquivoPDF(rs.getInt("arquivos_idarquivos"));
                e.setEixo(new Eixo(rs.getInt("eixo_ideixo"), rs.getString("eixo_tipo")));
                e.setFim(rs.getDate("dataFimEdital"));
                e.setId(rs.getInt("idedital"));
                e.setInicio(rs.getDate("dataInicioEdital"));
                e.setNomeEdital(rs.getString("nomeEdital"));
                Professor prof = new Professor();
                prof.setNome(rs.getString("professor_nome"));
                prof.setId(rs.getInt("professor_idprofessor"));
                list.add(e);                                        //Adiciona na lista o projeto
            }

        } catch (SQLException | ClassNotFoundException ex) {
        }
        disconnect();
        return list;
    }

    public int salvarEdital(Edital e) throws ClassNotFoundException, SQLException {
        connect();

        Statement com = con.createStatement();

        PreparedStatement com2 = con.prepareStatement("INSERT INTO rpv2.edital("
                + "VALUES("
                + "nomeEdital, dataInicioEdital,dataFimEdital )");
        com2.setDate(1, new java.sql.Date(e.getInicio().getTime()));
        com2.setDate(2, new java.sql.Date(e.getFim().getTime()));
        com2.setString(3, e.getNomeEdital());
        com2.setString(6, e.getNomeEdital());
        com2.setInt(7, e.getEixoId());
        ResultSet rs = com.executeQuery("SELECT last_insert_id() AS id");
        if (rs.next()) {
            disconnect();
            return rs.getInt("idedital");
        } else {
            throw new SQLException("Impossivel recuperar id do Projeto inserido!");
        }

    }

}
    
