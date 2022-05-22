<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro completo</title>
</head>
<body class="body_bienvenida_registro">

	<jsp:include page="nav.jsp"></jsp:include>

	<div class="contenedor_bienvenida_registro">
		<c:if test = "${usu.genero.equals('mujer')}">	
			<div class="bienvenida_jasgaming"><h2>¡Bienvenida a JAS Gaming, ${usu.username}!</h2></div>
		</c:if>
		<c:if test = "${usu.genero.equals('hombre')}">	
			<div class="bienvenida_jasgaming"><h2>¡Bienvenido a JAS Gaming, ${usu.username}!</h2></div>
		</c:if>
		<div class="bienvenida_avatar_usuario"><img src="${usu.avatarUsuario}"></div>
		<div class="bienvenida_mensaje_login">
			¡Loguéate para comenzar a disfrutar de tu nueva tienda favorita!
		</div>	
		<div class="contenedor_boton_login_bienvenida">
			<a href="/login">
				<button class="boton_login_bienvenida">Login</button>
			</a>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>