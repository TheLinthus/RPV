<%@page import="model.Projeto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!private SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");%>
<%
    boolean possui_id = false;
    ArrayList<model.Projeto> projetos;
    model.Coordenador c = new model.Coordenador();
    int id = 1;
    try {
        id = Integer.parseInt((String) session.getAttribute("id"));
        possui_id = true;
    } catch (Exception ex) {
        response.sendRedirect("index.html");
    }
    c.setId(id);
    projetos = model.Projeto.listarProjetos(c);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projetos</title>
        <link rel="stylesheet" type="text/css" href="css//modal.css"/>

        <script type="text/javascript" src="js/jquery-latest.js"></script>
        <script type="text/javascript" src="js/jquery.tablesorter.js"></script>

        <script type="text/javascript">
            function refreshFilter() {
                var f1 = document.getElementById("registrado").checked;
                var f2 = document.getElementById("criado").checked;
                var f3 = document.getElementById("alterado").checked;
                var f4 = document.getElementById("homologado").checked;
                var f5 = document.getElementById("naohomologado").checked;
                var data = document.getElementById("tabela").rows;
                if (f1 || f2 || f3 || f4 || f5) {
                    for (var i = 1; i < data.length; i++) {
                        var status = data.item(i).cells.item(4).innerHTML;
                        switch (status) {
                            case "Registrado" : data.item(i).style.display = f1 ? "" : "none"; break;
                            case "Criado" : data.item(i).style.display = f2 ? "" : "none"; break;
                            case "Alterado" : data.item(i).style.display = f3 ? "" : "none"; break;
                            case "Homologado" : data.item(i).style.display = f4 ? "" : "none"; break;
                            case "Não Homologado" : data.item(i).style.display = f5 ? "" : "none"; break;
                        }
                    }
                } else {
                    for (var i = 1; i < data.length; i++) {
                        data.item(i).style.display="";
                    }
                }
            }

            $(function() {
                $("table").tablesorter();
            });

            function paste(id) {
                var linha = document.getElementById("linha " + id);
                document.getElementById("TITULO").innerHTML = linha.cells[0].innerHTML;
                document.formulario.action = "enviaEmailEMudaStatus.jsp?id=" + id;
            }

            $(document).ready(function() {
                $("a[rel=modal]").click(function(ev) {
                    ev.preventDefault();

                    var id = $(this).attr("href");

                    var alturaTela = $(document).height();
                    var larguraTela = $(window).width();

                    //colocando o fundo preto
                    $('#mascara').css({'width': larguraTela, 'height': alturaTela});
                    $('#mascara').fadeIn(1000);
                    $('#mascara').fadeTo("slow", 0.8);

                    var left = ($(window).width() / 2) - ($(id).width() / 2);
                    var top = ($(window).height() / 2) - ($(id).height() / 2);

                    $(id).css({'top': top, 'left': left});
                    $(id).show();
                });

                $("#mascara").click(function() {
                    $(this).hide();
                    $(".window").hide();
                });

                $('.fechar').click(function(ev) {
                    ev.preventDefault();
                    $("#mascara").hide();
                    $(".window").hide();
                });
            });

            $(document).ready(function() {
                $("#naohomologar").click(function(evento) {
                    if ($("#naohomologar").attr("checked")) {
                        $("#formularioJust").css("display", "block");
                    }
                });
            });
            $(document).ready(function() {
                $("#homologar").click(function(evento) {
                    if ($("#homologar").attr("checked")) {
                        document.formulario.texto.value = "";
                        $("#formularioJust").css("display", "none");
                    }
                });
            });
            $(document).ready(function() {
                $("#homologar").click(function(evento) {
                    if ($("#homologar").attr("checked")) {
                        $("#formularioJust").css("display", "none");
                    }
                });
            });

            function validar(arquivo1, arquivo2) {


                if (document.formulario.homologacao[0].checked == false
                        && document.formulario.homologacao[1].checked == false) {
                    alert('Por favor, selecione Homologar ou Não Homologar o projeto.');
                    return false;
                }

                if (document.formulario.homologacao[1].checked == true && document.formulario.texto.value == "") {
                    alert('Por favor, Adicione uma justificativa.');
                    return false;
                }
                extensao_ata1 = (arquivo1.substring(arquivo1.lastIndexOf("."))).toLowerCase();
                if (arquivo1 == "" || extensao_ata1 != ".pdf") {
                    alert('Selecione o PDF com a ata da reuniao da comissao local');
                    document.formulario.ata1.focus();
                    return false;
                }
                extensao_ata2 = (arquivo2.substring(arquivo2.lastIndexOf("."))).toLowerCase();
                if (arquivo2 == "" || extensao_ata2 != ".pdf") {
                    alert('Selecione o PDF com a ata da reuniao do conselho do campus');
                    document.formulario.ata2.focus();
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <div id="mascara"></div>

        <div class="window" id="janela1">
            <a href="#" class="fechar">X Fechar</a> 
            <h3 id="TITULO">TESTE</h3>
            <form enctype="multipart/form-data" action="enviaEmailEMudaStatus.jsp" method=POST name="formulario" id="formulario" onsubmit="return validar(document.formulario.ata1.value, document.formulario.ata2.value)">
                <center>
                    <table>
                        <input type="radio" name="homologacao" value="homologar" id="homologar">HOMOLOGAR
                        <input type="radio" name="homologacao" value="naohomologar" id="naohomologar" />NÃO HOMOLOGAR<br>
                        <!-- E-mail<input type="text" name="email" id="email"> -->
                        <br />
                        <div id="formularioJust" style="display: none; border: 0px">
                            <!-- Justificativa <input  type="text" name="texto" />   -->
                            Justificativa <textarea name="texto" form="formulario"></textarea>
                        </div>
                        <tr>
                            <!--<td colspan="2" align="center"><B>UPLOAD THE FILE</B>-->
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"></td>
                        </tr>
                        <tr>
                            <td>Ata da reuniao da comissao local<INPUT NAME="ata1" TYPE="file"></td>

                        </tr>
                        <tr>

                            <td>Ata da reuniao do conselho do campus<INPUT NAME="ata2" TYPE="file"></td>

                        </tr>
                        <tr>
                            <td colspan="2" align="center"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"></td>
                        </tr>
                    </table>
                </center>

                <input type="submit" value="CONFIRMAR" >

            </form>
        </div>
        <!--<input type="button" id="enviarEmail" value="ENVIAR E-MAIL"/>-->

        <div id="meio" style='min-width: 700px; max-width: 900px; margin: auto auto;'>
            <%
                if (projetos.size() > 0) {
            %>
            <div id="filters" style="margin-bottom: 10px; margin-top: 10px; float: left;">
                <label><input onclick="javascript: refreshFilter();" type="checkbox" id="registrado" style="width: 20px;"/> Registrados</label>
                <label><input onclick="javascript: refreshFilter();" type="checkbox" id="criado" style="width: 20px;"/> Criado</label>
                <label><input onclick="javascript: refreshFilter();" type="checkbox" id="alterado" style="width: 20px;"/> Alterado</label>
                <label><input onclick="javascript: refreshFilter();" type="checkbox" id="homologado" style="width: 20px;"/> Homologado</label>
                <label><input onclick="javascript: refreshFilter();" type="checkbox" id="naohomologado" style="width: 20px;"/> Não Homologado</label>
            </div>
            <div class='tabela'>
                <table id='tabela' class="tablesorter" border='1px'>
                    <thead>
                        <tr>
                            <th id='titulo' class='header'>Título</td>
                            <th id='professor' class='header'>Professor</td>
                            <th id='inicio' class='header'>Data início</td>
                            <th id='fim' class='header'>Data fim</td>
                            <th id='status' class='header'>Status</td>
                            <th id='arquivo' class='header'>Arquivo</td>
                            <th id='campo' class='header'></td>
                            <th id='campo' class='header'></td>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (int i = 0; i < projetos.size(); i++) {%>
                        <tr class='linhatabela' id="linha <%=projetos.get(i).getId()%>" >
                            <td><%=projetos.get(i).getTitulo()%></td>
                            <td><%=new banco.Projetos().professorVinculado(projetos.get(i).getId())%></td>
                            <td><%=formater.format(projetos.get(i).getInicio())%></td>
                            <td><%=formater.format(projetos.get(i).getFim())%></td>
                            <%
                                String status = "";

                                switch (projetos.get(i).getStatus()) {
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
                            %>
                            <td><%=status%></td>
                            <td>
                                <%if (projetos.get(i).getArquivoPDF() != 0) {%>

                                <a href="download.jsp?file=<%=projetos.get(i).getArquivoPDF()%>"><img src="imagens/icone_pdf.jpg"/></a>
                                    <%}%>
                            </td>
                            <td>
                                <%if (projetos.get(i).getStatus() == 2 || projetos.get(i).getStatus() == 5) {%>
                                <a href="#janela1" rel="modal" onclick="javascrip: paste(<%=projetos.get(i).getId()%>)">Avaliar</a>
                                <%}%>
                            </td>
                            <td style="padding: 2px;"><a href="javascript: carrega('projeto.jsp?tipo=visualizar&id=<%=projetos.get(i).getId()%>')">Visualizar Projeto</a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
            <%
                } else {
                    out.print("<center><h1>Não há projetos inseridos ainda!</h1></center>");
                }
            %>
        </div>
    </body>
</html>
