<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Información Persona</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #1c1c1e;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #2c2c34;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            padding: 30px;
            max-width: 500px;
            width: 100%;
        }
        .header {
            font-size: 1.8rem;
            font-weight: bold;
            background-color: #ff6f61;
            color: white;
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
            color: #ff6f61;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="number"], input[type="date"] {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            background-color: #3d3d45;
            color: #ffffff;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }
        input[type="text"]:focus, input[type="number"]:focus, input[type="date"]:focus {
            background-color: #4c4c54;
            outline: none;
        }
        .btn {
            background-color: #ff6f61;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 1.1rem;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #ff3e2d;
        }
    </style>
</head>
<body>


<div class="container">
    <div class="header">Modificar Información del empleado</div>
    <form method="post" action="controllerempleados">
        <div class="form-group">
            <label>ID</label>
            <input type="number" name="id" value="${persona.id}" readonly required>
        </div>
        <div class="form-group">
            <label>Nombre</label>
            <input type="text" name="nombre" value="${persona.nombre_empleado}"  oninput="validarSoloLetras(this)"required>
        </div>
            <div class="form-group">
                <label>Puesto</label>
                <input type="text" name="puesto" value="${persona.puesto} "  oninput="validarSoloLetras(this)"required>
            </div>
        <div class="form-group">
            <label>Fecha de Contratación</label>
            <input type="date" id="fecha" name="fecha" value="${persona.fecha}" placeholder="Ingrese la fecha de contratación" required>
            <span id="error-message" style="color: red; display: none;"></span>
        </div>

        <button type="submit" name="action" value="actualizar2" class="btn">Modificar registro</button>
    </form>
</div>



<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>





<script>
    const fechaInput = document.getElementById('fecha');
    const errorMessage = document.getElementById('error-message');

    // Establecer la fecha mínima como hoy
    const today = new Date();today.setDate(today.getDate() - 1);
    today.setHours(0, 0, 0, 0); // Asegúrate de que la hora esté en 00:00:00
    const todayString = today.toISOString().split('T')[0]; // Formato YYYY-MM-DD
    fechaInput.setAttribute('min', todayString); // No se pueden seleccionar fechas anteriores

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
