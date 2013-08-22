<%-- 
    Document   : homologacao
    Created on : 30/07/2013, 10:36:47
    Author     : Augusto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
        
            String linha = request.getParameter("LinhaTabela");
            out.println(linha);
        
        %>
    </body>
</html>
