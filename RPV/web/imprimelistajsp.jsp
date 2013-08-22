<%-- 
    Document   : imprimelistajsp
    Created on : 28/07/2013, 09:42:21
    Author     : Augusto
--%>
<%@page import="model.Coordenador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Projeto"%>
<%@page import="banco.JDBC"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css//estiloImprimeLista.css"/>
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
            function mandaIdLinha(id) {
                alert(id);
            }
        </script>

    </head>
    <body>
        <div id="geral">

            <div id="cabecalho">
                <h1> RP V </h1>
            </div>

            <div id="esquerda">
                <ul>
                    <li><a href="index.jsp">Pagina Inicial</a> </li>
                    <li>item </li>
                    <li>item </li>
                    <li>item </li>
                    <li>item </li>
                    <li>item </li>
                    <li>item </li>
                    <li>item </li>
                    <li>item </li>
                </ul>
            </div>



            <div class="window" id="janela1">
                <a href="#" class="fechar">X Fechar</a>
                <h4>Primeira janela modal</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam venenatis auctor tempus. Lorem ipsum dolor sit amet,</p>
                <p>Morbi dui lacus, placerat eget pretium vehicula, mollis id ligula. Nulla facilisi. </p>
            </div>

            <div id="meio">
               
                <%
                    Projeto projeto = new Projeto();
                    ArrayList<Projeto> arrayProjetos;
                    Coordenador c = new Coordenador();
                    c.setId(2);
                    arrayProjetos = projeto.listarProjetos(c);

                    //CRIA ESTRUTURA DA TABELA
                    out.println("<table id='tabela', border='1px'>");
                    out.println("<td>ID PROJETO</td>");
                    out.println("<td>P_EXECUÇÃO</td>");
                    out.println("<td>DATA INICIO</td>");
                    out.println("<td>DATA FIM</td>");
                    out.println("<td>EQUIPE</td>");
                    out.println("<td>TITULO</td>");
                    out.println("<td>PALAVRASCHAVES</td>");
                    out.println("<td>ID ARQUIVOS</td>");



                    //ADICIONA LINHAS A TABELA
                    for (int i = 0; i < arrayProjetos.size(); i++) {

                        // out.println("<tr id='linhaTabela', onclick='mandaIdLinha(" + arrayProjetos.get(i).getId() + ");'>");

                        //out.println("<form name='formulario' action='homologacao.jsp' method='post'>");
                        //out.println("<tr id='linhaTabela', onclick=location.href='#janela1'>");
                        //out.println("<tr id='linhaTabela', onclick='mandaIdLinha(" + arrayProjetos.get(i).getId() + ");'>");
                        out.println("<tr id='linhaTabela')>");
                        

                        out.println("<td >" + arrayProjetos.get(i).getPrazoDeExecucao() + "</td>");
                        
                        out.println("<td >" + arrayProjetos.get(i).getInicio() + "</td>");
                        out.println("<td >" + arrayProjetos.get(i).getFim() + "</td>");
                        out.println("<td >" + arrayProjetos.get(i).getEquipe() + "</td>");
                        out.println("<td >" + arrayProjetos.get(i).getTitulo() + "</td>");
                        
                        //out.println("<td >" + arrayProjetos.get(i).getPalavraschaves() + "</td>");
                        //out.println("<td >" + arrayProjetos.get(i).getArquivos_idarquivos() + "</td>");

                        out.println("</tr>");
                    }

                    out.println("</table>");
                %>
            </div>
          
            <a href="#janela1" rel="modal">Janela modal</a>

            <div id="rodape">
                <p> Augusto César Görgen, UNIPAMPA, Alegrete-RS </p>
            </div>

        </div>
    </body>
</html>