<%@page import="com.sun.org.apache.bcel.internal.generic.ALOAD"%>
<%@page import="model.Projeto"%>
<% Projeto projeto = new Projeto();

      String titulo = (String)request.getParameter("titulo");
      String id = (String)request.getParameter("id");
      
      out.println(titulo+"--"+id);
        projeto.alterarProjeto(Integer.parseInt(id),"lalala", "20130201", "20450504", titulo, "bbbb", 2, 1);
//response.sendRedirect("menu.jsp?tipo=salvo");
    %>