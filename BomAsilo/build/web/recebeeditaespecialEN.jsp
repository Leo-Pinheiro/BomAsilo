<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Especialidade"%>
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
                   } else if(p1 !== "adm"){
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
       
            String descEspecialidade = request.getParameter("descEspecialidade");
            Integer idEspecialidade = Integer.parseInt(request.getParameter("idEspecialidade"));
          
            Especialidade esp = new Especialidade();
            esp.setDescEspecialidade(descEspecialidade);
            esp.setIdEspecialidade(idEspecialidade);
            
            if(esp.alterarEspecialidade()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultaespecialidadeEN.jsp?pmensagem=" +URLEncoder.encode("Speciality Saved", "UTF-8"));
            } else {
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultaespecialidadeEN.jsp?pmensagem=" +URLEncoder.encode("Error in Saving Speciality", "UTF-8"));
            }          
        %>        
       <hr />
    </body>
</html>