<%-- 
    Document   : agregar
    Created on : 9 nov 2024, 5:47:29 p. m.
    Author     : lenin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>

<div class="container-fluid mt-3">
    <div class="row">
  
        <div class="col-sm-12 col-md-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <div>
                        <i class="fas fa-table me-1"></i>
                        Consulta de Recetas
                    </div>
  
                    <button class="new-ticket-button btn btn-primary" data-bs-toggle="modal" data-bs-target="#addproducto">
                        +
                    </button>
                </div>
  
                <div class="table-responsive">
                    <table class="table table-primary">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Ingredientes</th>
                                <th scope="col">Tiempo de cocina</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${not empty listaRecetas}">
                                <c:forEach var="empleados" items="${listaRecetas}">
                                    <tr>
                                        <td>${empleados.idReceta}</td>
                                        <td>${empleados.nombreReceta}</td>
                                        <td>${empleados.tipoCocina}</td>
                                        <td>${empleados.ingredientes}</td>
                                        <td>${empleados.tiempoPreparacion}</td>
                                        <td>
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModal"
                                                    data-id="${empleados.idReceta}" 
                                                    data-nombre="${empleados.nombreReceta}" 
                                                    data-tipo="${empleados.tipoCocina}" 
                                                    data-ingredientes="${empleados.ingredientes}" 
                                                    data-tiempo="${empleados.tiempoPreparacion}">
                                                ✏️
                                            </button>
                                            <form action="receta" method="post">
                                                <input type="hidden" name="id" value="${empleados.idReceta}"/>
                                                <button type="submit" name="accion" value="delete" class="btn btn-secondary">Eliminar</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addproducto" tabindex="-1" role="dialog" aria-labelledby="messageModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="messageModalLabel">Agregar Receta</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="receta" method="post">
                    <div class="mb-3">
                        <label for="Nombre" class="form-label">Nombre</label>
                        <input type="text" id="Nombre" name="Nombre" class="form-control" placeholder="Ingrese el nombre de la receta" required>
                    </div>          
                    <div class="mb-3">
                        <label for="Tamaño" class="form-label">Tipo de cocina</label>
                        <select id="Tamaño" name="tipo" class="form-select">
                            <option value="" disabled selected>Seleccione un tipo</option>
                            <option value="Italiana">Italiana</option>
                            <option value="Mexicana">Mexicana</option>
                            <option value="Asiatica">Asiatica</option>
                            <option value="Vegetariana">Vegetariana</option>
                            <option value="Postres">Postres</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="Descripción" class="form-label">Ingredientes</label>
                        <textarea id="Descripción" class="form-control" name="ingredientes" rows="4" placeholder="Ingrese los ingredientes" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="precio" class="form-label">Tiempo de preparación (minutos)</label>
                        <input type="number" id="precio" name="tiempoPreparacion" class="form-control" placeholder="Ingrese el tiempo de preparación" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="submit" name="accion" value="add" class="btn btn-primary">Agregar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Editar Receta</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="receta" method="post">
                <div class="modal-body">
                    <input type="hidden" name="id" id="modal-id">
                    <div class="form-group">
                        <label for="modal-nombre">Nombre de la Receta</label>
                        <input type="text" class="form-control" id="modal-nombre" name="nombre" required>
                    </div>
                    <div class="form-group">
                        <label for="modal-tipo">Tipo de Cocina</label>
                        <select id="modal-tipo" name="tipoCocina" class="form-select">
                            <option value="" disabled selected>Seleccione un tipo</option>
                            <option value="Italiana">Italiana</option>
                            <option value="Mexicana">Mexicana</option>
                            <option value="Asiatica">Asiatica</option>
                            <option value="Vegetariana">Vegetariana</option>
                            <option value="Postres">Postres</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="modal-ingredientes">Ingredientes</label>
                        <textarea class="form-control" id="modal-ingredientes" name="ingredientes" rows="3" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="modal-tiempo">Tiempo de Preparación</label>
                        <input type="text" class="form-control" id="modal-tiempo" name="tiempoPreparacion" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary" name="accion" value="actualizar">Guardar cambios</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $('#editModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); 
        var id = button.data('id');
        var nombre = button.data('nombre');
        var tipo = button.data('tipo');
        var ingredientes = button.data('ingredientes');
        var tiempo = button.data('tiempo');
        var modal = $(this);

        modal.find('#modal-id').val(id);
        modal.find('#modal-nombre').val(nombre);
        modal.find('#modal-tipo').val(tipo);
        modal.find('#modal-ingredientes').val(ingredientes);
        modal.find('#modal-tiempo').val(tiempo);
    });
</script>
