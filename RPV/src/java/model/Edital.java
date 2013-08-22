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
    private int id;
    private String nome;
    private Date inicio;
    private Date fim;
    private Eixo eixo;
    private int arquivoPDF;

    public Edital() {
        nome="";
    }

    public boolean salvar() {
        try {
            id = new banco.Editais().salvarEdital(this);
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    public ArrayList<Edital> buscarEdital(int id) throws SQLException {
        ArrayList<Edital> editais = new ArrayList<Edital>();
        String sql = "SELECT * FROM rpv.projeto WHERE idedital = "+id;

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
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    public Date getInicio() {
        if (inicio==null)
            return new Date();
        return inicio;
    }

    public void setInicio(Date inicio) {
        this.inicio = inicio;
    }

    public Date getFim() {
        if (fim==null)
            return new Date();
        return fim;
    }

    public void setFim(Date fim) {
        this.fim = fim;
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
    public void getEdital (int id){
    }
}
