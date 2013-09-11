                                                                     



<%-- 
    Document   : vizualiarProjetos
    Created on : Aug 6, 2013, 12:22:10 AM
    Author     : Garcia
--%>
<%@page import="banco.JDBC"%>
<%
    try {
        Thread.sleep(500);
    } catch (Exception e) {
    }
    ResultSet rs = null;
%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Projetos!</title>
        <script type="text/javascript">
            function ver(id) {
                window.location.assign("projeto.jsp?tipo=visualizar&id=" + id);
            }
            function enviar() {
                try {
                    var tabela = document.getElementById("tabela");
                    var numerodelinhas = tabela.rows.length;
                    var reavaliar = new Array();
                    var count = 0;
                    for (var i = 1; i < numerodelinhas; i++) {
                        var linha = tabela.rows[i];
                        var chkbox = linha.cells[0].childNodes[0];
                        if (null != chkbox && true == chkbox.checked) {
                            linha.cells[0].innerHTML = "";
                            reavaliar[count] = linha.cells[1].innerHTML;
                            count++;
                            linha.cells[7].innerHTML = "Registrado";
                        }
                    }
                    if (reavaliar.length > 0) {
                        carrega("visualizarProjetos.jsp?ids=" + reavaliar);
                    }
                } catch (e) {
                    alert(e);
                }
            }
        </script>
    </head>
    <body>
        <div id='contenthead' style="height: 30px; text-align: center;">
            <h1>Aqui estão os projetos de sua autoria</h1>
        </div>   
    </body>
    <body>
        <div id="meio" style='min-width: 700px; max-width: 900px; margin: auto auto;'>
            <%
                String reavaliar;
                if ((reavaliar = request.getParameter("ids")) != null) {
                    new banco.Projetos().reavaliar(reavaliar.split(","));
                }

                String sql = "SELECT a.*, " //Selecionar Projeto
                        + "c.tipo AS eixo_tipo, " //seu eixo (tipo)
                        + "d.nome AS campus_nome " //campus (nome)
                        + "FROM rpv.projeto a " //da tabela projeto
                        + "LEFT OUTER JOIN rpv.eixo c " //Pega o tipo de eixo (se existe)
                        + "ON a.eixo_ideixo = c.ideixo " //pelo id do eixo.
                        + "LEFT OUTER JOIN rpv.campus d " //Pega o nome do campus (se existe)
                        + "ON a.campus_idcampus = d.idcampus " //pelo id do campus.
                        //                    + "WHERE professor_idprofessor = " + session.getAttribute("id");
                        + "WHERE a.professor_idprofessor = " + session.getValue("id");
                JDBC banco = new JDBC();
                rs = banco.listaProjetos(sql);

                if (rs.next()) {
                    rs.previous();

                    //CRIA ESTRUTURA DA TABELA
                    out.println("<table id='tabela' class='tabela', border='1px'>");
                    out.println("<td id='id'></td>");
                    //out.println("<td>ID Projeto</td>");
                    out.println("<td>Titulo</td>");
                    out.println("<td>Data Inicio</td>");
                    out.println("<td>Data Fim</td>");
                    // out.println("<td>Campus</td>");
                    out.println("<td>Eixo</td>");
                    //             out.println("<td>ID Professor</td>");
                    out.println("<td>Status</td>");
                    out.println("<td></td>");

                    //ADICIONA LINHAS A TABELA
                    while (rs.next()) {
                        String idprojetos = rs.getString("idprojeto");
                        String titulo = rs.getString("titulo");
                        String inicio = rs.getString("d_inicio");
                        String fim = rs.getString("d_fim");
                        // String campus = rs.getString("campus_nome");
                        String eixo = rs.getString("eixo_tipo");
                        String status = "";

                        switch (rs.getInt("status")) {
                            case 1:
                                status = "Criado";
                                break;
                            case 2:
                                status = "Registrado";
                                break;
                            case 3:
                                status = "Homologado";
                                break;
                            case 4:
                                status = "Não Homologado";
                                break;
                            case 5:
                                status = "Alterado";
                                break;
                            case 6:
                                status = "Terminado";
                                break;
                        }



                        out.println("<tr>");

                        if (status.equals("Criado")) {
                            out.println("<td><input type='checkbox' id='" + idprojetos + "'/></td>");
                        } else {
                            out.println("<td></td>");
                        }
            %>


            <td><%= titulo%></td>

            <td><%= inicio%></td>

            <td><%= fim%></td>


            <td><%= eixo%></td>

            <td><%= status%></td>

            <td style="padding: 2px;"><a href="javascript: carrega('projeto.jsp?tipo=visualizar&id=<%=idprojetos%>')">Visualizar Projeto</a></td>
        </tr>
        <%
            }
        %>
        </table>
        <a href='javascript: enviar()' style="position: absolute; margin-top: 30px;"> Enviar projeto selecionado para avaliação </a>
        <%
        } else {
        %>
        <center><h1>Não há projetos inseridos ainda!</h1></center>
        <%            }

            rs.close();
        %>
        <a href="javascript: carrega('projeto.jsp');" style="position: absolute; margin-top: 12px;">Novo Projeto</a>
</div>

</body>
</html>