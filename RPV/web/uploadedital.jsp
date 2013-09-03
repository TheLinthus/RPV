<%@page import="java.text.ParseException"%>
<%@page import="model.Eixo"%>
<%@page import="model.Professor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="model.Campus"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Projeto"%>
<%@page import="model.Edital"%>
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
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    if (isMultipart) {

        try {

            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            Map map = upload.parseParameterMap(request);
            Edital info = new Edital();
            File uploadedFile = null;
            for (int i = 0; i < map.size(); i++) {

                List<FileItem> itens = (ArrayList) map.get(map.keySet().toArray()[i]);

                for (FileItem item : itens) {

                    if (item.isFormField()) {

                        if (item.getFieldName().equals("nomeEdital")) {
                            if (item.getString().equals("")) {
                                response.sendRedirect("edital.jsp?tipo=erro&mensagem=Titulo+em+branco");
                                return;
                            }
                            info.setNomeEdital(item.getString());
                        }
                        if (item.getFieldName().equals("nomeEdital")) {
                            if (item.getString().equals("")) {
                                response.sendRedirect("edital.jsp?tipo=erro&mensagem=Nome+em+branco");
                                return;
                            }
                            info.setNomeEdital(item.getString());
                        }
                        if (item.getFieldName().equals("dataInicioEdital")) {
                            try {
                                info.setInicio(formater.parse(item.getString()));
                            } catch (ParseException e) {
                                response.sendRedirect("edital.jsp?tipo=erro&mensagem=Data+de+inicio+em+formato+invalido");
                                return;
                            }
                        }
                        if (item.getFieldName().equals("dataFimEdital")) {
                            try {
                                info.setFim(formater.parse(item.getString()));
                            } catch (ParseException e) {
                                response.sendRedirect("edital.jsp?tipo=erro&mensagem=Data+de+fim+em+formato+invalido");
                                return;
                            }
                        }
                        
                        if (item.getFieldName().equals("eixo")) {
                            int eixo = Integer.parseInt(item.getString());
                            if (eixo <= 0) {
                                response.sendRedirect("edital.jsp?tipo=erro&mensagem=Eixo+invalido");
                                return;
                            }
                            info.setEixo(new Eixo(eixo, ""));
                        }
                        
                    } else {
                        if (item.getFieldName().equals("file")) {

                            uploadedFile = new File("C:/temp/" + new Date().getTime() + "_" + item.getName());

                            item.write(uploadedFile);
                        }
                    }
                }
            }

            if (uploadedFile == null) {
                response.sendRedirect("edital.jsp?tipo=erro&mensagem=Erro+ao+salvar+arquivo");
                return;
            }
            if (uploadedFile.length() == 0) {
                response.sendRedirect("edital.jsp?tipo=erro&mensagem=Nenhum+arquivo+anexado");
                return;
            }
            if (!uploadedFile.getName().endsWith(".pdf")) {
                response.sendRedirect("edital.jsp?tipo=erro&mensagem=Arquivo+anexado+nao+esta+em+formato+PDF");
                return;
            }

            Professor pr = new Professor();
            pr.setId(Integer.parseInt((String) session.getValue("id")));
        //    info.setProfessor(pr);
            info.salvar();
            new banco.Arquivos().inserirArquivo(info.getId(), uploadedFile, banco.Arquivos.PROJETO);
            
            response.sendRedirect("menu.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("edital.jsp?tipo=erro&mensagem=" + e.toString().replace(' ', '+'));
        }
    }
%>
<html>
    <head>
    </head>
    <body>
    </body>
</html>