<%-- 
    Document   : actualizaremple
    Created on : 23 sept 2024, 6:41:31 p. m.
    Author     : Vasques
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Información Persona</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
            padding: 30px;
            max-width: 450px;
            width: 100%;
        }
        .header {
            font-size: 1.8rem;
            font-weight: bold;
            background-color: #f2f3f4;
            color: black;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-size: 1rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;

        }
        input[type="text"], input[type="number"], input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #dcdcdc;
            border-radius: 6px;
            font-size: 1rem;
            background-color: #f7f9fc;
            transition: border-color 0.3s ease, background-color 0.3s ease;
        }
        input[type="text"]:focus, input[type="number"]:focus, input[type="date"]:focus {
            border-color: #4a90e2;
            background-color: #ffffff;
            outline: none;
        }
        .btn {
            background-color: bisque;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 1.1rem;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
            color: black;
        }
        .btn:hover {
            background-color: whitesmoke;
        }
    </style>
</head>
<body>

<%
    Integer id = (Integer) request.getAttribute("id");

%>


<div class="container">
    <div class="header">Modificar Información del empleado</div>
    <form method="post" action="controllerempleados">
        <div class="form-group">
            <label>ID</label>
            <input type="number" name="id" value="<%= id %>" readonly>
        </div>
        <div class="form-group">
            <label>Nombre</label>
            <input type="text" name="nombre" value="${persona.nombre_empleado}">
        </div>
        <div class="form-group">
            <label>Puesto</label>
            <input type="text" name="puesto" value="${persona.puesto}">
        </div>
        <div class="form-group">
            <label>Fecha de contratación</label>
            <input type="date" name="fecha" value="${persona.fecha}">
        </div>
        <button type="submit" name="action" value="actualizar2" class="btn">Modificar registro</button>
    </form>
</div>

</body>
</html>