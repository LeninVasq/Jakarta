<%-- 
    Document   : procesarretiro
    Created on : 25 ago 2024, 8:29:28 p. m.
    Author     : Vasques
--%>

<%@page import="java.util.List"%>
<%@page import="Clases.Cuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
        //Obtener los parametros del formulario
         String Cuenta = request.getParameter("Cuenta") ;
         double Saldo = Double.parseDouble(request.getParameter("Monto")) ;
         double monto1 = 0;
         boolean cuentaAgregada = false;
         out.println("<Label>"+ Cuenta +"</Label>");
         out.println("<Label>"+ Saldo +"</Label>");
         //Verificar si la sesión existe y si hay bancos en la lista
         if (session.getAttribute("cuentas") != null){
           List<Cuenta> cuentas = (List<Cuenta>)
            session.getAttribute("cuentas");
            
            //buscar la cuenta por numero de cuenta  y retirar saldo
        
            for (Cuenta banco : cuentas) {

                if(banco.getCuenta().equals(Cuenta)){

                banco.retirar(Saldo);
                cuentaAgregada = true;
                break;
                }

            }
            
                     
        }
         
        //redirigir a visualizacion de bancos
          String cuentaadd = Boolean.toString(cuentaAgregada);
String m= Double.toString(Saldo);
        //redirigir a visualizacion de bancos
        response.sendRedirect("retirar.jsp?Cuenta=" + java.net.URLEncoder.encode
        (Cuenta, "UTF-8")+ "&agregada="+java.net.URLEncoder.encode(cuentaadd, "UTF-8")
                + "&monto="+java.net.URLEncoder.encode(m, "UTF-8")
        );
         
         %>
    