<%-- 
    Document   : visualiazarEditais
    Created on : Aug 22, 2013, 12:32:54 AM
    Author     : Garcia
--%>

<%@page import="model.Projeto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!private SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");%>
<%
    boolean possui_id = false;
    ArrayList<model.Edital> editais;
    model.Coordenador c = new model.Coordenador();
    int id = 1;
//    try {
//        id = Integer.parseInt((String) session.getAttribute("id"));
//        possui_id = true;
//    } catch (Exception ex) {
//        response.sendRedirect("index.html");
//    }
    c.setId(id);
    editais = model.Edital.listarEditais();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projetos</title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"></script> 
        <script type="text/javascript">
            $(function() {
                $("table").tablesorter();
            });
        </script>
    </head>
    <body>
        <div id='contenthead' style="height: 30px; text-align: center;">
            <h1>Aqui estão os editais</h1>
        </div>
        <div class='meio' style='min-width: 700px; max-width: 900px; margin: auto auto;'>
            <table id='tabela' class='tablesorter'>
                <thead>
                    <tr>
                        <th id='nome' class='header'>NOME</td>
                        <th id='inicio' class='header'>DATA INÍCIO</td>
                        <th id='fim' class='header'>DATA FIM</td>
                        <th id='eixo' class='header'>EIXO</td>
                        <th id='arquivo' class='header'>ARQUIVO</td>
                    </tr>
                </thead>
                <tbody>
                    <%for (int i = 0; i < editais.size(); i++) {%>
                    <tr id="<%=editais.get(i).getId()%>">
                        <td><%=editais.get(i).getNomeEdital()%></td>
                        <td><%=formater.format(editais.get(i).getInicio())%></td>
                        <td><%=formater.format(editais.get(i).getFim())%></td>
                        <td><%=editais.get(i).getEixo()%></td>
                        <td><img src="imagens/icone_pdf.jpg"/></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>

