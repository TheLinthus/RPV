<%@page import="java.text.ParseException"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.ALOAD"%>
<%@page import="model.Projeto"%>
<% Projeto projeto = new Projeto();

    String status = "";
    String titulo = "";
    String id = "";
    String nome = "";
    String d_inicio = "";
    String d_fim = "";
    String eixo = "";
    String palavraschave = "";
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (isMultipart) {


        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        Map map = upload.parseParameterMap(request);
        // Projeto info = new Projeto();


        for (int i = 0; i < map.size(); i++) {

            List<FileItem> itens = (ArrayList) map.get(map.keySet().toArray()[i]);

            for (FileItem item : itens) {

                if (item.getFieldName().equals("titulo")) {

                    titulo = item.getString();
                }
                if (item.getFieldName().equals("status")) {

                    status = item.getString();
                }
                if (item.getFieldName().equals("id")) {

                    id = item.getString();
                }
                if (item.getFieldName().equals("nome")) {

                    nome = item.getString();
                }
                if (item.getFieldName().equals("d_inicio")) {

                    d_inicio = item.getString();
                }
                if (item.getFieldName().equals("d_fim")) {

                    d_fim = item.getString();
                }
               

                if (item.getFieldName().equals("eixo")) {

                    eixo = item.getString();
                }

                if (item.getFieldName().equals("palavraschave")) {

                    palavraschave = item.getString();
                }
            }
        }
        // out.println("titulo= " + titulo + " campus= " + campus + " diafim= " + d_fim + " diainicio= " + d_inicio + " eixo= " + eixo + " id= " + id + " nome= " + nome + " palavras= " + palavraschave);
        projeto.alterarProjeto(Integer.parseInt(id),Integer.parseInt(status), nome, d_inicio, d_fim, titulo, palavraschave, Integer.parseInt(eixo));
        response.sendRedirect("menu.jsp");

       // out.println("status= "+status);
    }
    /* if (item.getFieldName().equals("email")) {
     //info.setTitulo(item.getString());
     email.setEmail(item.getString());
     }
     */
    /*                    
         

     out.println(titulo +"-"+ campus +"-"+ d_fim +"-"+ d_inicio +"-"+ eixo +"-"+ id +"-"+ nome +"-"+ palavraschave);
    
     * 
     * 
     */



%>