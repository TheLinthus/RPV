<%-- 
    Document   : edital
    Created on : Aug 21, 2013, 7:44:50 PM
    Author     : Garcia
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Eixo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!private SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");%>
<%
    String tipo, nome,d_inicio, d_fim, id, mensagem;
    int eixo;
    tipo = request.getParameter("tipo");
    eixo =  0;
    nome = d_inicio = d_fim = mensagem = "";
    id = "1";
    ArrayList<String> listaDeCampus = new banco.JDBC().listaDeCampus();
    ArrayList<String> listaDeEixos = new banco.JDBC().listaDeEixos();
    ArrayList<String> listaDeMembros = new banco.JDBC().listaDeMembros();
    if (tipo != null) {

        if (tipo.equals("erro")) {
            mensagem = request.getParameter("mensagem");
        } else if (tipo.equals("editar")) {
            nome = request.getParameter("nome");
            d_inicio = request.getParameter("d_inicio");
            d_fim = request.getParameter("d_fim");
            id = request.getParameter("id");
            } else if (tipo.equals("vizualizar")) {
            nome = request.getParameter("nome");
            d_inicio = request.getParameter("d_inicio");
            d_fim = request.getParameter("d_fim");
            id = request.getParameter("id");
            }
//        try {
//            eixo = Integer.parseInt(request.getParameter("eixo"));
//        } catch (NumberFormatException e) {
//            eixo = 1;
//        }
//        try {
//            campus = Integer.parseInt(request.getParameter("campus"));
//        } catch (NumberFormatException e) {
//            campus = 1;
//        }
//        if (tipo.equals("novo")) {
//            model.Projeto p = new model.Projeto();
//            p.setEixo(new Eixo(eixo, listaDeEixos.get(eixo)));
//            p.setCampus(new Campus(campus, listaDeCampus.get(campus)));
//            p.setEquipe(equipe);
//            p.setFim(formater.parse(d_fim));
//            p.setInicio(formater.parse(d_inicio));
//            p.setId(Integer.parseInt(id));
//            p.setNome(nome);
//            p.setTitulo(titulo);
//            p.setPalavrasChave(palavraschave.replace(' ', ',').split(","));
//            p.setPrazoDeExecucao(Integer.parseInt(p_execucao));
//            if (salvo = p.salvar()) {
//                titulo = nome = equipe = d_inicio = d_fim = palavraschave = "";
//                p_execucao = id = "1";
//            }
//        }
    } else {
        tipo = "novo";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo Edital</title>
        <link rel="stylesheet" type="text/css" href="css//form.css"/>
    </head>
    <body>
        <div class='centro'>
            <%if (tipo.equals("salvo")) {%>
            <div id="ok" class='message'>
                <center>!!! Salvo com exito !!!</center>
            </div>
            <%}%>
            <%if (tipo.equals("erro")) {%>
            <div id="erro" class='message'>
                <center>Erro ao salvar: <%=mensagem%></center>
            </div>
            <%}%>
            <div class='labels'>
                <p>Nome:</p>
                <p>Data Início:</p>
                <p>Data Fim:</p>
                <p>Eixo:</p>
                <p>Arquivo PDF:</p>
            </div>
            <div class='form'>
                <form name="formulario" enctype="multipart/form-data" action="upload.jsp" method="post">
                    <input type="number" name="id" value="<%=id%>" hidden/>
                    <input type="text" name="tipo" value="novo" hidden/>
                    <p><input type="text" name="nome" value="<%=nome%>" required/></p>
                    <p><input type="date" name="d_inicio" value="<%=d_inicio%>" required/></p>
                    <p><input type="date" name="d_fim" value="<%=d_fim%>" required/></p>
                    <div class="styled-select">
                         <p><select size="0" name="eixo" >
                                <%for (int i = 0;
                                            i < listaDeEixos.size();
                                            i++) {%>
                                <option <%if (eixo == i) {%>selected<%}%> value="<%=i + 1%>"><%=listaDeEixos.get(i)%></option>
                                <%}%>
                            </select>
                        </p></div>
                    <p><input id='file' name="file" type="file"></p>
                    <p><input type="submit" value="Enviar Edital"></p>
                </form>
            </div>
        </div>
    </body>
</html>