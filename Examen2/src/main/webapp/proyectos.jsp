<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de proyectos</title>
    <!-- Estilos CSS personalizados -->
    <link rel="stylesheet" href="styles.css">


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

        .input-group input,
        .input-group select {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            background-color: #4c4c54;
            color: #ffffff;
        }

        .input-group input:focus,
        .input-group select:focus {
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
            <a class="navbar-brand" href="controllerempleados">Empleados</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">


            </div>
        </div>
    </nav>
</header>

<div class="container">

    <c:set var="pageSize" value="5"/>
    <c:set var="page" value="${param.page != null ? param.page : 1}"/>
    <c:set var="startIndex" value="${(page - 1) * pageSize}"/>
    <c:set var="endIndex" value="${startIndex + pageSize}"/>

    <c:if test="${endIndex > consultapro.size()}">
        <c:set var="endIndex" value="${consultapro.size()}"/>
    </c:if>
    <div class="form-section">
        <h3>Información: <span>Registrar Persona</span></h3>
        <form action="Contrrollerproyectos" method="post">
            <div class="input-group">
                <label>Fecha de Inicio</label>
                <input type="date" id="fecha" name="fecha" placeholder="Ingrese la fecha de contratación" required>
                <span id="error-message" style="color: red; display: none;"></span>
            </div>

            <div class="input-group">
                <label for="nombre">Nombre</label>
                <input type="text" id="nombre"  nombre="n"  value="${persona.nombre_empleado}"  oninput="validarSoloLetras(this)" required>
            </div>

            <div class="input-group">

                <input type="hidden" id="id" name="nombre" value="${persona.id}" readonly required>
            </div>

            <button type="submit" name="action" value="agregar" class="btn-agregar"
                    onclick="guardardatos('${persona.id}', '${persona.nombre_empleado}')">
                Registrar
            </button>
        </form>
    </div>


    <div class="table-section">
        <h3>Lista de proyectos asignados</h3>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Fecha</th>
                <th>Encargado</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${consultapro}" var="item">
                <tr>
                    <td>${item.proyecto.id}</td>
                    <td>${item.proyecto.fecha_inicio}</td>
                    <td>${item.nombreEmpleado}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- Paginación -->
    <div class="pagination">
        <c:if test="${page > 1}">
            <a href="controllerempleados?page=${page - 1}" class="btn btn-secondary">Anterior</a>
        </c:if>


        <c:set var="baseUrl" value="controllerempleados?page=" />



        <c:forEach begin="1" end="${(consultapro.size() / pageSize) + (consultapro.size() % pageSize > 0 ? 1 : 0)}" var="p">
            <a href="${baseUrl}${p}" class="btn ${p == page ? 'btn-primary' : 'btn-secondary'}">${p}</a>
        </c:forEach>


        <c:if test="${endIndex < consultapro.size()}">
            <a href="controllerempleados?page=${page + 1}" class="btn btn-secondary">Siguiente</a>
        </c:if>
    </div>
</div>



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

    function guardardatos(id,nombre){

          document.getElementById("nombre").value = nombre;
          document.getElementById("id").value = id;

          console.log(id, nombre);

    }
</script>


<!-- Scripts de Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>

