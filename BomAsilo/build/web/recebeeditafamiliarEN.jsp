<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Familiar"%>
<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <h1>Familiar Editado</h1>
        <hr />
        <%
            
            //Recebe os valores da tela HTML  
            Familiar familiar = new Familiar();
            familiar.setIdFamiliar(Integer.parseInt(request.getParameter("idFamiliar")));
            familiar.setNome(request.getParameter("nome"));
            familiar.setCpfFamiliar(request.getParameter("cpfFamiliar"));
            familiar.setRg(request.getParameter("rg"));
            familiar.setFoneFixo(request.getParameter("foneFixo"));
            familiar.setFoneCelular(request.getParameter("foneCelular"));
            familiar.setCpfPaciente(request.getParameter("cpfPaciente"));
            familiar.setLoginFamiliar(request.getParameter("loginFamiliar"));
            familiar.setEnderecoFamiliar(Integer.parseInt(request.getParameter("enderecoFamiliar")));
          
            if(familiar.alterarFamiliar()){
                response.sendRedirect("consultafamiliarEN.jsp?pmensagem=" +URLEncoder.encode("Family Member Saved", "UTF-8"));
            } else {
                response.sendRedirect("consultafamiliarEN.jsp?pmensagem=" +URLEncoder.encode("Error in Saving Family Member", "UTF-8"));
            }          
        %>        
       <hr />
    </body>
</html>
