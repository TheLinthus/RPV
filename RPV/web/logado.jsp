<%-- 
    Document   : logado
    Created on : 05/08/2013, 10:31:57
    Author     : Matheus-Lenovo
--%>

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
//Verifica se est� logado
if(session.getValue("loginUsuario") != null || session.getValue("senhaUsuario") != null){
out.println("Voc� est� logado com sucesso no sistema, por isso consegue ver est� pagina. Seu login �: " + session.getValue("loginUsuario") + " e sua senha: " + session.getValue("senhaUsuario") + ". Clique <a href='logoff.jsp'>aqui</a> para sair do sistema");
} else {
out.println("Voc� n�o est� logado no sistema. Clique <a href='index.html'>aqui</a> para logar-se");
}
%>
<br/> <br/> <br/>
</body>
</html>
