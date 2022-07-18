<%@page import="modelos.Rotina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            Integer pIdEvento = Integer.parseInt(request.getParameter("idEvento"));
            Rotina r = new Rotina();
            if (pIdEvento != null) {
                r.consultarRotina(pIdEvento);
                if (r.excluirRotina()) {
                    response.sendRedirect("consultarotinaEN.jsp?pmensagem=Routine Sucessfully Deleted");
                } else {
                    response.sendRedirect("consultarotinaEN.jsp?pmensagem=Error in Deleting Routine");
                }
            }
        %>
        <hr />
    </body>
</html>
