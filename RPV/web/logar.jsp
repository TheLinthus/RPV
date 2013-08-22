<%-- 
    Document   : logar
    Created on : 05/08/2013, 10:29:53
    Author     : Matheus-Lenovo
--%>
<%@page language="java" import="controle.*, java.util.*"%>
<%@page language="java" import="banco.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Sistema de Login :: JSP</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style>
body, td, a:link, a:visited {
font-family: Verdana;
font-size: 10px;
color: #000000;
text-decoration: none;

}
a:hover{
color: #FF0000;
}
input {
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 10px;
background-color: #FFFFFF;
border: 1px solid #000000;
}
</style>
</head> <body>
<%
ControleUsuarioBD con = new  ControleUsuarioBD();

String login_form = request.getParameter("login"); // Pega o Login vindo do formulário
String senha_form = request.getParameter("senha"); //Pega a senha vinda do formulário

if(con.realizarLogIn(request.getParameter("login"),request.getParameter("senha"))){ //Caso login e senha estejam corretos...
out.println("Logado com sucesso."); //Mostra na tela que foi logado com sucesso
session.putValue("loginUsuario", login_form); //Grava a session com o Login
session.putValue("senhaUsuario", senha_form); //Grava a session com a Senha
String idCoordenador = con.verificaAut(request.getParameter("login"),request.getParameter("senha"),"coordenador");
String idProfessor = con.verificaAut(request.getParameter("login"),request.getParameter("senha"),"professor");

if (!idCoordenador.equals("")){
   session.putValue("autorizacao","coordenador");
   session.putValue("id", idCoordenador);
} else if (!idProfessor.equals("")){
    session.putValue("autorizacao","professor");
    session.putValue("id", idProfessor);
}
out.println("<script>document.location.href='menu.jsp';</script>"); //Exibe um código javascript para redireionar ao painel
} else //Se estiverem incorretos...
  %>
        <script type="text/javascript">
            alert("LOGIN OU SENHA INVÁLIDOS!");
            window.location.assign("index.html");
        </script>
<br /> <br /> <br />
</body>
</html>
