package mail;
 
import java.util.List;
import java.util.Map;

public class MailJava {
    //indica se o formato de texto será texto ou html
    private static String TYPE_TEXT_PLAIN = "text/plain";
    private static String TYPE_TEXT_HTML = "text/html";

    /**
     * @return the TYPE_TEXT_PLAIN
     */
    public static String getTYPE_TEXT_PLAIN() {
        return TYPE_TEXT_PLAIN;
    }

    /**
     * @param aTYPE_TEXT_PLAIN the TYPE_TEXT_PLAIN to set
     */
    public static void setTYPE_TEXT_PLAIN(String aTYPE_TEXT_PLAIN) {
        TYPE_TEXT_PLAIN = aTYPE_TEXT_PLAIN;
    }

    /**
     * @return the TYPE_TEXT_HTML
     */
    public static String getTYPE_TEXT_HTML() {
        return TYPE_TEXT_HTML;
    }

    /**
     * @param aTYPE_TEXT_HTML the TYPE_TEXT_HTML to set
     */
    public static void setTYPE_TEXT_HTML(String aTYPE_TEXT_HTML) {
        TYPE_TEXT_HTML = aTYPE_TEXT_HTML;
    }
    //indica qual será o servidor de email(gmail, hotmail...)       ?
    private String smtpHostMail;
    //indica a porta de acesso ao servidor
    private String smtpPortMail;
    //indica que a necessidade de autenticação 
    // no servidor(true ou false)
    private String smtpAuth;
    //indica ao servidor que ele está recebendo uma conexão segura
    private String smtpStarttls;
    //nome do remetente do email
    private String fromNameMail;
    //email do remetente
    private String userMail;
    //senha do email do remetente
    private String passMail;
    //assunto do email
    private String subjectMail;
    //corpo do email, onde estará o texto da mensagem
    private String bodyMail;
    //lista com email e nome dos destinatários
    private Map<String, String> toMailsUsers;
    //lista contendo os arquivos anexos
    private List<String> fileMails;
    //charset, no caso de html é necessário
    private String charsetMail;
    //tipo do formato da mensagem, texto ou html
    private String typeTextMail;
 
    // gere os métodos getters and setters

    /**
     * @return the smtpHostMail
     */
    public String getSmtpHostMail() {
        return smtpHostMail;
    }

    /**
     * @param smtpHostMail the smtpHostMail to set
     */
    public void setSmtpHostMail(String smtpHostMail) {
        this.smtpHostMail = smtpHostMail;
    }

    /**
     * @return the smtpPortMail
     */
    public String getSmtpPortMail() {
        return smtpPortMail;
    }

    /**
     * @param smtpPortMail the smtpPortMail to set
     */
    public void setSmtpPortMail(String smtpPortMail) {
        this.smtpPortMail = smtpPortMail;
    }

    /**
     * @return the smtpAuth
     */
    public String getSmtpAuth() {
        return smtpAuth;
    }

    /**
     * @param smtpAuth the smtpAuth to set
     */
    public void setSmtpAuth(String smtpAuth) {
        this.smtpAuth = smtpAuth;
    }

    /**
     * @return the smtpStarttls
     */
    public String getSmtpStarttls() {
        return smtpStarttls;
    }

    /**
     * @param smtpStarttls the smtpStarttls to set
     */
    public void setSmtpStarttls(String smtpStarttls) {
        this.smtpStarttls = smtpStarttls;
    }

    /**
     * @return the fromNameMail
     */
    public String getFromNameMail() {
        return fromNameMail;
    }

    /**
     * @param fromNameMail the fromNameMail to set
     */
    public void setFromNameMail(String fromNameMail) {
        this.fromNameMail = fromNameMail;
    }

    /**
     * @return the userMail
     */
    public String getUserMail() {
        return userMail;
    }

    /**
     * @param userMail the userMail to set
     */
    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }

    /**
     * @return the passMail
     */
    public String getPassMail() {
        return passMail;
    }

    /**
     * @param passMail the passMail to set
     */
    public void setPassMail(String passMail) {
        this.passMail = passMail;
    }

    /**
     * @return the subjectMail
     */
    public String getSubjectMail() {
        return subjectMail;
    }

    /**
     * @param subjectMail the subjectMail to set
     */
    public void setSubjectMail(String subjectMail) {
        this.subjectMail = subjectMail;
    }

    /**
     * @return the bodyMail
     */
    public String getBodyMail() {
        return bodyMail;
    }

    /**
     * @param bodyMail the bodyMail to set
     */
    public void setBodyMail(String bodyMail) {
        this.bodyMail = bodyMail;
    }

    /**
     * @return the toMailsUsers
     */
    public Map<String, String> getToMailsUsers() {
        return toMailsUsers;
    }

    /**
     * @param toMailsUsers the toMailsUsers to set
     */
    public void setToMailsUsers(Map<String, String> toMailsUsers) {
        this.toMailsUsers = toMailsUsers;
    }

    /**
     * @return the fileMails
     */
    public List<String> getFileMails() {
        return fileMails;
    }

    /**
     * @param fileMails the fileMails to set
     */
    public void setFileMails(List<String> fileMails) {
        this.fileMails = fileMails;
    }

    /**
     * @return the charsetMail
     */
    public String getCharsetMail() {
        return charsetMail;
    }

    /**
     * @param charsetMail the charsetMail to set
     */
    public void setCharsetMail(String charsetMail) {
        this.charsetMail = charsetMail;
    }

    /**
     * @return the typeTextMail
     */
    public String getTypeTextMail() {
        return typeTextMail;
    }

    /**
     * @param typeTextMail the typeTextMail to set
     */
    public void setTypeTextMail(String typeTextMail) {
        this.typeTextMail = typeTextMail;
    }
}