<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>¡Gracias por tu compra!</title>
</head>
<body class="body_compra_realizada">

	<jsp:include page="nav.jsp"></jsp:include>

	<div class="contenedor_compra_realizada">
		<div>
			<img src="/images/png/reparto.png" class="imagen_reparto">
		</div>
		<h2>¡Gracias por tu compra, ${usuario.nombre}!</h2>
		<p>
			Tu pedido ha sido registrado el día <fmt:formatDate pattern = "dd-MM-yyyy" value = "${fecha}"/> y
			tus artículos serán enviados en un plazo máximo de 24h a la dirección: <strong>${usuario.direccion}</strong>.
		</p>
		<br>
		<p>
			Por favor, comprueba la verificación del pedido que hemos enviado al correo: <strong>${usuario.email}</strong>.
		</p>   
		<div class="contenedor_boton_compra_realizada">
			<a href="/cliente/pedidos">
				<button class="boton_compra_realizada">Mis pedidos</button>
			</a>
		</div>
		 	    
	</div>

	<jsp:include page="footer.jsp"></jsp:include>	

</body>
</html>