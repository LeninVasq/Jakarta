<%--
    Document   : proyectos
    Created on : 23 sept 2024, 8:27:30 a. m.
    Author     : Vasques
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Personas</title>
    <!-- Estilos CSS personalizados -->
    <link rel="stylesheet" href="styles.css">

    <!-- Bootstrap CSS v5.3.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h3 {
            margin-bottom: 20px;
            color: #444;
            font-size: 1.75rem;
            text-align: center;
            border-bottom: 3px solid #007bff;
            padding-bottom: 10px;
        }

        h3 span {
            color: #6c757d;
            font-size: 1rem;
        }

        .form-section {
            margin-bottom: 40px;
            background-color: #f9fbfc;
            padding: 20px;
            border-radius: 10px;
            border: 1px solid #e1e1e1;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        .input-group {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
        }

        .input-group label {
            margin-bottom: 8px;
            font-weight: bold;
            color: #495057;
            font-size: 1.1rem;
        }

        .input-group input,
        .input-group select {
            width: 100%;
            padding: 15px;
            border: 2px solid #ced4da;
            border-radius: 8px;
            font-size: 1rem;
            background-color: #f8f9fa;
            transition: border-color 0.3s ease, background-color 0.3s ease;
        }

        .input-group input:focus,
        .input-group select:focus {
            border-color: #007bff;
            background-color: #ffffff;
            outline: none;
        }

        .btn-agregar {
            width: 100%;
            padding: 15px;
            background-color: bisque;
            color: black;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-agregar:hover {
            background-color: #ffcc99;
        }

        .table-section h3 {
            font-size: 1.5rem;
            background-color: #007bff;
            color: #fff;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
            margin-bottom: 20px;
        }

        table thead {
            background-color: #f8f9fa;
            color: #333;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.05em;
            border-bottom: 3px solid #007bff;
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        table tbody tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-edit, .btn-delete {
            background-color: transparent;
            border: none;
            cursor: pointer;
            font-size: 18px;
            padding: 8px;
            border-radius: 50%;
            transition: background-color 0.3s ease;
        }

        .btn-edit:hover {
            background-color: #007bff;
            color: #fff;
        }

        .btn-delete:hover {
            background-color: #dc3545;
            color: #fff;
        }

        .btn-eliminar {
            background-color: #dc3545;
            color: #ffffff;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            cursor: pointer;
        }

        .btn-eliminar:hover {
            background-color: #c82333;
        }
    </style>
</head>

<body>
<header>
    <nav class="navbar navbar-expand-sm navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" name="pagina" value="empleados" href="controllerempleados">Registrar empleados</a>
            <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav me-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="Contrrollerproyectos" aria-current="page">Proyectos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdownId" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                        <div class="dropdown-menu" aria-labelledby="dropdownId">
                            <a class="dropdown-item" href="#">Action 1</a>
                            <a class="dropdown-item" href="#">Action 2</a>
                        </div>
                    </li>
                </ul>
                <form class="d-flex my-2 my-lg-0">
                    <input class="form-control me-sm-2" type="text" placeholder="Search"/>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</header>

<div class="container">
    <!-- Formulario para registrar personas -->
    <div class="form-section">
        <h3>Información requerida: <span>Para registrar una nueva persona</span></h3>
        <form action="Contrrollerproyectos" method="post">
            <div class="input-group">
                <label>Fecha de Inicio</label>
                <input type="date" name="fecha" placeholder="Ingrese la fecha de inicio del proyecto">
            </div>

            <div class="input-group">
                <label for="nombre">Nombre</label>
                <select name="nombre" id="nombre">
                    <option value="" disabled selected>Seleccione un nombre</option>
                    <c:forEach items="${consulta}" var="empleados">
                        <option value="${empleados.id}">${empleados.nombre_empleado}</option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" name="action" value="agregar" class="btn-agregar">Registrar</button>
        </form>
    </div>

    <!-- Tabla de consulta -->
    <div class="table-section">
        <h3>Consulta General de personas</h3>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Proyecto</th>
                <th>Persona Encargada del proyecto</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${consultapro}" var="item">
                <tr>
                    <!-- Accedemos al ID del proyecto desde el objeto proyectos -->
                    <td>${item.proyecto.id}</td>
                    <!-- Accedemos a la fecha de inicio -->
                    <td>${item.proyecto.fecha_inicio}</td>

                    <!-- Accedemos al nombre del empleado desde el mapa -->
                    <td>${item.nombreEmpleado}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>

<!-- Scripts de Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>
