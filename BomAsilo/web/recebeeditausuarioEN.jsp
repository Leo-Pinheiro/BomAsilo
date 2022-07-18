<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Usuario" %>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
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
    <body>
         <%
            String TipoAcesso = "";
            if (session.getAttribute("tipoAcesso") != null){
                TipoAcesso = session.getAttribute("tipoAcesso").toString();
            }
            System.out.println("Tipo:" + TipoAcesso);            
            out.write("<script>validaAcesso(\"" + TipoAcesso + "\");</script>");  
        %>
        
    <%
        //recebe os valores da tela HTML  
            String emailUsuario    = request.getParameter("emailUsuario");
            String login   = request.getParameter("login");
            String senha  = request.getParameter("senha");
            String tipoAcesso  = request.getParameter("tipoAcesso");
          
            //instancia o Usuario
            Usuario us = new Usuario();
            us.setEmailUsuario(emailUsuario);
            us.setLogin(login);
            us.setSenha(senha);
            us.setTipoAcesso(tipoAcesso);
          
            if(us.alterarUsuario()){
                response.sendRedirect("consultausuarioEN.jsp?pmensagem=" +URLEncoder.encode("User Saved", "UTF-8"));
            } else {
                response.sendRedirect("consultausuarioEN.jsp?pmensagem=" +URLEncoder.encode("Error in Saving User", "UTF-8"));
            }          
        %>        
      
      </body>
</html>

