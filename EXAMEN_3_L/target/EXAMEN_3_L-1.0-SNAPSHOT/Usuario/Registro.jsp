<%-- 
    Document   : Registro
    Created on : 9 nov 2024, 3:30:30 p. m.
    Author     : lenin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String mensaje = (String) request.getAttribute("mensaje");

if (mensaje != null) {
       
%>
<div class="modal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Registro Exitoso</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <p><%= mensaje %></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <form action="Login" method="post">
            <button type="submit" class="btn btn-primary">Inicar Session</button>
          </form>
        </div>
      </div>
    </div>
  </div>

<%

        
 }%>


 <% String error = (String) request.getAttribute("error");

if (error != null) {
       
%>
<div class="modal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Error</h5>
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
        <title>Registro</title>
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
            <!-- place navbar here -->
        </header>
        <main>
            <form action="Registro" method="post">
                <label for="">Nombre</label>
                <input type="text" name="nombre" placeholder="Ingrese su nombre completo">
                <label for="">Correo</label>
                <input type="email" name="correo" placeholder="Ingrese su correo" id="">
                <label for="">Contraseña</label>
                <input type="password" name="password" placeholder="Ingrese una contraseña">
                <button type="submit" name="accion" value="registro">Registrase</button>
                
            </form>
            <p>¿Ya tienes una cuenta?<a href="Login">Inicar sesion</a></p>
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
