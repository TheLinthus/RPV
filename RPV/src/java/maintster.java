
import banco.JDBC;
import model.Projeto;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Guto
 */
public class maintster {
    public static void main(String ars[]){
        //Projeto pro = new Projeto();
        //pro.alterarProjeto(3, "20130201", "20140102", "novotitulo", "palavriados", "novadescricao", 3, 2, 1);
        JDBC jb = new JDBC();
        jb.alterarProjeto();
    }
}
