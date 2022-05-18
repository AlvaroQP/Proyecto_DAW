<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado pedidos</title>
</head>
<body class="body_pedidos">

	<jsp:include page="nav.jsp"></jsp:include>
	
	<h2>Pedidos realizados</h2>

	<c:forEach var="pedido" items="${pedidosCliente}">
		<table class="datos_pedido_tabla">
			<thead>
				<tr>
					<th>ID pedido</th>
					<th>Dirección Entrega</th>
					<th>Fecha alta</th>
					<th>Estado</th>
					<th>Cliente</th>
				</tr>
			</thead>
	
			<tbody>
				<tr>
					<td>${pedido.idPedido}</td>
					<td>${pedido.direccionEntrega}</td>
					<td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${pedido.fechaAlta}"/></td>
					<td>${pedido.estado}</td>
					<td>${pedido.usuario.nombre} ${pedido.usuario.apellidos}</td>
				</tr>
			</tbody>	
		</table>
		
		<table class="datos_pedido_tabla_2">
			<thead>
				<tr>
					<th>Producto</th>
					<th>Tipo producto</th>
					<th>Precio</th>
				</tr>
			</thead>
	
			<tbody>
			<c:forEach var="pp" items="${pedido.productosEnPedido}">
				<tr>
					<td>${pp.nombreProducto}</td>
					<td>${pp.tipoProducto}</td>
					<td>${pp.precio} €</td>
				</tr>
			</c:forEach>
			</tbody>
		
		</table>
		<hr>
	</c:forEach>
	
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>