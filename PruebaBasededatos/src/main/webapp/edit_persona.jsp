<%-- 
    Document   : edit_persona
    Created on : 21 sept 2024, 9:12:13 p. m.
    Author     : Vasques
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Información Persona</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
        }
        .header {
            font-weight: bold;
            background-color: #f1f1f1;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>

    <%
        Integer id = (Integer) request.getAttribute("id");

    %>




</head>
<body>

<div class="container">
    <div class="header">Información requerida: modificar Información persona</div>
    <form method="post" action="ControllerPersona">
        <div class="form-group">
            <label >ID</label>
            <input type="number" display="none" name="id"   value="<%= id%>" readonly>
        </div>
        <div class="form-group">
            <label >DUI</label>
            <input type="text" name="dui" value="${persona.dui}">
        </div>
        <div class="form-group">
            <label >Apellido</label>
            <input type="text" name="apellido" value="${persona.apellido}">
        </div>
        <div class="form-group">
            <label >Nombre</label>
            <input type="text" name="nombre" value="${persona.nombre}">
        </div>
        <button type="submit" name="action" value="actualizar2" class="btn">Modificar registro</button>
    </form>
</div>

</body>
</html>

