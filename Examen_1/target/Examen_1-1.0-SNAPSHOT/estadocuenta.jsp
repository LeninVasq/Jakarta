<%-- 
    Document   : 
    Created on : 17 ago 2024, 7:12:02 p. m.
    Author     : Vasques
--%>
<%@page import="java.util.List"%>
<%@page import="Clases.Cuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous"
    />
<script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
    crossorigin="anonymous"
></script>

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
    integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
    crossorigin="anonymous"
></script>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bancos registrados</title>
    </head>
    <body>
       <header>
        <nav
        class="navbar navbar-expand-sm navbar-light bg-light"
    >
        <div class="container">
            <a class="navbar-brand" href="Index.jsp">Inicio</a>
            <button
                class="navbar-toggler d-lg-none"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#collapsibleNavId"
                aria-controls="collapsibleNavId"
                aria-expanded="false"
                aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav me-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="registrarcuenta.jsp    " aria-current="page"
                            >Registrar cuenta
                            <span class="visually-hidden">(current)</span></a
                        >
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="estadocuenta.jsp">Estado de cuenta</a>
                    </li>
                
                   
                </ul>
                <form class="d-flex my-2 my-lg-0">
                    <input
                        class="form-control me-sm-2"
                        type="text"
                        placeholder="Search"
                    />
                    <button
                        class="btn btn-outline-success my-2 my-sm-0"
                        type="submit"
                    >
                        Search
                    </button>
                </form>
            </div>
        </div>
    </nav>
       </header>
        <!--Table-->
        <div
            class="table-responsive container mt-5"
        >
            <table
                class="table table-primary"
            >
                <thead>
                    <tr>
                        <th scope="col">Nombre banco</th>
                        <th scope="col">Numero de cuenta </th>
                        <th scope="col">Saldo</th>
                        
                        <th scope="col">Aciones</th>

                    </tr>
                </thead>
                <tbody>
                    
                   <%
                  
                    //Obtenemos la lsita de bancos
                 List<Cuenta> cuenta = (List<Cuenta>)
                    session.getAttribute("cuentas");
                    
                    //ordenar la lista de bancos por nombre
                    
                    // Verificamos si la lista es nula antes de proceder
                    if (cuenta != null) {
                        // Ordenamos la lista de bancos por nombre
                        cuenta.sort((b1, b2) -> b1.getNombre().compareTo(b2.getNombre()));
                        
                        // Mostramos toda la información de los bancos
                        for (Cuenta x : cuenta) {
                            out.println("<tr>");
                            out.println("<td scope='row'>" + x.getNombre() + "</td>");
                            out.println("<td>" + x.getCuenta() + "</td>");
                            out.println("<td>$" + x.getSaldo() + "</td>");
                            out.println("<td>"); // Inicio de la columna de botones
                            out.println("<a href='Depositar.jsp?Cuenta=" + x.getCuenta() + "' class='btn btn-warning btn-sm'>Depositar</a> ");
                            out.println("<a href='retirar.jsp?Cuenta=" + x.getCuenta() + "' class='btn btn-danger btn-sm'>Retirar</a>");
                            out.println("<a href='Interes.jsp?Cuenta=" + x.getCuenta() + "&monto="+x.getSaldo()+"' class='btn btn-info'>Interes</a>");

                            out.println("</td>"); 
                            out.println("</tr>");
                        }
                    } else {
                        // Si la lista es nula, mostramos un mensaje
                        out.println("<tr><td colspan='3'>No hay cuentas registradas.</td></tr>");
                    }
                     %>
                </tbody>
            </table>

        </div>
      

       
    </body>
</html>