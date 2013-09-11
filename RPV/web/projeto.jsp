<%-- 
    Document   : projeto
    Created on : Aug 11, 2013, 4:32:58 PM
    Author     : Caio Alexandre
--%>

<%@page import="model.Projeto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Campus"%>
<%@page import="model.Eixo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!private SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");%>
<%
    String tipo, titulo, nome, equipe, d_inicio, d_fim, p_execucao, id, palavraschave, mensagem;
    int eixo, campus, idarquivo;
    int status = 0;
    tipo = request.getParameter("tipo");
    eixo = campus = idarquivo = 0;
    titulo = nome = equipe = d_inicio = d_fim = palavraschave = mensagem = "";
    p_execucao = id = "1";
    ArrayList<String> listaDeCampus = new banco.JDBC().listaDeCampus();
    ArrayList<String> listaDeEixos = new banco.JDBC().listaDeEixos();
    ArrayList<String> listaDeMembros = new banco.JDBC().listaDeMembros();

    boolean view = false;
    if (tipo != null) {

        view = tipo.equals("visualizar");

        if (tipo.equals("erro")) {
            mensagem = request.getParameter("mensagem");
        } else if (tipo.equals("editar") || view) {
            id = request.getParameter("id");

            Projeto p = new Projeto();
            p.setId(Integer.parseInt(id));
            p.atualizar();

            status = p.getStatus();
            
            
            
            titulo = p.getTitulo();
            nome = p.getNome();
            equipe = p.getEquipe();
            d_inicio = formater.format(p.getInicio());
            d_fim = formater.format(p.getFim());
            id = p.getId() + "";
            palavraschave = p.getPalavraChave();
            eixo = p.getEixoId();
            campus = p.getCampusId();
            idarquivo = p.getArquivoPDF();
        }
    } else {
        tipo = "novo";
        campus = new banco.Projetos().getCampus(Integer.parseInt((String) session.getAttribute("id")));
        campus--;
    }
%>
<Script type="text/javascript">

    $(document).ready(function() {
        $("#botaoalterar").click(function(evento) {
            var inputs = document.getElementsByTagName("input");
            for (var i = 0; i < inputs.length; i++) {

                inputs[i].disabled = false;

            }
        });
    });


    $(document).ready(function() {
        $("#botaoalterar").click(function(evento) {
            var inputs = document.getElementsByTagName("select");
            for (var i = 0; i < inputs.length; i++) {

                inputs[i].disabled = false;

                $("#botaoSalvarAlteracao").css("display", "block");
                $("#botaoalterar").css("display", "none");
            }
        });
    });
    function enviarForm() {
        document.formulario.action = "alterarProjeto.jsp";
        document.forms["formulario"].submit();

    }

    $(document).ready(function() {
        $("#botaoSalvarAlteracao").css("display", "none");

    });
    $(document).ready(function() {
        $("#botaoSalvarAlteracao").click(function(evento) {

        });
    });
    
</script>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto</title>
    </head>
    <body>
        <div id='contenthead' style="height: 30px; text-align: center;">
            <h1>Envio de Projeto!</h1>
        </div> 
        <div class='centro'>
            <div style="padding-bottom: 15px;">
                <a href="menu.jsp">X Fechar</a>
            </div>
            <%if (tipo.equals("erro")) {%>
            <div id="erro" class='message'>
                <center>Erro ao salvar: <%=mensagem%></center>
            </div>
            <%}%>
            <div class='labels'>
                <p>Título:</p>
                <p>Descrição:</p>
                <p>Data Início:</p>
                <p>Data Fim:</p>
                <p>Equipe:</p>
                <p>Campus:</p>
                <p>Eixo:</p>
                <p>Palavras-Chave:</p>
                <p>Arquivo Projeto:</p>
            </div>
            <div class='form'>
                <form name="formulario" enctype="multipart/form-data" action="upload.jsp" method="post">
                    <input type="number" name="id" value="<%=id%>" hidden/>
                    <input type="text" name="tipo" value="novo" hidden/>
                    <select name="equipe" multiple hidden></select>
                    <p><input type="text" name="titulo" value="<%=titulo%>" required <%=view ? "disabled" : ""%>/></p>
                    <p><input type="text" name="nome" value="<%=nome%>" required <%=view ? "disabled" : ""%>/></p>
                    <p><input type="date" name="d_inicio" value="<%=d_inicio%>" required <%=view ? "disabled" : ""%>/></p>
                    <p><input type="date" name="d_fim" value="<%=d_fim%>" required <%=view ? "disabled" : ""%>/></p>
                    <p><input type="button" name="equipebutton" value="Equipe" disabled <%=view ? "disabled" : ""%>/></p>
                    <div class="styled-select"><p><select size="1" name="campus"  <%=view ? "disabled" : ""%>>
                                <%for (int i = 0;
                                            i < listaDeCampus.size();
                                            i++) {%>
                                <option <%if (campus == i + 1) {%>selected<%}%> value="<%=i + 1%>"><%=listaDeCampus.get(i)%></option>
                                <%}%>
                            </select>
                        </p>
                        <p><select size="1" name="eixo"  <%=view ? "disabled" : ""%>>
                                <%for (int i = 0;
                                            i < listaDeEixos.size();
                                            i++) {%>
                                <option <%if (eixo == i + 1) {%>selected<%}%> value="<%=i + 1%>"><%=listaDeEixos.get(i)%></option>
                                <%}%>
                            </select>
                        </p></div>
                    <p><input type="text" name="palavraschave" value="<%=palavraschave%>" <%=view ? "disabled" : ""%>></p>
                        <%if (!view) {%>
                    <p><input id='file' name="file" type="file"></p>
                    <p><a href="javascript: formulario()">Enviar Projeto</a></p>
                    <%} else {%>
                    <p><a href="download.jsp?file=<%=idarquivo%>">Download Arquivo</a></p>
                    <%}%>
                    <br />
                </form>

            </div>
            <BUTTON id="botaoalterar"> Habilitar Campos </BUTTON>
            <BUTTON id="botaoSalvarAlteracao" onclick="enviarForm();">Salvar Alteração</BUTTON>

        </div>
    </div>
</body>
</html>
