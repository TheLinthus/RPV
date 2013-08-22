/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mail;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.mail.MessagingException;

public class MailTester {

    public MailTester(String email, String texto) {
        MailJava mj = new MailJava();
        //configuracoes de envio
        mj.setSmtpHostMail("smtp.gmail.com");
        mj.setSmtpPortMail("587");
        mj.setSmtpAuth("true");
        mj.setSmtpStarttls("true");
        mj.setUserMail("grupo2.unipampa@gmail.com");
        mj.setFromNameMail("grupoV");
        mj.setPassMail("grupo2RP5");
        mj.setCharsetMail("ISO-8859-1");
        mj.setSubjectMail("Resultado Homologação");
        mj.setBodyMail(texto);


        //mj.setBodyMail(htmlMessage());
        mj.setTypeTextMail(MailJava.getTYPE_TEXT_HTML());

        //sete quantos destinatarios desejar
        Map<String, String> map = new HashMap<String, String>();
        map.put(email, "email gmail");
        // map.put("destinatario2@msn.com", "email msn");
        //map.put("destinatario3@ig.com.br", "email ig");

        mj.setToMailsUsers(map);

        //seta quatos anexos desejar
        List<String> files = new ArrayList<String>();
        //files.add("C:\\Users\\Augusto\\Documents\\horario.txt");
        //files.add("C:\images\hover_next.png");
        //files.add("C:\images\hover_prev.png");

        mj.setFileMails(files);

        try {
            new MailJavaSender().senderMail(mj);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    private static String textMessage() {
        return "Leia o novo tutorial JavaMail do Programando com Java.n"
                + "Saiba como enviar emails com anexo, em formato texto e html.n"
                + "Envie seu email para mais de um destinatario.";
    }

    private static String htmlMessage() {
        return "<html>n"
                + "t<head>n"
                + "tt<title>Email no formato HTML com Javamail!</title> n"
                + "t</head>n"
                + "t<body>n"
                + "tt<div style='background-color:orange; width:28%; height:100px;'>n"
                + "ttt<ul>n"
                + "tttt<li>Leia o novo tutorial JavaMail do Programando com Java.</li>n"
                + "tttt<li>Aprenda como enviar emails com anexos.</li>n"
                + "tttt<li>Aprenda a enviar emails em formato texto simples ou html.</li> n"
                + "tttt<li>Aprenda como enviar seu email para mais de um destinátario.</li>n"
                + "ttt</ul>n"
                + "ttt<p>Visite o blog n"
                + "tttt<a href='http://mballem.wordpress.com/'>Programando com Java</a>n"
                + "ttt</p>n"
                + "tt</div>tn"
                + "tt<div style='width:28%; height:50px;' align='center'>n"
                + "tttDownload do JavaMail<br/>n"
                + "ttt<a href='http://www.oracle.com/technetwork/java/javaee/index-138643.html'>n"
                + "tttt<img src='http://www.oracleimg.com/admin/images/ocom/hp/oralogo_small.gif'/>n"
                + "ttt</a> n"
                + "tt</div>ttn"
                + "t</body> n"
                + "</html>";
    }
}