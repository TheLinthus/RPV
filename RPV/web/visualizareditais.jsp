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
    ArrayList<model.Projeto> projetos   ;
    model.Coordenador c = new model.Coordenador();
    int id = 1;
//    try {
//        id = Integer.parseInt((String) session.getAttribute("id"));
//        possui_id = true;
//    } catch (Exception ex) {
//        response.sendRedirect("index.html");
//    }
    c.setId(id);
    projetos = model.Projeto.listarProjetos(c);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projetos</title>
        <link rel="stylesheet" type="text/css" href="css//projetos.css"/>
        <link rel="stylesheet" type="text/css" href="css//modal.css"/>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"></script> 
        <script type="text/javascript">

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
                
            
            function enviar_formulario() {
                document.formulario1.submit();


            }
            function enviasegundoform() {
                document.formulario2.submit();
            }

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
                        $("#formularioJust").css("display", "none");
                    }
                });
            });
            $(document).ready(function() {
                $("#enviarEmail").click(function(evento) {
                    //window.opener(document.formulario1.submit() & document.formulario2.submit());
                    disp("email_&_status.jsp", "email", fullScreen = false, document.formulario1.submit());
                    //window.open("upload.jsp", "upload", fullScreen = false, document.formulario2.submit());

                }
            );
            });
            $(document).ready(function() {
                $("#enviarArquivo").click(function(evento) {
                    //window.opener(document.formulario1.submit() & document.formulario2.submit());
                    //disp("upload.jsp", document.formulario2.submit());
                    disp("upload.jsp", document.formulario2.submit());
                    //window.open("upload.jsp", "upload", fullScreen = false, document.formulario2.submit());

                }
            );
            });

        </script>


    </head>
    <body>
        <div id="mascara">
        </div>
        <div class="window" id="janela1">
            <a href="#" class="fechar">X Fechar</a> 

            <form action="email_&_status.jsp" method="post" name="formulario1" id="form1">
                <br>
                <input type="radio" name="homologacao" value="homologar" id="homologar">HOMOLOGAR
                <input type="radio" name="homologacao" value="naohomologar" id="naohomologar" />NÃO HOMOLOGAR<br>
                E-mail<input type="text" name="email">
                <br />
                <div id="formularioJust" style="display: none; border: 0px">
                    Justificativa <input  type="text" name="texto" />
                </div>
            </form>


            <!-- <a href="javascript:enviar_formulario()">Enviar formulario</a--> 

            <div id="divUp">
                <form enctype="multipart/form-data" action="upload.jsp" method=POST name="formulario2" id="form2">
                    <center>
                        <table>

                            <tr>
                                <td colspan="2" align="center"><B>UPLOAD THE FILE</B>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"></td>
                            </tr>
                            <tr>
                                <td><b>Choose the file To Upload:</b></td>
                                <td><INPUT NAME="file" TYPE="file"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"></td>
                            </tr>
                        </table>
                    </center>
                </form>

            </div>
            <input type="button" id="enviarEmail" value="ENVIAR E-MAIL"/>
            <input type="button" id="enviarArquivo" value="CADASTRAR ARQUIVO"/>

        </div>
        <div class='centro'>
            <div class='tabela'>
                <table id='tabela' border='1px'>
                    <tr class='header'>
                        <td id='nome'>NOME</td>
                        <td id='inicio'>DATA INÍCIO</td>
                        <td id='fim'>DATA FIM</td>
                        <td id='arquivo'>ARQUIVO</td>
                    </tr>
                    <%for (int i = 0; i < editais.size(); i++) {%>
                    <tr class='linhatabela' id="linha <%=editais.get(i).getId()%>" onmouseover="hover(editais.get(i).getId())">
                        <td><input disabled type="text" name="id" id='id' value="<%=editais.get(i).getId()%>"></td>
                        <td><input disabled type="text" name="nome" id='nome' value="<%=editais.get(i).getNome()%>"></td>
                        <td><input disabled type="text" name="d_inicio" id='inicio' value="<%=formater.format(editais.get(i).getInicio())%>"></td>
                        <td><input disabled type="text" name="d_fim" id='fim' value="<%=formater.format(editais.get(i).getFim())%>"></td>
                        <td><img src="imagens/icone_pdf.jpg"/></td>
                    </tr>
                    <%}%>
                </table>
    </body>
</html>

