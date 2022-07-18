
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Funcionario"%>
<%@page import="java.sql.Date" %>
<%@page import="java.net.URLEncoder"%>
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
    Funcionario fun = new Funcionario();
 
    fun.setNome(request.getParameter("nome"));
    fun.setCpfFuncionario(request.getParameter("cpfFuncionario"));
    fun.setRg(request.getParameter("rg"));
    fun.setIdCargo(Integer.parseInt(request.getParameter("idCargo")));
    fun.setRegProfissional(request.getParameter("regProfissional"));
    fun.setDataAdmissao(Date.valueOf(request.getParameter("dataAdmissao")));
    if (!request.getParameter("dataDesliga").isEmpty()) {
       fun.setDataDesliga(Date.valueOf(request.getParameter("dataDesliga"))); 
    }
    fun.setEmailFuncionario(request.getParameter("emailFuncionario"));
    fun.setFoneFuncionario(request.getParameter("foneFuncionario"));
    fun.setLoginFuncionario(request.getParameter("loginFuncionario"));
    fun.setEnderecoFuncionario(Integer.parseInt(request.getParameter("enderecoFuncionario")));
    
    
    if (fun.incluirFuncionario()) {
            response.sendRedirect("cadastrafuncionarioEN.jsp?pmensagem=" +URLEncoder.encode("Worker Saved", "UTF-8"));
    } else {
            response.sendRedirect("cadastrafuncionarioEN.jsp?pmensagem=" +URLEncoder.encode("Error in Saving Worker", "UTF-8"));
    }
    
%>

    </body>
</html>
 