package model;

public class Professor {

    protected int id;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    protected String nome;
    protected Eixo eixo;
    protected Campus campus;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
