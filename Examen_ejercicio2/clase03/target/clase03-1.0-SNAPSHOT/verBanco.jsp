<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bancos Registrados</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .navbar {
            margin-bottom: 20px;
        }
        .table {
            margin-bottom: 20px;
        }
        .table-primary {
            background-color: #e9ecef;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .summary-section {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .summary-section h3 {
            margin-bottom: 20px;
        }
        .summary-section p {
            margin-bottom: 10px;
        }
        .summary-section ul {
            list-style-type: none;
            padding-left: 0;
        }
        .summary-section ul li {
            margin-bottom: 10px;
        }
        .highlight {
            font-weight: bold;
            color: #007bff;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Inicio</a>
            <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav me-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="agregarbanco.jsp" aria-current="page">Agregar Nueva Sucursal <span class="visually-hidden">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="verBanco.jsp">Ventas del mes</a>
                    </li>
                </ul>
                <form class="d-flex my-2 my-lg-0">
                    <input class="form-control me-sm-2" type="text" placeholder="Search" />
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>

    <div class="container">
        <!-- Table -->
        <div class="table-responsive">
            <table class="table table-primary">
                <thead>
                    <tr>
                        <th scope="col">Sucursal</th>
                        <th scope="col">Vendedor</th>

                        <th scope="col">Ventas</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Obtenemos la lista de bancos
                        java.util.List<Banco> bancolist = (java.util.List<Banco>) session.getAttribute("bancolist");

                        // Ordenar la lista de bancos por nombre
                        bancolist.sort((b1, b2) -> b1.getNombreBanco().compareTo(b2.getNombreBanco()));

                        // Mostrar toda la info de los bancos
                        for (Banco banco : bancolist) {
                            out.println("<tr>");
                            out.println("<td>" + banco.getNumeroCuenta() + "</td>");
                            out.println("<td>" + banco.getNombreBanco() + "</td>");

                            out.println("<td>$" + banco.getSaldo() + "</td>");
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

        <div class="summary-section">
            <h3>Resumen de Ventas</h3>
            <p><strong>Ventas Totales:</strong> $<%= ventasTotales %></p>
            <p><strong>Venta Mayor:</strong> $<%= ventaMayor %></p>
            <p><strong>Venta Menor:</strong> $<%= ventaMenor %></p>

            <h4>Ventas por Sucursal</h4>
            <ul>
                <%
                // Crea un mapa para agrupar los números de cuenta por sucursal
                Map<String, List<String>> cuentasPorSucursal = new HashMap<>();

                // Inicializa los contadores para sucursales A y B
                int sucursalaCount = 0;
                int sucursalbCount = 0;

                // Recorre la lista de bancos y agrupa las cuentas
                for (Banco banco : bancolist) {
                    String sucursal = banco.getNumeroCuenta(); // Obtener la sucursal
                    String numeroCuenta = banco.getNumeroCuenta(); // Obtener el número de cuenta
                    
                    // Si la sucursal no está en el mapa, añade una nueva lista para ella
                    if (!cuentasPorSucursal.containsKey(sucursal)) {
                        cuentasPorSucursal.put(sucursal, new ArrayList<>());
                    }
                    
                    // Añade el número de cuenta a la lista correspondiente
                    cuentasPorSucursal.get(sucursal).add(numeroCuenta);
                    
                    // Incrementa el contador correspondiente según la sucursal
                    if ("A".equals(sucursal)) {
                        sucursalaCount++;
                    } else if ("B".equals(sucursal)) {
                        sucursalbCount++;
                    }
                }

                // Imprime los números de cuenta agrupados por sucursal y los conteos
                for (Map.Entry<String, List<String>> entry : cuentasPorSucursal.entrySet()) {
                    String sucursal = entry.getKey();
                    List<String> cuentas = entry.getValue();
                    
                    // Cuenta el número de cuentas en cada sucursal
                    int numeroDeCuentas = cuentas.size();
                    
                    // Imprime la información de ventas por sucursal
                    out.println("<li><strong>Sucursal " + sucursal + ":</strong> " + numeroDeCuentas + " cuentas</li>");
                }
                    int totalvendedores = sucursalaCount + sucursalbCount;
                // Imprime el número total de cuentas en sucursales A y B
                out.println("<h3>Total de cuentas en la Sucursal A: " + sucursalaCount + "</h3>");
                out.println("<h3>Total de cuentas en la Sucursal B: " + sucursalbCount + "</h3>");
                out.println("<h3>Cantidad total de vendedores: " + totalvendedores + "</h3>");

                %>
            </ul>
        </div>
    </div>
</body>
</html>
