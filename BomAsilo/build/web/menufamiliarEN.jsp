<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <!DOCTYPE html>
    <head>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="styles/menustyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//code-sa1.jivosite.com/widget/7BEqBwjT8Y" async></script>
        <link rel="icon" type="image/favicon" href="imagens/favicon.ico" />
        <title>Bom Asilo</title>
    </head>
    <body>

        <script>
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("You need to login first!");
                    window.top.location.href = "index.html";
                }
            }
        </script> 


        <%
            String tipoAcesso = "";
            if (session.getAttribute("tipoAcesso") != null) {
                tipoAcesso = session.getAttribute("tipoAcesso").toString();
            }
            System.out.println("Tipo:" + tipoAcesso);
            out.write("<script>validaAcesso('" + tipoAcesso + "');</script>");
        %>

        <div class="topnav" id="myTopnav">
            <a href="menufamiliarEN.jsp" class="active"> Home <i class="fa fa-solid fa-house-user"></i></a>
            <a href="familiaralterarusuarioEN.jsp" target="janela_prog">User</a>
            <a href="familiarvisualizarclinicoEN.jsp" target="janela_prog">Doctors</a>
            <a href="familiarvisualizarfamiliarEN.jsp" target="janela_prog">About Me</a>                     
            <a href="familiarvisualizarpacienteEN.jsp" target="janela_prog">Patient's Info</a>
            <a href="familiarvisualizarprescricaoEN.jsp" target="janela_prog">Prescription</a>
            <a href="familiarvisualizarprontuarioEN.jsp" target="janela_prog">Prontuary</a>
            <a href="familiarvisualizarrotinaEN.jsp" target="janela_prog">Routine</a>
            <a href="logoutEN.jsp" class="active"> Logout <i class='fa-solid fa-house' style='font-size:8px;color:white'></i></a>
             
             <a type="button" id="ingles" href="menufamiliarEN.jsp">
                 <img src="imagens/eua.png" width="24" align="center"/></a>
           
            <a type="button" id="brasil" href="menufamiliar.jsp"> 
                <img src="imagens/br2.png" width="24" align="center"/></a>       
        </div>

        <div class="main">
            <iframe name="janela_prog" src="homefamiliarEN.jsp" element.mozRequestFullScreen()></iframe>
        </div>
    </body>
</html>