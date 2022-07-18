<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Prontuario"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.Date"%>
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
           float pe = Float.parseFloat(request.getParameter("peso"));
           float a = Float.parseFloat(request.getParameter("altura"));
           float imc;
       
           imc = pe / (a * a);
           
            Prontuario p = new Prontuario();
            p.setIdProntuario(Integer.parseInt(request.getParameter("idprontuario")));
            p.setTipoSangue(request.getParameter("tiposangue"));
            p.setPeso(pe);
            p.setAltura(a);
            p.setImc(imc);
            
            String limitCognitiva = request.getParameter("limitCognitiva");
            if (limitCognitiva != null) {
            p.setLimitCognitiva(true);
            }
            String limitLocomocao = request.getParameter("limitLocomocao");
            if (limitLocomocao != null) {
            p.setLimitLocomocao(true);
            }
            String limitVisao = request.getParameter("limitVisao");
            if (limitVisao != null) {
            p.setLimitVisao(true);
            }
            String limitAudicao = request.getParameter("limitAudicao");
            if (limitAudicao != null) {
            p.setLimitAudicao(true);
            }
             
            p.setLimitOutras(request.getParameter("limitOutras"));
            p.setDescAlergia(request.getParameter("descAlergia"));
            p.setDescOcupacao(request.getParameter("descOcupacao"));
            p.setCpfPaciente(request.getParameter("cpfPaciente"));
            p.setDataConsulta(Date.valueOf(request.getParameter("dataConsulta")));
            System.out.println(p);
            
            if(p.alterarProntuario()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultaprontuarioEN.jsp?pmensagem=" +URLEncoder.encode("Prontuary Saved", "UTF-8"));
            } else {
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultaprontuarioEN.jsp?pmensagem=" +URLEncoder.encode("Error in Saving Prontuary", "UTF-8"));
            }          
        %>        
       <hr />
    </body>
</html>
