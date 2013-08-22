/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mail;

import model.Projeto;

/**
 *
 * @author Augusto
 */
public class Email {
    private String email;
    private String justificativa;
    Projeto projeto = new Projeto();
    public void mandarEmail(){
        if(email!=null){
        MailTester mail = new MailTester(getEmail(), getJustificativa());
    }
    }
    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(int email) {
        
        String emailS = projeto.emailProfessor(email);
        
        
        this.email = emailS;
    }

    /**
     * @return the justificativa
     */
    public String getJustificativa() {
        return justificativa;
    }

    /**
     * @param justificativa the justificativa to set
     */
    public void setJustificativa(String justificativa) {
        this.justificativa = justificativa;
    }
}
