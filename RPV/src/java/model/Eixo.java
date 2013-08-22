package model;

public class Eixo {
    
    private int id;
    private String eixo;

    public Eixo(int id, String eixo) {
        this.id = id;
        this.eixo = eixo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEixo() {
        return eixo;
    }

    public void setEixo(String eixo) {
        this.eixo = eixo;
    }
    
    public String toString() {
        return eixo;
    }
}
