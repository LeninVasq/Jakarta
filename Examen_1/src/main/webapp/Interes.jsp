    <%-- 
        Document   : retirar
        Created on : 25 ago 2024, 8:26:27 p. m.
        Author     : Vasques
    --%>

    <%@page import="java.util.List"%>
    <%@page import="Clases.Cuenta"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%
        String Cuenta = request.getParameter("Cuenta") ;
        double monto = Double.parseDouble(request.getParameter("monto"));

    %>
    <style>
      #cuenta {
        display: none;
      }
    </style>

    <%
        String cuentaadd= request.getParameter("agregada");
        

        boolean mostrarModal = false;


        boolean add =  Boolean.parseBoolean(cuentaadd);
double inte=0;
double h=0;

double integ=0;
        if(add){
                 inte = Double.parseDouble(request.getParameter("interes"));
                 integ = Double.parseDouble(request.getParameter("interesganado"));
                                  h = Double.parseDouble(request.getParameter("h"));

            mostrarModal = true;
            
            
        }

    %>
    <!doctype html>
    <html lang="en">
        <head>
            <title>Interes</title>
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
            <main>


                 <% if (mostrarModal) { %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            La cuenta se ha agregado exitosamente.<br>
            Su numero de cuenta es : <Label><%= Cuenta %></Label><br>
            Su tasa de interes es de : <Label><%= inte %></Label><br>
            Su tasa de interes es de : <Label><%= integ %></Label><br>
                        Su tasa de interes es de : <Label><%= h %></Label>



            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } %>

                <div class="container mt-5">
                    <div class="row">
                      <div class="col-12">
                        <div class="container">
                            <strong>Agregar Saldo acuenta bancaria</strong>
                          </div>
                        <form method="post" class="mt-3" action="procesarinteres.jsp">



                            <div class="row">
                                <div class="col-6">
                                  <label for="cuenta">Cuenta</label>
                                  <!-- Displayed input (disabled) -->
                                  <input type="text" disabled value="<%= Cuenta %>" class="form-control" placeholder="Ingrese el número de cuenta">

                                  <input type="hidden" id="cuenta" name="Cuenta" value="<%= Cuenta %>">
                                </div>
                                <div class="col-6">
                                  <label for="monto">Monto</label>
                                  <input type="number" disabled id="apellido" value="<%= monto %>" name="Monto" class="form-control" placeholder="Ingrese el monto a retirar" required="">
                                <input type="number" id="cuenta" name="Monto" value="<%= monto %>" class="form-control" placeholder="Ingrese el monto a retirar" required="">

                                </div>
                              </div>

                              <div class="row mt-3">
                                <div class="col-6" >
                                    <label for="apellido">Introduca el numero de años</label>
                                    <input step="1" type="number" id="apellido" name="anio" min="1" class="form-control" placeholder="Ingrese el numero de años que su dinero va estar depositado" required="">
                                </div>
                                <div class="col-6">
                                    <label for="monto">Interes en decimales</label>
                                    <input type="number" step="0.01" id="apellido"  name="Interes" class="form-control" placeholder="Ingrese el interes en decimales" required="">

                                  </div>
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
        // Comprueba si la bandera para mostrar el modal es verdadera
        window.onload = function () {
            <% if (mostrarModal) { %>
            // Usar JavaScript de Bootstrap para mostrar el modal
            var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
                keyboard: false
            });
            myModal.show();
            <% } %>
        };
    </script>
        </body>
    </html>