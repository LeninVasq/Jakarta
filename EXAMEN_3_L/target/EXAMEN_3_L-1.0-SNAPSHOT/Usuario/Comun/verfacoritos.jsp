<%-- 
    Document   : verfacoritos
    Created on : 9 nov 2024, 10:35:03 p. m.
    Author     : lenin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
    <head>
        <title>favoritos</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />

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
            <!-- place navbar here -->
        </header>
        <main>
            <header>
                <jsp:include page="menu.jsp" />
            </header>
        
            <div class="container mt-5">
                    <%
                    Object datos = session.getAttribute("correo");

                    %>
                <div class="alert alert-info">
                    <% 

                        // Verifica si el mensaje existe
                        if (request.getAttribute("mensaje") != null) { 
                    %>
                        <%= request.getAttribute("mensaje") %>
                    <% 
                        }else{
                            %>
                            <button type="button" class="btn btn-danger col-md-4" data-bs-toggle="modal" data-bs-target="#confirmModal">
                                <i class="bi bi-heart-fill"></i> Eliminar Todos los favoritos
                            </button>
                            <%
                        } 

                    %>
                </div>
                
        
                <!-- Contenedor de recetas -->
                <div class="row">
                    <c:forEach var="favorito" items="${listaRecetas}">
    <div class="col-md-4 mb-4">
        <div class="card shadow-sm">
            <div class="card-body">
                <h5 class="card-title">ID Favorito: ${favorito[0]}</h5>
                <p class="card-text"><strong>Nombre de la Receta:</strong> ${favorito[1]}</p>
                <p class="card-text"><strong>Tipo de cocina:</strong> ${favorito[2]}</p>
                <p class="card-text"><strong>Ingredientes:</strong> ${favorito[3]}</p>
                <p class="card-text"><strong>Tiempo de preparación (minutos):</strong> ${favorito[4]}</p>

             
                <p class="card-text"><strong>Fecha de Favorito:</strong> ${favorito[5]}</p>

                <form action="verfavoritos" method="post">
                    <input type="hidden" name="idfavorito" value="${favorito[0]}">
                    <input type="hidden" name="actu" value="favo">
                    <button type="submit" class="btn btn-danger w-100">
                        <i class="bi bi-heart-fill"></i> Eliminar de favoritos
                    </button>
                </form>
            </div>
        </div>
    </div>
</c:forEach>

                    
                </div>
                
            </div>

            <!-- Modal -->
<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="confirmModalLabel">Confirmación</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          ¿Estás seguro de que deseas eliminar todos los favoritos?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <form action="verfavoritos" method="post">
            <button type="submit" class="btn btn-danger" name="actu" value="eliminar">Eliminar</button>
          </form>
        </div>
      </div>
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
    
    <script>document.getElementById('confirmDelete').addEventListener('click', function() {
        // Realiza la acción para eliminar los favoritos
        console.log('Favoritos eliminados');
    });
    </script>
    </body>
</html>
