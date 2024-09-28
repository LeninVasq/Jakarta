
<%@page import="clases.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

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
            <nav
          class="navbar navbar-expand-sm navbar-light bg-light"
        >
          <div class="container">
            <a class="navbar-brand" href="index.jsp">Inicio</a>
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
                  <a class="nav-link active" href="agregarbanco.jsp" aria-current="page"
                    >Agregar Nueva Sucursal
                    <span class="visually-hidden">(current)</span></a
                  >
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="verBanco.jsp">Ventas del mes</a>
                </li>
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

        </div>
       
        <!--Table-->
        <div
            class="table-responsive"
        >
            <table
                class="table table-primary"
            >
                <thead>
                    <tr>
                        <th scope="col">Vendedor</th>
                        <th scope="col">Sucursal</th>
                        <th scope="col">Ventas</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <%
                  
                    //Obtenemos la lsita de bancos
                    java.util.List<Banco> bancolist = (java.util.List<Banco>)
                    session.getAttribute("bancolist");
                    
                    //ordenar la lista de bancos por nombre
                    
                    bancolist.sort((b1, b2) -> 
                            b1.getNombreBanco().compareTo(b2.getNombreBanco()));
                    
                    //mostrar toda la info de los bancos
                    for (Banco banco : bancolist) {
    
                      out.println("<tr class=''>");
                        out.println("<td scope='row'>"+ banco.getNombreBanco() +"</td>");
                        out.println("<td>"+ banco.getNumeroCuenta() +"</td>");
                        out.println("<td>$"+ banco.getSaldo() +"</td>");
                       out.println("</tr>");
    
                    }
                    
 double ventasTotales = 0;
    double ventaMayor = Double.MIN_VALUE;
    double ventaMenor = Double.MAX_VALUE;

    // Mapa para sumar las ventas por sucursal
    Map<String, Double> ventasPorSucursal = new HashMap<>();

    // Recorrer la lista de bancos para realizar los cálculos
    for (Banco banco : bancolist) {
        double ventas = banco.getSaldo();
        ventasTotales += ventas;

        // Actualizar la venta mayor y menor
        if (ventas > ventaMayor) {
            ventaMayor = ventas;
        }
        if (ventas < ventaMenor) {
            ventaMenor = ventas;
        }

        // Sumar las ventas por sucursal
        String sucursal = banco.getNombreBanco();
        ventasPorSucursal.put(sucursal, ventasPorSucursal.getOrDefault(sucursal, 0.0) + ventas);
    }
                    
                    %>
                </tbody>
            </table>

        </div>
                
                
    <div class="container mt-4">
    <h3>Resumen de Ventas</h3>
    <p><strong>Ventas Totales:</strong> $<%= ventasTotales %></p>
    <p><strong>Venta Mayor:</strong> $<%= ventaMayor %></p>
    <p><strong>Venta Menor:</strong> $<%= ventaMenor %></p>

    <h4>Ventas por Sucursal</h4>
    <ul>
    <%
    // Mapa para contar vendedores por sucursal
    Map<String, Integer> vendedoresPorSucursal = new HashMap<>();

    for (Banco banco : bancolist) {
        String sucursal = banco.getNombreBanco();
        vendedoresPorSucursal.put(sucursal, vendedoresPorSucursal.getOrDefault(sucursal, 0) + 1);
    }

    // Imprimir el resultado para la sucursal A
    String sucursalBuscada = "Sucursal A"; // Nombre de la sucursal que deseas buscar
    Integer cantidadVendedores = vendedoresPorSucursal.getOrDefault(sucursalBuscada, 0);

    out.println("<p><strong>Cantidad de vendedores en " + sucursalBuscada + ":</strong> " + cantidadVendedores + "</p>");
%>

    </ul>
</div>
    </ul>
</div>
       

        
    </body>
</html>