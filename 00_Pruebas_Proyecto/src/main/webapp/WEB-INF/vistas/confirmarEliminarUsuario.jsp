<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eliminar: ${usu.username}</title>
</head>
<body class="body_admin">

	<jsp:include page="nav.jsp"></jsp:include>
	
		<div class="contenedor_eliminar_producto">
			<div class="titulo_eliminar_producto">
				<h2>¿Eliminar la cuenta de ${usu.username}?</h2>
			</div>			
			<div class="contenedor_imagen_eliminar_usuario">
				<img src="${usu.avatarUsuario}" alt="imagen juego" class="imagen_eliminar_producto">
			</div>
			<div class="detalles_eliminar_producto">
				<ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <strong>Nombre</strong><br>
                        ${usu.nombre} ${usu.apellidos}
                    </li>
                    <li class="list-group-item">
                        <strong>Email</strong><br>
                        ${usu.email}
                    </li>
                    <li class="list-group-item">
                        <strong>Dirección</strong><br>
                        ${usu.direccion}
                    </li> 
                    <li class="list-group-item">
                        <strong>Fecha de registro</strong><br>
                        <fmt:formatDate pattern = "dd-MM-yyyy" value = "${usu.fechaRegistro}"/>
                    </li>
                   
                </ul>
			</div>
		
			<div class="alert alert-danger alerta_eliminar_producto" role="alert">
 				<strong>¡Atención!</strong> <br>
 				Esta acción removerá al usuario de la aplicación.
			</div>

			<div class="contenedor_boton_eliminar_volver">
				<a href="/admin/cliente">
					<button type="button" class="btn btn-success btn-lg">Volver</button>
				</a>
			</div>
			
			<div class="contenedor_boton_confirmar_eliminar">
				<a href="/admin/confirmarEliminarUsuario/${usu.username}">
					<button type="button" class="btn btn-danger btn-lg">Eliminar</button>
				</a>	
			</div>

		</div>
	
	<jsp:include page="footer.jsp"></jsp:include>	

</body>
</html>