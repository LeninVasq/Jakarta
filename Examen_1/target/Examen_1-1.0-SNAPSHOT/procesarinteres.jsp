<%-- 
    Document   : procesarinteres
    Created on : 25 ago 2024, 9:48:26 p. m.
    Author     : Vasques
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Cuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String cuenta = request.getParameter("Cuenta");
    double monto = Double.parseDouble(request.getParameter("Monto"));

    int anio = Integer.parseInt(request.getParameter("anio"));String interesStr = request.getParameter("Interes");

    double interes= Double.parseDouble(request.getParameter("Interes"));
    
    double interesobt = 0;
    double dineroganado =0;
         
    boolean cuentaAgregada = false;

     if (session.getAttribute("cuentas") != null){
            List<Cuenta> cuentas = (List<Cuenta>)
            session.getAttribute("cuentas");
            
            //buscar la cuenta por numero de cuenta  y agregar saldo
        
            for (Cuenta banco : cuentas) {

                if(banco.getCuenta().equals(cuenta)){
                       
                 banco.asignarinteres(interes);
                 interesobt = monto * interes*anio;
                 banco.obenerinteres(interesobt) ;
                 
                 dineroganado = monto + interesobt;
                 
                 
                       cuentaAgregada = true;

                        

                break;
                }

            }
        }
               String m= Double.toString(monto);
                              String i= Double.toString(interes);
                                                         String ig= Double.toString(dineroganado);
                                                         String ih = Double.toString(interesobt);



              String cuentaadd = Boolean.toString(cuentaAgregada);
    response.sendRedirect("Interes.jsp?Cuenta=" + java.net.URLEncoder.encode
        (cuenta, "UTF-8")+ "&agregada="+java.net.URLEncoder.encode(cuentaadd, "UTF-8")
    + "&monto="+java.net.URLEncoder.encode(m, "UTF-8")
    + "&interes="+java.net.URLEncoder.encode(i, "UTF-8")
    + "&interesganado="+java.net.URLEncoder.encode(ig, "UTF-8")
    + "&h="+java.net.URLEncoder.encode(ih, "UTF-8"));

    
%>
