<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrito</title>
</head>
<body class="body_carrito">

	<jsp:include page="nav.jsp"></jsp:include>

	<c:if test = "${total != 0}">
	
		<div class="contenedor_mario_carrito">
		<img src="/images/png/mario_carrito.png" alt="imagen carrito" class="mario_carrito_imagen">
		<div>
			¡Finaliza tu compra!	
		</div>
	</div>
	
		<table class="carrito_tabla">
			<thead>
				<tr>
					<th>Producto</th>
					<th>Tipo producto</th>
					<th>Precio</th>
				</tr>
			</thead>
		
			<tbody>
				<c:forEach var="producto" items="${productosCarrito}">
					<tr>
						<td>${producto.nombre}</td>
						<td>${producto.tipoProducto}</td>
						<td>${producto.precio} €</td>
					</tr>
				</c:forEach>
				<tr class="fila_total">
					<td><strong>TOTAL</strong></td>
					<td></td>
					<td><strong>${total} €</strong></td>
				</tr>
			</tbody>	
		</table>
			
		<div class="contenedor_botones_carrito">
			<a class="btn btn-danger boton_vaciar_carrito" href="/cliente/vaciarCarrito">Vaciar carrito</a>
			<a class="btn btn-primary boton_finalizar_compra" href="/cliente/comprar">Finalizar Compra</a>
		</div>

	</c:if>

	<c:if test = "${total == 0}">
	
		<div class="contenedor_mario_carrito">
			<img src="/images/png/mario_carrito.png" alt="imagen carrito" class="mario_carrito_imagen">
			<div>
				¡Tu carrito está vacío!	
			</div>
		</div>
		
		<div class="volver_carrito_vacio">
			<a class="btn btn-primary " href="/">Volver</a>
		</div>

	</c:if>

	
</body>
</html>