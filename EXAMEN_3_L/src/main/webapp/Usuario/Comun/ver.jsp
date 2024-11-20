<%-- 
    Document   : ver
    Created on : 9 nov 2024, 9:57:14 p. m.
    Author     : lenin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<% String error = (String) request.getAttribute("error");

if (error != null) {
       
%>
<div class="modal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Duplicado</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <p><%= error %></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          
        </div>
      </div>
    </div>
  </div>

<%

        
 }%>

<!doctype html>
<html lang="en">
    <head>
        <title>Title</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />

        <!-- Bootstrap CSS v5.2.1 -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/js/bootstrap.bundle.min.js"></script>
    
       
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
           
            <div class="container">
                <form method="post" class="d-flex justify-content-center mb-4">
                    <input type="text" class="search-box" id="buscar" name="buscarnom" placeholder="Buscar Producto" required>
                    <button type="submit" name="actu" value="buscar" class="search-button">Buscar</button>
                </form>
                <div class="row">
                    <c:forEach var="verreceta" items="${listaRecetas}">
                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-body">
                    
                                    <h5 class="card-title">${verreceta.nombreReceta}</h5>
                                    <p class="card-text"><strong>Tipo de Cocina:</strong> ${verreceta.tipoCocina}</p>
                                    <p class="card-text"><strong>Ingredientes:</strong> ${verreceta.ingredientes}</p>
                                    <p class="card-text"><strong>Tiempo de Preparación:</strong> ${verreceta.tiempoPreparacion}</p>
                                    <form action="verrecetas" method="post">
                                        <input type="hidden" name="idReceta" value="${verreceta.idReceta}" >
                                        <input type="hidden" name="actu" value="favo">
                                        <button type="submit" class="toggle-favorite-btn" data-id="${verreceta.idReceta}">
                                            <i class="bi bi-heart-fill"></i> Agregar a favoritos
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    
                </div>
            </div>
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
        <script>
            document.addEventListener('DOMContentLoaded', function () {
              var modalElement = new bootstrap.Modal(document.querySelector('.modal'));
              modalElement.show();
            });
          </script>
    </body>
</html>


