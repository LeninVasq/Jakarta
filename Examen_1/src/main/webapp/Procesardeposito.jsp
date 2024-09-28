<%-- 
    Document   : Procesardeposito
    Created on : 24 ago 2024, 7:51:16 p.m.
    Author     : Vasquez
--%>

<%@page import="java.util.List"%>
<%@page import="Clases.Cuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       
         <%
    String cuenta = request.getParameter("Cuenta");
    double monto = Double.parseDouble(request.getParameter("Monto"));
    boolean cuentaAgregada = false;
    if (session.getAttribute("cuentas") != null){
            List<Cuenta> cuentas = (List<Cuenta>)
            session.getAttribute("cuentas");
            
            //buscar la cuenta por numero de cuenta  y agregar saldo
        
            for (Cuenta banco : cuentas) {

                if(banco.getCuenta().equals(cuenta)){

                banco.depositos(monto);

                cuentaAgregada = true;

                break;
                }

            }
        }
        String cuentaadd = Boolean.toString(cuentaAgregada);
String m= Double.toString(monto);
        //redirigir a visualizacion de bancos
        response.sendRedirect("Depositar.jsp?Cuenta=" + java.net.URLEncoder.encode
        (cuenta, "UTF-8")+ "&agregada="+java.net.URLEncoder.encode(cuentaadd, "UTF-8")
                + "&monto="+java.net.URLEncoder.encode(m, "UTF-8")
        );
%>

        
         
         
