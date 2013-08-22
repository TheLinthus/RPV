<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <title>Projetos &minus; </title>
    <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8">
    <link rel="stylesheet" type="text/css" media="screen" href="css/layout1.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/dock-example1.css">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/fisheye-iutil.min.js"></script>
    <script type="text/javascript" src="js/dock-example1.js"></script>
</head>
<body onload="<%=(request.getParameter("tipo") != null) ? "go()" : ""%>">
    <%//Verifica se está logado
        if (session.getValue("loginUsuario") != null || session.getValue("senhaUsuario") != null) {
//out.println("Você está logado com sucesso no sistema, por isso consegue ver está pagina. Seu login é: " + session.getValue("loginUsuario") + " e sua senha: " + session.getValue("senhaUsuario") + ". Clique <a href='logof.jsp'>aqui</a> para sair do sistema");
%>

    <div class="wrap background">
        <!-- end div #header -->

        <!-- BEGIN DOCK 1 ============================================================ -->
        <div id="dock">
            <div class="dock-container" >
                <ul id="menu"><%
                    if (session.getValue("autorizacao").equals("coordenador")) {
                    %>
                    <li><a class="dock-item" href="menu.jsp"><span>Home</span><img src="images/dock/home.png" alt="home" id="home" /></a> </li>
                    <li><a class="dock-item" onclick="carrega('projetos.jsp')"><span>Arquivos</span><img src="images/dock/portfolio.png" alt="portfolio" /></a> </li>
                    <!--<li><a class="dock-item" onclick="carrega('projetos.jsp')"><span>Proejtos</span><img src="images/dock/email.png" alt="Projetos" /></a> </li>
                    <li><a class="dock-item" href="projetos.jsp"><span>Arquivos</span><img src="images/dock/portfolio.png" alt="portfolio" /></a> </li>-->
                    <!--<li><a class="dock-item" href="#"><span>Projetos</span><img src="images/dock/link.png" alt="links" /></a> </li>
                    <li><a class="dock-item" href="#"><span>armazenamento</span><img src="images/dock/rss.png" alt="rss" /></a> </li>
                    -->
                    <li><a class="dock-item" href="logof.jsp"><span>SAIR</span><img src="images/dock/logoff.png" alt="SAIR" /></a> </li>   
                            <%                                    }

                                if (session.getValue("autorizacao").equals("professor")) {
                            %>
                    <li><a class="dock-item" href="menu.jsp"><span>Home</span><img src="images/dock/home.png" alt="home" id="home" /></a> </li>
                    <li><a class="dock-item" onclick="carrega('visualizarProjetos.jsp')"><span>Arquivos</span><img src="images/dock/portfolio.png" alt="portfolio" /></a> </li>
                    <li><a class="dock-item" href="logof.jsp"><span>SAIR</span><img src="images/dock/logoff.png" alt="SAIR" /></a> </li>   
                            <%                                    }
                            %>


                </ul>
            </div> <!-- end div .dock-container -->
        </div><!-- end div .dock #dock -->
        <!-- END DOCK 1 ============================================================ -->          
    </div><!-- end div .wrap -->
    <div id="corpo" style=" margin-top: 50px; min-height: 80px;">

    </div>
    
    <%
        } else {
            out.println("Você não está logado no sistema. Clique <a href='index.html'>aqui</a> para logar-se");
        }
    %>
    <script>
    
        function carrega(pagina) {
            $("#corpo").html( '<center><img src="imagens/loading.gif" /></center>' );   
            $("#corpo").load(pagina);
        }
 
        function sleep(milliseconds) {
            var start = new Date().getTime();
            for (var i = 0; i < 1e7; i++) {
                if ((new Date().getTime() - start) > milliseconds){
                    break;
                }
            }
        }
        function formulario() {
            if(document.formulario.d_inicio.value=="") {
                alert("Campo Data de Inicio deve ser preenchido.");
                return;
            }
            if(document.formulario.d_fim.value=="") {
                alert("Campo Data de Fim deve ser preenchido.");
                return;
            }
            if(document.formulario.nome.value=="") {
                alert("Campo Descrição deve ser preenchido.");
                return;
            }
            if(document.formulario.titulo.value=="") {
                alert("Campo Titulo deve ser preenchido.");
                return;
            }
            var fup = document.formulario.file;
            var fileName = fup.value;
            if (fileName==null || fileName.length < 4) {
                alert("Arquivo não anexado ao formulario.");
                fup.focus();
                return;
            }
            var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
            if (ext != "pdf") {
                alert("Arquivo em formato invalido, somente PDF.");
                fup.focus();
                return;
            }
            var d_inicio = new Date(document.formulario.d_inicio.value);
            var d_fim = new Date(document.formulario.d_fim.value);
            if (d_fim.getTime() <= d_inicio.getTime()   ) {
                alert("Data de fim não pode ser menor que de inicio.");
            } else {
                document.formulario.submit();
            }
        }
    </script>

    <%
        if (request.getParameter("tipo") != null) {
    %>
    <script type="text/javascript">
        function go() {
            carrega('<%=session.getValue("autorizacao").equals("coordenador") ? "projetos.jsp" : "visualizarProjetos.jsp"%>');
        }
    </script>
    <%        }
    %>

