<%-- 
    Document   : menu.jsp
    Created on : 9 nov 2024, 9:55:46 p. m.
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
                    <a class="nav-link active" href="verrecetas" aria-current="page"
                        >Ver Recetas
                        <span class="visually-hidden"></span></a
                    >
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="verfavoritos">Ver Favoritos</a>
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
