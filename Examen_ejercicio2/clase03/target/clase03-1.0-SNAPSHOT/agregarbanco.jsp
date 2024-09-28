<%-- 
    Document   : verBanco
    Created on : 18 ago 2024, 2:58:17 p. m.
    Author     : Vasques
--%>

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
        <title>Registrar Sucursal</title>
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
       
          
    <div class="container mt-5">
        <div class="row">
          <div class="col-12">
            <div class="container">
                <strong>Sucursal</strong>
              </div>
            <form method="post" class="mt-3" action="Procesarcuenta.jsp">
              <div class="row">
                <div class="col-md-6">
                  <label for="apellido">Vendedor</label>
                  <input type="text" id="apellido" name="Nombre" class="form-control" placeholder="Ingrese el nombre de la categoria de boletos">
                </div>
               
              
                <div class="col-md-6">
                    <label for="apellido">Sucursal</label>
                    <select id="apellido" name="Cuenta" class="form-control" placeholder="">
            <option value="A">A</option>
            <option value="B">B</option>
                    </select>    
                  </div>

                  <div class="col-md-6 mt-3" >
                    <label for="apellido">Ventas</label>
                    <input type="number" id="apellido" name="Saldo" class="form-control" placeholder="Ingrese cantidad de ventas">
                  </div>
              
              <div class="row mt-3">
                <div class="col-md-12">
                  <button type="submit" value="agregar" class="btn btn-primary">Agregar</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </body>
</html>

