<%@page import="modelos.empleados"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Empleados</title>
    <!-- Estilos CSS personalizados -->
    <link rel="stylesheet" href="styles.css">

    <!-- Bootstrap CSS v5.3.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #1c1c1e;
            color: #ffffff;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
            background-color: #2c2c34;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        h3 {
            margin-bottom: 20px;
            color: #ffffff;
            font-size: 1.8rem;
            text-align: left;
            border-bottom: 4px solid #ff6f61;
            padding-bottom: 10px;
        }

        h3 span {
            color: #a1a1a5;
            font-size: 0.9rem;
        }

        .form-section {
            margin-bottom: 30px;
            padding: 15px;
            background-color: #3d3d45;
            border-radius: 10px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 10px;
            font-size: 1.1rem;
            color: #ff6f61;
        }

        .input-group input {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            background-color: #4c4c54;
            color: #ffffff;
        }

        .input-group input:focus {
            border: none;
            background-color: #56565e;
            outline: none;
        }

        .btn-agregar {
            width: 100%;
            padding: 12px;
            background-color: #ff6f61;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-agregar:hover {
            background-color: #ff3e2d;
        }

        .table-section h3 {
            font-size: 1.6rem;
            background-color: #ff6f61;
            color: white;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            text-align: left;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table thead {
            background-color: #3d3d45;
            color: #ff6f61;
            text-transform: uppercase;
            font-size: 0.9rem;
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            background-color: #4c4c54;
            border-bottom: 1px solid #555;
        }

        table tbody tr:hover {
            background-color: #5a5a64;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-edit, .btn-delete {
            background-color: #4c4c54;
            border: none;
            cursor: pointer;
            font-size: 18px;
            padding: 8px;
            color: white;
            transition: background-color 0.3s ease;
        }

        .btn-edit:hover {
            background-color: #ff6f61;
        }

        .btn-delete:hover {
            background-color: #ff3e2d;
        }

        .btn-eliminar {
            background-color: #ff3e2d;
            color: #ffffff;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-eliminar:hover {
            background-color: #c82333;
        }

        /* Estilos para la paginación */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            margin: 0 5px;
            padding: 10px 15px;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            background-color: #4c4c54;
        }

        .pagination a.btn-primary {
            background-color: #ff6f61;
        }

        .pagination a:hover {
            background-color: #ff3e2d;
        }

    </style>
</head>

<body>
<header>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="controllerempleados">Registrar empleados</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">

            </div>
        </div>
    </nav>
</header>

<div class="container">
  
    <c:if test="${not empty error}">
        <div class="alert alert-danger">
            ${error}
        </div>
    </c:if>




    <div class="form-section">
        <h3>Información requerida: <span>Para registrar un nuevo empleado</span></h3>
        <form action="controllerempleados" method="post">
            <div class="input-group">
                <label>Nombre</label>
                <input type="text" name="nombre" placeholder="Ingrese el nombre completo" oninput="validarSoloLetras(this)" required>
            </div>
            <div class="input-group">
                <label>Puesto</label>
                <input type="text" name="puesto" placeholder="Ingrese el puesto" oninput="validarSoloLetras(this)" required>
            </div>

            <div class="input-group">
                <label>Fecha de Contratación</label>
                <input type="date" id="fecha" name="fecha" placeholder="Ingrese la fecha de contratación" required>
                <span id="error-message" style="color: red; display: none;"></span>
            </div>


            <button type="submit" name="action" value="agregar" class="btn-agregar">Registrar</button>
        </form>
    </div>

    <div class="table-section">
        <h3>Consulta General de Empleados</h3>
        
        
        <c:set var="pageSize" value="5"/>
        <c:set var="page" value="${param.page != null ? param.page : 1}"/>
        <c:set var="startIndex" value="${(page - 1) * pageSize}"/>
        <c:set var="endIndex" value="${startIndex + pageSize}"/> 

        <c:if test="${endIndex > consulta.size()}">
            <c:set var="endIndex" value="${consulta.size()}"/>
        </c:if>


        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Puesto</th>
                <th>Fecha de Contratación</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>


            <c:forEach var="empleados" begin="${startIndex}" end="${endIndex - 1}" items="${consulta}">
                <tr>
                    <td>${empleados.id}</td>
                    <td>${empleados.nombre_empleado}</td>
                    <td>${empleados.puesto}</td>
                    <td>${empleados.fecha}</td>
                    <td>
                        <form action="controllerempleados" method="post" class="form-eliminar">

                            <input type="hidden" name="id" value="${empleados.id}">
                             <!-- Agregado para enviar baseUrl -->
                            <button class="btn-edit" name="action" value="actualizar">✏️</button>
                            <button class="btn-delete" name="action" value="eliminar" title="Eliminar registro">🗑️</button>
                            <button class="btn-delete" name="action" value="agregarproye" title="Eliminar registro">A️</button>

                             </form>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- Paginación -->
        <div class="pagination">
            <c:if test="${page > 1}">
                <a href="controllerempleados?page=${page - 1}" class="btn btn-secondary">Anterior</a>
            </c:if>


            <c:set var="baseUrl" value="controllerempleados?page=" />



            <c:forEach begin="1" end="${(consulta.size() / pageSize) + (consulta.size() % pageSize > 0 ? 1 : 0)}" var="p">
                <a href="${baseUrl}${p}" class="btn ${p == page ? 'btn-primary' : 'btn-secondary'}">${p}</a>
            </c:forEach>


            <c:if test="${endIndex < consulta.size()}">
                <a href="controllerempleados?page=${page + 1}" class="btn btn-secondary">Siguiente</a>
            </c:if>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybBYAu7Ls3hF1hZeB6bb1KAd1r0VJN5jfoUlx86dRrA6bGNIa" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-qH2Bsq7gsrMDlMHbwtKBaaE6QHvf0h81z4Blq2kcsP6YI5TEugBSg87b6/xACjMF" crossorigin="anonymous"></script>









<script>
    const fechaInput = document.getElementById('fecha');
    const errorMessage = document.getElementById('error-message');

    // Establece la fecha mínima como hoy
    const today = new Date();
 // Esto crea un objeto Date con la fecha y hora actuales

    // Restar un día
    today.setDate(today.getDate() - 1); // Esto resta 1 al día actual
    today.setHours(0, 0, 0, 0); // Asegura que la hora no afecte la comparación
    const todayString = today.toISOString().split('T')[0]; // Formato YYYY-MM-DD
    fechaInput.setAttribute('min', todayString);

    // Validación al cambiar el valor
    fechaInput.addEventListener('input', () => {
        const selectedDate = new Date(fechaInput.value);

        // Reinicia el mensaje de error
        errorMessage.style.display = 'none';

        // Verifica si la fecha seleccionada es anterior a hoy
        if (selectedDate < today) {
            errorMessage.textContent = 'La fecha no puede ser anterior a hoy.';
            errorMessage.style.display = 'block';
            fechaInput.value = ''; // Limpiar el campo
        }
    });
</script>





<script>
    function validarSoloLetras(input) {
        // Expresión regular para permitir solo letras latinas, con tildes y la ñ
        var regex = /[^a-zA-ZáéíóúÁÉÍÓÚñÑ\s]/g;
        input.value = input.value.replace(regex, '');  // Elimina caracteres que no coincidan
    }
</script>
</body>
</html>
