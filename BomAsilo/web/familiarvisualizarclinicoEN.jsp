<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Clinico"%>
<%@page import="modelos.Prontuario"%>
<%@page import="modelos.Endereco"%>
<%@page import="modelos.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Familiar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilosconsulta.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
        <script src="scripts/formatacampos.js"></script>
    </head>
    <header>
        <script>
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("You need to login first!");
                    window.top.location.href = "indexEN.html";
                } else if (p1 !== "familiar") {
                    alert("You don't have the acess to this page!");
                    window.top.location.href = "menufamiliarEN.jsp";
                }
            }
        </script> 

        <body>
            <%
                String tipoAcesso = "";
                if (session.getAttribute("tipoAcesso") != null) {
                    tipoAcesso = session.getAttribute("tipoAcesso").toString();
                }
                System.out.println("Tipo:" + tipoAcesso);
                out.write("<script>validaAcesso('" + tipoAcesso + "');</script>");
            %>

            <label>
                <%
                    if (request.getParameter("pmensagem") != null) {
                        out.write(request.getParameter("pmensagem"));
                    }
                    Clinico cli = new Clinico();
                    List<Clinico> cl = cli.consultarGeral();
                %>
            </label>
            <h1>Doctor's Info</h1>

            <table class="table table-striped">
                <thead> 
                <th scope="col">Doctor's Name</th>
                <th scope="col">Registration Code</th>
                <th scope="col">Medical Speciality</th>
                <thead>
                <tbody>

                    <% for (Clinico c : cl) { %>
                    <tr>
                        <td><% out.write("" + c.getNomeClinico());   %></td>
                        <td><% out.write("" + c.getCodRegistro());  %></td>
                        <td><% out.write("" + c.getEspecialidadeClinico().getDescEspecialidade());%></td>

                    </tr> 
                    <%}%>
                </tbody>
            </table>


            <input type="reset" value="Cancel" onclick="window.top.location.href = 'menufamiliarEN.jsp';" /><br />

        </body>   
    </header>
</html>
