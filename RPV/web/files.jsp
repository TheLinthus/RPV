<%-- 
    Document   : files
    Created on : Aug 5, 2013, 4:18:03 AM
    Author     : Caio Alexandre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciador de Arquivos 1.0</title>
    </head>
    <body>
        <div id="meio">
            <form enctype="multipart/form-data" action="upload.jsp" method=post>
                <center>
                    <table border="0" bgcolor=#ccFDDEE>
                        <tr>
                            <td colspan="2" align="center"><B>UPLOAD THE FILE</B>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"></td>
                        </tr>
                        <tr>
                            <td><b>Choose the file To Upload:</b></td>
                            <td><INPUT NAME="file" TYPE="file"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"><input type="submit" 
                                                                  value="Send File"></td>
                        </tr>
                    </table>
                </center>
            </form>
            <br>
            <br>
            <form enctype="multipart/form-data" action="download.jsp" method=GET>
                <center>
                    <table border="0" bgcolor=#ccFDDEE>
                        <tr>
                            <td colspan="2" align="center"><B>DOWNLOAD THE FILE</B>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"></td>
                        </tr>
                        <tr>
                            <td><b>Choose the file To Download:</b></td>
                            <td><INPUT NAME="file" TYPE="text"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"><input type="submit" 
                                                                  value="Get File"></td>
                        </tr>
                    </table>
                </center>
            </form>
        </div>
        <div id="rodape">
            <p> Caio Alexandre, UNIPAMPA, Alegrete-RS </p>
        </div>
    </body>
</html>