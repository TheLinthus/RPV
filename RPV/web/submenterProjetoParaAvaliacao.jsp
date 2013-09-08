                                                                     



<%-- 
    Document   : submeterProjetoParaAvaliação
    Created on : Aug 6, 2013, 12:23:08 AM
    Author     : Garcia
--%>
<%@page import="banco.JDBC"%>
<%
    ResultSet rs = null;
%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submeter Projeto</title>
    </head>
    <body>
        <h1>Escolha abaixo o projeto que deseja enviar para avaliação</h1>


        <div id="meio">
            <%


                String sql = "SELECT * FROM usuario natural join professor natural join coordenador natural join eixo natural join atas natural join projeto";
                JDBC banco = new JDBC();
                rs = banco.listaProjetos(sql);

                //CRIA ESTRUTURA DA TABELA
                out.println("<table id='tabela', border='1px'>");
                out.println("<td> </td>");
                out.println("<td>ID Projeto</td>");
                out.println("<td>Titulo</td>");
                out.println("<td>Data Inicio</td>");
                out.println("<td>Data Fim</td>");
                out.println("<td>Campus</td>");
                out.println("<td>Eixo</td>");
                //             out.println("<td>ID Professor</td>");
                //              out.println("<td>Status</td>");                    
                //         out.println("<td></td>");
                //       out.println("<td></td>");

                //ADICIONA LINHAS A TABELA
                while (rs.next()) {
                    String idprojetos = rs.getString("idprojeto");
                    String titulo = rs.getString("titulo");
                    String inicio = rs.getString("d_inicio");
                    String fim = rs.getString("d_fim");
                    String campus = rs.getString("professor.campus");
                    String eixo = rs.getString("eixo.tipo");
                    String status = rs.getString("projeto.p_execucao");



                    out.println("<tr>");

                    out.println("<td><label># <input name=\"#\" type=\"checkbox\" value=\"c\"></label></td>");

                    out.println("<td >" + idprojetos + "</td>");

                    out.println("<td >" + titulo + "</td>");

                    out.println("<td>" + inicio + "</td>");

                    out.println("<td>" + fim + "</td>");

                    out.println("<td>" + campus + "</td>");

                    out.println("<td>" + eixo + "</td>");

                    //          out.println("<td>" + status + "</td>");

                    //        out.println("<td >" + idprofessor + "</td>");

                    //                 out.println("<td><input type=\"submit\" value=\"Visualizar Projeto\"></td>");

                    //               out.println("<td><input type=\"submit\" value=\"Alterar Projeto\"></td>");

                    out.println("</tr>");


                }

                out.println("</table>");

                rs.close();
            %>
        </div>
        <p>
            <input type="submit" value="Enviar projetos selecionados para avaliação"
        </p>
    <li><a href="menuProfessor.jsp">Voltar ao Menu</a></li>
</body>
</html>