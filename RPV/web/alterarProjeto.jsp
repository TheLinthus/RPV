<%@page import="com.sun.org.apache.bcel.internal.generic.ALOAD"%>
<%@page import="model.Projeto"%>
<% Projeto projeto = new Projeto();

    String titulo = (String) request.getParameter("titulo");
    String id = (String) request.getParameter("id");
    String nome = (String) request.getParameter("nome");
    String d_inicio = (String) request.getParameter("d_inicio");
    String d_fim = (String) request.getParameter("d_fim");
    String campus = (String) request.getParameter("campus");
    String eixo = (String) request.getParameter("eixo");
    String palavraschave = (String) request.getParameter("palavraschave");


    projeto.alterarProjeto(Integer.parseInt(id), nome, d_inicio, d_fim, titulo, palavraschave, Integer.parseInt(eixo), Integer.parseInt(campus));
    response.sendRedirect("menu.jsp?tipo=visualizar");
%>