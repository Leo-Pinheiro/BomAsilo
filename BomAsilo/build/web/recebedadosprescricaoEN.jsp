<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="java.sql.Date"%>
<%@page import="modelos.Prescricao"%>
<%@page import="modelos.Medicamento"%>
<%@page import="modelos.Clinico"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
  <header>
             <script>
                function validaAcesso(p1){
                   if(p1 === ""){
                     alert("You need to login first!");
                     window.top.location.href = "indexEN.html";
                   } else if((p1 !== "adm") && (p1 !== "profsaude")){
                    alert("You don't have the acess to this page!"); 
                    window.top.location.href = "menuEN.jsp";
                   }
                }   
            </script> 
    </header>
    <body>
            <%
            String tipoAcesso = "";
            if (session.getAttribute("tipoAcesso") != null){
                tipoAcesso = session.getAttribute("tipoAcesso").toString();
            }
            System.out.println("Tipo:" + tipoAcesso);            
            out.write("<script>validaAcesso(\"" + tipoAcesso + "\");</script>");  
        %>
        
<%
    Prescricao pre = new Prescricao();
 
    pre.setIdClinico       (Integer.parseInt(request.getParameter("idClinico")));
    pre.setIdMedicamento   (Integer.parseInt(request.getParameter("idMedicamento")));
    pre.setDataConsulta    (Date.valueOf(request.getParameter("dataConsulta")));
    pre.setHoraConsulta    (request.getParameter("horaConsulta"));
    pre.setDescOrientacao  (request.getParameter("descOrientacao"));
    pre.setDescPosologia   (request.getParameter("descPosologia"));
    pre.setCpfPaciente     (request.getParameter("cpfPaciente"));
    if (pre.incluirPrescricao()) {
            response.sendRedirect("cadastraprescricaoEN.jsp?pmensagem=" +URLEncoder.encode("Prescription Saved", "UTF-8"));
    } else {
            response.sendRedirect("cadastraprescricaoEN.jsp?pmensagem=" +URLEncoder.encode("Error in Saving Prescription", "UTF-8"));
    }
    
%>
</body>
</html>
