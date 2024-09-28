<%-- 
    Document   : consulta2
    Created on : 21 sept 2024, 6:10:12 p. m.
    Author     : Vasques
--%>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 800px;
        margin: 30px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h3 {
        margin-bottom: 15px;
        color: #333;
    }

    h3 span {
        color: #666;
    }

    .form-section, .table-section {
        margin-bottom: 30px;
    }

    .input-group {
        margin-bottom: 15px;
    }

    .input-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    .input-group input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .btn-agregar, .btn-eliminar {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }

    .btn-agregar:hover, .btn-eliminar:hover {
        background-color: #0056b3;
    }

    .table-section h3 {
        background-color: #e9f2ff;
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 15px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 15px;
    }

    table thead {
        background-color: #333;
        color: #fff;
    }

    table th, table td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ccc;
    }

    table tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    .btn-edit, .btn-delete {
        background-color: #fff;
        border: none;
        cursor: pointer;
        font-size: 18px;
    }

    .btn-edit:hover {
        color: #007bff;
    }

    .btn-delete:hover {
        color: #dc3545;
    }

    .btn-eliminar {
        background-color: #dc3545;
    }

    .btn-eliminar:hover {
        background-color: #c82333;
    }

</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Personas</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container">
    

    

    <div class="form-section">
        <h3>Información requerida: <span>Para registrar una nueva persona</span></h3>
        <form action="ControllerPersona" method="post" >
            <div class="input-group">
                <label>DUI</label>
                <input type="text" name="dui" placeholder="Ingrese el DUI 0000000-0">
            </div>
            <div class="input-group">
                <label>Apellido</label>
                <input type="text" name="apellido" placeholder="Ingrese el apellido de la persona">
            </div>
            <div class="input-group">
                <label>Nombre</label>
                <input type="text" name="nombre" placeholder="Ingrese el nombre de la persona">
            </div>
            <button type="submit" name="action" value="agregar" class="btn-agregar">Agregar registro</button>
        </form>

    </div>

    <div class="table-section">
        <h3>Consulta General de personas</h3>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>DUI</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>


      

            <tr>
                <td>
                      
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <form action="ControllerPersona" method="post">
                        <input type="hidden" name="id" value="">
                        <button class="btn-edit" name="action" value="actualizar">✏️</button>
                    </form>

                </td>
            </tr>
          

        </table>
        <form action="ControllerPersona" method="get">
            <input type="hidden" name="id" value="">
            <button type="submit" name="action" value="eliminar" class="btn-eliminar">Eliminar registro</button>
        </form> 

    </div>
</div>
</body>
</html>
