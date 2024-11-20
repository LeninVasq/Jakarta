<%-- 
    Document   : menu
    Created on : 9 nov 2024, 5:38:38 p. m.
    Author     : lenin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav
    class="navbar navbar-expand-sm navbar-light bg-light"
>
    <div class="container">
        <a class="navbar-brand" href="Login">Inicio</a>
        
        <div class="collapse navbar-collapse" id="collapsibleNavId">
            <ul class="navbar-nav me-auto mt-2 mt-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="receta" aria-current="page"
                        >Agregar Receta
                        <span class="visually-hidden"></span></a
                    >
                </li>
                <li class="nav-item dropdown">
                    <a
                        class="nav-link dropdown-toggle"
                        href="#"
                        id="dropdownId"
                        data-bs-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                        >Graficos</a
                    >
                    <div
                        class="dropdown-menu"
                        aria-labelledby="dropdownId"
                    >
                        <a class="dropdown-item" href="barras"
                            >Barras</a
                        >
                        <a class="dropdown-item" href="pastel"
                            >Pastel</a
                        >
                        <a class="dropdown-item" href="linea"
                            >Lineas</a
                        >
                    </div>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="salir">Salir</a>
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



