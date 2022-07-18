<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->

<%@page import="modelos.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
    </head>
    <header>
        <script>
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("You need to login first!");
                    window.top.location.href = "indexEN.html";
                } else if ((p1 !== "adm") && (p1 !== "profsaude")) {
                    alert("You don't have the acess to this page!");
                    window.top.location.href = "menuEN.jsp";
                }
            }
        </script> 
    </header>
    <body>
        <%
            String tipoAcesso = "";
            if (session.getAttribute("tipoAcesso") != null) {
                tipoAcesso = session.getAttribute("tipoAcesso").toString();
            }
            System.out.println("Tipo:" + tipoAcesso);
            out.write("<script>validaAcesso(\"" + tipoAcesso + "\");</script>");
        %>

        <%
            Integer idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
            Paciente p = new Paciente();
            if (idPaciente != null) {
                p = p.consultarPacienteId(idPaciente);
                if (p.excluirPaciente()) {
                    response.sendRedirect("consultapacienteEN.jsp?pmensagem=" + URLEncoder.encode("Patient Sucessfully Deleted", "UTF-8"));
                } else {
                    response.sendRedirect("consultapacienteEN.jsp?pmensagem=" + URLEncoder.encode("Error in Deleting Patient", "UTF-8"));
                }
            } else {
                response.sendRedirect("consultapacienteEN.jsp?pmensagem=" + URLEncoder.encode("PATIENT NOT FOUND", "UTF-8"));
            }
        %>
        <hr /> 
    </body>
</html>
