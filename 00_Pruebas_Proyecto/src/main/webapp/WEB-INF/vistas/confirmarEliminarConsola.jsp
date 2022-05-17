<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eliminar: ${mc.nombre}</title>
</head>
<body class="body_admin">

	<jsp:include page="nav.jsp"></jsp:include>
	
		<div class="contenedor_eliminar_producto">
			<div class="titulo_eliminar_producto">
				<h2>¿Eliminar ${mc.nombre}?</h2>
			</div>			
			<div class="contenedor_imagen_eliminar_producto">
				<img src="/images/consolas/${imagen}" alt="imagen juego" class="imagen_eliminar_producto">
			</div>
			<div class="detalles_eliminar_producto">
				<ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <strong>Fabricante</strong><br>
                        ${mc.consola.fabricante}
                    </li>
                    <li class="list-group-item">
                        <strong>Precio</strong><br>
                        ${mc.precio} €
                    </li>
                    <li class="list-group-item">
                        <strong>Fecha de lanzamiento</strong><br>
                        <fmt:formatDate pattern = "dd-MM-yyyy" value = "${mc.fechaLanzamiento}"/>
                    </li>
                    <li class="list-group-item">
                        <strong>Memoria</strong><br>
                        ${mc.memoriaConsola}
                    </li>                    
                </ul>
			</div>
		
			<div class="alert alert-danger alerta_eliminar_producto" role="alert">
 				<strong>¡Atención!</strong> <br>
 				Esta acción eliminará la consola por completo.
			</div>

			<div class="contenedor_boton_eliminar_volver">
				<a href="/admin/consola">
					<button type="button" class="btn btn-success btn-lg">Volver</button>
				</a>
			</div>
			
			<div class="contenedor_boton_confirmar_eliminar">
				<a href="/admin/confirmarEliminarConsola/${mc.idModeloConsola}">
					<button type="button" class="btn btn-danger btn-lg">Eliminar</button>
				</a>	
			</div>

		</div>
	
	<jsp:include page="footer.jsp"></jsp:include>	

</body>
</html>