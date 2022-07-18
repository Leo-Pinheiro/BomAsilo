<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->

<%@page import="modelos.Quarto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <titulo>Bom Asilo</titulo>
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
        //recebe os valores da tela HTML 
         
            //instancia o Paciente
            Quarto quarto = new Quarto();
            quarto.setIdQuarto(Integer.parseInt(request.getParameter("idQuarto")));
            quarto.setDescrQuarto(request.getParameter("descrQuarto"));
         
            if(quarto.alterarQuarto()){
                response.sendRedirect("consultaquartoEN.jsp?pmensagem=Room Saved");
            } else {
                response.sendRedirect("consultaquartoEN.jsp?pmensagem=Error in Saving Room");
            }          
        %>        
       <hr />
    </body>
</html>
