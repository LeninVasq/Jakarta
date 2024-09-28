<%-- 
    Document   : Procesarcuenta
    Created on : 18 ago 2024, 3:14:15 p. m.
    Author     : Vasques
--%>
<%@page import="Clases.bancos"%>
<%@page import="clases.Banco"%>
import java.util.HashSet;
import java.util.Random;
import java.util.Set;
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
       //Obtener los parametros del formulario 
        String nombre = request.getParameter("Nombre") ;
        String Cuenta = request.getParameter("Cuenta") ;
        double Saldo = Double.parseDouble(request.getParameter("Saldo")) ;
        
        //si la session no existe la creamos 
        if (session.getAttribute("bancolist") == null){
            session.setAttribute("bancolist", new java.util.ArrayList<bancos>());
        }

        //obtenemos la lista de bancos de la session

        java.util.List<bancos> bancolist = (java.util.List<bancos>) // estoy convirtiendo
        session.getAttribute("bancolist");
        
        //crear un nuevo banco y agregarlo ala lista 
        bancos nuevoBanco = new  bancos(nombre, Cuenta,Saldo);
        bancolist.add(nuevoBanco);
        
        //redirigir a la pagina  de visualizacion de Bancos
        response.sendRedirect("verBanco.jsp");
        
        
        %>

    </body>
</html>
