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
public class Edital {
    
    JDBC jdbc = new JDBC();
    private int idedital;
    private String nomeEdital;
    private Date dataInicioEdital;
    private Date dataFimEdital;
    private Eixo eixo;
    private int arquivoPDF;

    public Edital() {
        nomeEdital="";
    }

    public boolean salvar() {
        try {
            idedital = new banco.Editais().salvarEdital(this);
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    public ArrayList<Edital> buscarEdital(int id) throws SQLException {
        ArrayList<Edital> editais = new ArrayList<Edital>();
        String sql = "SELECT * FROM rpv.edital WHERE idedital = "+id;

        try {
            editais = jdbc.buscarEdital(sql);


        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return editais;
    }

    public static ArrayList<Edital> listarEditais(Coordenador c) {
        try {
            return new banco.Editais().getEditais(c);
        } catch (Exception ex) {
            throw ex;
        }
    }

    public int getId() {
        return idedital;
    }

    public void setId(int idedital) {
        this.idedital = idedital;
    }

    public String getNomeEdital() {
        return nomeEdital;
    }

    public void setNomeEdital(String nomeEdital) {
        this.nomeEdital = nomeEdital;
    }
    public Date getInicio() {
        if (dataInicioEdital==null)
            return new Date();
        return dataInicioEdital;
    }

    public void setInicio(Date dataInicioEdital) {
        this.dataInicioEdital = dataInicioEdital;
    }

    public Date getFim() {
        if (dataFimEdital==null)
            return new Date();
        return dataFimEdital;
    }

    public void setFim(Date dataFimEdital) {
        this.dataFimEdital = dataFimEdital;
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
    public void getEdital (int idedital){
    }
}
