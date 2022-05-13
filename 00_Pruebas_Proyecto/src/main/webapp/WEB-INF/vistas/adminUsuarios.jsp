<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Panel Admin: Usuarios</title>
</head>
<body class="body_admin">

	<jsp:include page="nav.jsp"></jsp:include>

    <table class="admin_tabla tabla_usuarios">
        <thead>
        	<tr class="tabla_head_1">
	        	<td colspan="5">
	        		<h2>Admins</h2>
	        	</td>
        	</tr>
            <tr class="tabla_head_2">
                <th>Username</th>
                <th>Nombre</th>                
                <th>Avatar</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="usu" items="${usuariosAdmin}">
	            <tr>
	                <td>${usu.username}</td>
	                <td>${usu.nombre} ${usu.apellidos}</td>
	                <td>
						<img src="${usu.avatarUsuario}" alt="Avatar usuario" class="tabla_admin_imagen_juego">
					</td>	                
	                <td class="acciones">
	                    <a href="#" title="Detalle"><img src="/images/iconos/eye-solid.svg" alt="detalle"></a>
	                    <a href="#" title="Editar"><img src="/images/iconos/pen-solid.svg" alt="editar"></a>
	                    <a href="#" title="Eliminar"><img src="/images/iconos/trash-solid.svg" alt="eliminar"></a>
	                </td>
	            </tr>
			</c:forEach>
        </tbody>
    </table>	
    
    <table class="admin_tabla tabla_usuarios">
        <thead>
        	<tr class="tabla_head_1">
	        	<td colspan="5">
	        		<h2>Clientes</h2>
	        	</td>
        	</tr>
            <tr class="tabla_head_2">
                <th>Username</th>
                <th>Nombre</th>                
                <th>Avatar</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="usu" items="${usuariosCliente}">
	            <tr>
	                <td>${usu.username}</td>
	                <td>${usu.nombre} ${usu.apellidos}</td>
	                <td>
						<img src="${usu.avatarUsuario}" alt="Avatar usuario" class="tabla_admin_imagen_juego">
					</td>	                
	                <td class="acciones">
	                    <a href="#" title="Detalle"><img src="/images/iconos/eye-solid.svg" alt="detalle"></a>
	                    <a href="#" title="Editar"><img src="/images/iconos/pen-solid.svg" alt="editar"></a>
	                    <a href="#" title="Eliminar"><img src="/images/iconos/trash-solid.svg" alt="eliminar"></a>
	                </td>
	            </tr>
			</c:forEach>
        </tbody>
    </table>	
    
    

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>