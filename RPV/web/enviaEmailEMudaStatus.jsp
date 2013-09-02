<%@page import="banco.Arquivos"%>
<%@page import="mail.Email"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="model.Campus"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Projeto"%>
<%@page import="java.io.File"%>  
<%@page import="java.io.IOException"%>  
<%@page import="java.util.Date"%>  
<%@page import="java.util.List"%>  
<%@page import="javax.servlet.ServletException"%>  
<%@page import="javax.servlet.http.HttpServlet"%>  
<%@page import="javax.servlet.http.HttpServletRequest"%>  
<%@page import="javax.servlet.http.HttpServletResponse"%> 
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%!private SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");%>
<%
    String idrequest = "";
    if (request.getParameter("id") != null) {
        idrequest = request.getParameter("id");

    }
    int id = Integer.parseInt(idrequest);
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (isMultipart) {

        try {

            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            Map map = upload.parseParameterMap(request);
            // Projeto info = new Projeto();
            Email email = new Email();
            Projeto projeto = new Projeto();

            File uploadedFile = null;
            String homologacao = null;

            for (int i = 0; i < map.size(); i++) {

                List<FileItem> itens = (ArrayList) map.get(map.keySet().toArray()[i]);

                for (FileItem item : itens) {

                    if (item.isFormField()) {
                        int retorno;

                        out.print("<li>" + item.getFieldName() + " = ");
                        out.println(item.getString() + "</li>");

                        /* if (item.getFieldName().equals("email")) {
                         //info.setTitulo(item.getString());
                         email.setEmail(item.getString());
                         }
                         */
                        email.setEmail(id);
                        if (item.getFieldName().equals("texto")) {
                            if(item.getString() != ""){
                                email.setJustificativa(item.getString());}
                            
                        }else{
                            email.setJustificativa("Projeto Homologado!");
                        
                        }
                        
                        
                        if (item.getFieldName().equals("homologacao")) {
                            //info.setTitulo(item.getString());
                            homologacao = item.getString();
                        }



                    } else {
                        if (item.getFieldName().equals("ata1")) {
                            response.getWriter().println("File income...");
                            response.getWriter().println("<li>FileName:" + item.getName());
                            response.getWriter().println(" " + item.getSize() + "Kb</li>");
                            uploadedFile = new File("C:/temp/" + new Date().getTime() + "_" + item.getName());

                            item.write(uploadedFile);
                            Arquivos arq = new Arquivos();
                            arq.inserirArquivo(id, uploadedFile, 1);

                        }
                        if (item.getFieldName().equals("ata2")) {
                            response.getWriter().println("File income...");
                            response.getWriter().println("<li>FileName:" + item.getName());
                            response.getWriter().println(" " + item.getSize() + "Kb</li>");
                            uploadedFile = new File("C:/temp/" + new Date().getTime() + "_" + item.getName());

                            item.write(uploadedFile);
                            Arquivos arq = new Arquivos();
                            arq.inserirArquivo(id, uploadedFile, 2);

                        }
                    }
                }

            }
            out.println("<br />EMAIL : " + email.getEmail());
            out.println("<br />JUSTIFICATIVA : " + email.getJustificativa());
            out.println("<br />HOMOLOGAÇÃO : " + homologacao);
            out.println("<br />");

            email.mandarEmail();
            if (homologacao == null) {
                //response.sendRedirect("projetos.jsp?tipo=erro&mensagem=Selecione uma alternativa");
                //  request.setAttribute("msgerror", "Usuário e/ou senha inválida!");
                //RequestDispatcher rd = request.getRequestDispatcher("projetos.jsp//janela1");
                //rd.forward(request,response);
            }

            if (homologacao.equalsIgnoreCase("naohomologar")) {
                projeto.alterarhomologacao(id, 3);
                //response.sendRedirect("projetos.jsp?tipo=erro&mensagem=Nao+Homologado");

            }
            if (homologacao.equalsIgnoreCase("homologar")) {
                projeto.alterarhomologacao(id, 4);
                // response.sendRedirect("projetos.jsp?tipo=erro&mensagem=Homologado");
            } else if (homologacao == null) {
                //out.println("<br /> NÃO SELECIONADO");
                //   response.sendRedirect("projetos.jsp?tipo=erro&mensagem=Nao+selecionado+homologacao");
            }
            if (uploadedFile == null) {
                //    response.sendRedirect("projetos.jsp?tipo=erro&mensagem=Erro+ao+salvar+arquivo");
            }
//
//            info.salvar();
//            new banco.Arquivos().inserirArquivo(info.getId(), uploadedFile,banco.Arquivos.PROJETO);
//
//            response.sendRedirect("projeto.jsp?tipo=salvo");
        } catch (Exception e) {
            //  response.sendRedirect("projeto.jsp?tipo=erro&mensagem=" + e.getMessage().replace(' ', '+'));
        }
    }
    response.sendRedirect("menu.jsp?tipo=salvo");
%>
<html>
    <head>

    </head>
    <body>
        <%out.print("Augusto César Görgen");%>
    </body>
</html>