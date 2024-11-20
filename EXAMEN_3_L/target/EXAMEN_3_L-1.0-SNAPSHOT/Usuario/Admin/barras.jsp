<%-- 
    Document   : barras
    Created on : 10 nov 2024, 4:29:10 p. m.
    Author     : lenin
--%>

<%@page import="java.util.List"%>
<%@page import="Controladores.FavoritosJpaController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />
    <title>Gráfico de Barras de Recetas</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    

        <!-- Bootstrap CSS v5.2.1 -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />
    </head>

    <body>
        <header>
            <jsp:include page="menu.jsp" />
  
  </header>
        
        <main>
            
            <h1> Las 10 Recetas Más Populares</h1>
<div class="chart-container">
    <canvas id="myChart"></canvas>
</div>

<script>
    const ctx = document.getElementById('myChart').getContext('2d');
    const data = {
        labels: [], // Aquí se cargarán los nombres de las recetas
        datasets: [{
            label: 'Cantidad de Favoritos',
            data: [], // Aquí se cargarán las cantidades de favoritos
            backgroundColor: 'rgba(75, 192, 192, 0.2)', // Color de las barras
            borderColor: 'rgba(75, 192, 192, 1)', // Color del borde
            borderWidth: 1
        }]
    };

    <%
        // Crear una instancia de FavoritosJpaController
        FavoritosJpaController favoritosController = new FavoritosJpaController();
        
        // Obtener los resultados de la consulta para recetas populares
        List<Object[]> resultadosPopulares = favoritosController.findTopFavoritos();
        
        for (Object[] resultado : resultadosPopulares) {
            String nombreReceta = (String) resultado[0]; // Nombre de la receta
            Long cantidadFavoritos = (Long) resultado[1]; // Cantidad de favoritos
    %>
            data.labels.push('<%= nombreReceta %>');  // Cargar nombre de la receta
            data.datasets[0].data.push(<%= cantidadFavoritos %>);  // Cargar cantidad de favoritos
    <%
        }
    %>

    const config = {
        type: 'bar',  
        data: data,
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Cantidad de Favoritos'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Recetas'
                    }
                }
            }
        },
    };

    const myChart = new Chart(ctx, config);
</script>

        </main>
        <footer>
            <!-- place footer here -->
        </footer>
        <!-- Bootstrap JavaScript Libraries -->
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
    </body>
</html>
