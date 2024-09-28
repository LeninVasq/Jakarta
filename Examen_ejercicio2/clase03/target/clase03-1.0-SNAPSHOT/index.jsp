
<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous"
    />


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de banco </title>
        
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
          <h1>Bienvenido a pastelistos S.A DE C.V</h1>
        </div>
    </body>
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
</html>
