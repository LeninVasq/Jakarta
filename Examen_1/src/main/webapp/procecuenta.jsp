<%-- 
    Document   : procesarcuenta
    Created on : 24 ago 2024, 8:13:57 p.m.
    Author     : Vasquez
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Cuenta"%>
<%@page import="java.util.concurrent.ThreadLocalRandom"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String Nombre = request.getParameter("Nombre");
   
   

   

   
    StringBuilder numeroAleatorio = new StringBuilder();
    
    
    for (int i = 0; i < 16; i++) {
        int digito = ThreadLocalRandom.current().nextInt(0, 10);         numeroAleatorio.append(digito);
        
    }
    
     String numerocuenta = numeroAleatorio.toString();
    
    
   
    if(session.getAttribute("cuentas") == null){
    session.setAttribute("cuentas", new ArrayList<Cuenta>());
    }
    
    List<Cuenta> cuenta = (List<Cuenta>)
        session.getAttribute("cuentas");
    
    Cuenta nuevacuenta = new Cuenta(Nombre,numerocuenta);
    cuenta.add(nuevacuenta);
    
    
boolean cuentaAgregada = false;
    for (Cuenta c : cuenta) {
        if (c.getCuenta().equals(numerocuenta)) {
            cuentaAgregada = true;
            break;
        }
    }
    
    String cuentaadd = Boolean.toString(cuentaAgregada);
    response.sendRedirect("registrarcuenta.jsp?Cuenta=" + java.net.URLEncoder.encode
        (numerocuenta, "UTF-8")+ "&agregada="+java.net.URLEncoder.encode(cuentaadd, "UTF-8"));

    
    

%>

