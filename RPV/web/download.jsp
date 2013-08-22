<%@ page import="java.io.*"%>
<%
    if (request.getParameter("file") != null) {
        final int ID_ARQUIVO = Integer.parseInt(request.getParameter("file"));

        File ff = new banco.Arquivos().resgatarArquivo(ID_ARQUIVO);
        int length = 0;
        ServletOutputStream outStream = response.getOutputStream();
        ServletContext context = getServletConfig().getServletContext();
        String mimetype = context.getMimeType(ff.getPath());

        // sets response content type
        if (mimetype == null) {
            mimetype = "application/octet-stream";
        }
        response.setContentType(mimetype);
        response.setContentLength((int) ff.length());
        String fileName = (new File(ff.getPath())).getName();

        // sets HTTP header
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
 
        byte[] byteBuffer = new byte[4096];
        DataInputStream in = new DataInputStream(new FileInputStream(ff));

        // reads the file's bytes and writes them to the response stream
        while ((in != null) && ((length = in.read(byteBuffer)) != -1)) {
            outStream.write(byteBuffer, 0, length);
        }

        in.close();
        outStream.close();
    }
%>
<html>
    <head>
    </head>
    <body onLoad="closeWindow()">
        <script type="text/javascript">
            function closeWindow(ifClose) {
                if (ifClose) {
                    window.close();
                }
            }
        </script>
    </body>
</html>