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
    String tipoEdital, nomeEdital,dataInicioEdital, dataFimEdital, idedital, mensagem;
    int eixo;
    tipoEdital = request.getParameter("tipoEdital");
    eixo =  0;
    nomeEdital = dataInicioEdital = dataFimEdital = mensagem = "";
    idedital = "1";
    ArrayList<String> listaDeCampus = new banco.JDBC().listaDeCampus();
    ArrayList<String> listaDeEixos = new banco.JDBC().listaDeEixos();
    ArrayList<String> listaDeMembros = new banco.JDBC().listaDeMembros();
    if (tipoEdital != null) {

        if (tipoEdital.equals("erro")) {
            mensagem = request.getParameter("mensagem");
        } else if (tipoEdital.equals("editar")) {
            nomeEdital = request.getParameter("nomeEdital");
            dataInicioEdital = request.getParameter("dataInicioEdital");
            dataFimEdital = request.getParameter("dataFimEdital");
            idedital = request.getParameter("idedital");
            } else if (tipoEdital.equals("vizualizar")) {
            nomeEdital = request.getParameter("nomeEdital");
            dataInicioEdital = request.getParameter("dataInicioEdital");
            dataFimEdital = request.getParameter("dataFimEdital");
            idedital = request.getParameter("idedital");
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
        tipoEdital = "novoEdital";
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
            <%if (tipoEdital.equals("salvo")) {%>
            <div id="ok" class='message'>
                <center>!!! Salvo com exito !!!</center>
            </div>
            <%}%>
            <%if (tipoEdital.equals("erro")) {%>
            <div id="erro" class='message'>
                <center>Erro ao salvar: <%=mensagem%></center>
            </div>
            <%}%>
            
                <div class='labels'>
                <p>Nome:</p>
                <p>Data de Abertura do Edital:</p>
                <p>Data Limite para envio de propostas:</p>
                <p>Eixo:</p>
                <p>Edital:</p>
            </div>
            <div class='form'>
                <form name="formulario" enctype="multipart/form-data" action="uploadedital.jsp" method="post">
                    <input type="number" name="idedital" value="<%=idedital%>" hidden/>
                    <input type="text" name="tipo" value="novo" hidden/>
                    <p><input type="text" name="nomeEdital" value="<%=nomeEdital%>" required autofocus/></p>
                    <p><input type="date" name="dataInicioEdital" value="<%=dataInicioEdital%>" required/></p>
                    <p><input type="date" name="dataFimEdital" value="<%=dataFimEdital%>" required/></p>
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
