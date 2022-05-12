<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Panel Admin: Videojuegos</title>
</head>
<body class="body_admin">

	<jsp:include page="nav.jsp"></jsp:include>

    <table class="admin_tabla tabla_switch">
        <thead>
        	<tr class="tabla_head_1">
	        	<td colspan="5">
	        		<img src="/images/logos/consolas/switch/switch_logo_horizontal.png" alt="Videojuegos PlayStation 5" class="tabla_videojuegos_logo">
	        	</td>
        	</tr>
            <tr class="tabla_head_2">
                <th>#</th>
                <th>Título</th>
                <th>Imagen</th>                
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="vec" items="${videojuegosSwitch}">
	            <tr>
	                <td>${vec.idVec}</td>
	                <td>${vec.videojuego.titulo}</td>
	                <td>
						<img src="/images/videojuegos/${vec.videojuego.imagenCuadrada}" alt="" class="tabla_admin_imagen_juego">
					</td>	                
	                <td>${vec.precio} €</td>
	                <td class="acciones">
	                    <a href="#" title="Detalle"><img src="/images/iconos/eye-solid.svg" alt="detalle"></a>
	                    <a href="#" title="Editar"><img src="/images/iconos/pen-solid.svg" alt="editar"></a>
	                    <a href="#" title="Eliminar"><img src="/images/iconos/trash-solid.svg" alt="eliminar"></a>
	                </td>
	            </tr>
			</c:forEach>
        </tbody>
    </table>	


    <table class="admin_tabla tabla_xbox">
        <thead>
        	<tr class="tabla_head_1">
	        	<td colspan="5">
	        		<img src="/images/logos/consolas/xbox/xbox_logo_horizontal.png" alt="Videojuegos PlayStation 5" class="tabla_videojuegos_logo">
	        	</td>
        	</tr>
            <tr class="tabla_head_2">
                <th>#</th>
                <th>Título</th>
                <th>Imagen</th>                
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="vec" items="${videojuegosXbox}">
	            <tr>
	                <td>${vec.idVec}</td>
	                <td>${vec.videojuego.titulo}</td>
	                <td>
						<img src="/images/videojuegos/${vec.videojuego.imagenCuadrada}" alt="" class="tabla_admin_imagen_juego">
					</td>	                
	                <td>${vec.precio} €</td>
	                <td class="acciones">
	                    <a href="#" title="Detalle"><img src="/images/iconos/eye-solid.svg" alt="detalle"></a>
	                    <a href="#" title="Editar"><img src="/images/iconos/pen-solid.svg" alt="editar"></a>
	                    <a href="#" title="Eliminar"><img src="/images/iconos/trash-solid.svg" alt="eliminar"></a>
	                </td>
	            </tr>
			</c:forEach>
        </tbody>
    </table>


    <table class="admin_tabla tabla_ps5">
        <thead>
        	<tr class="tabla_head_1">
	        	<td colspan="5">
	        		<img src="/images/logos/consolas/ps/ps5_logo_horizontal.png" alt="Videojuegos PlayStation 5" class="tabla_videojuegos_logo">
	        	</td>
        	</tr>
            <tr class="tabla_head_2">
                <th>#</th>
                <th>Título</th>
                <th>Imagen</th>                
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="vec" items="${videojuegosPs5}">
	            <tr>
	                <td>${vec.idVec}</td>
	                <td>${vec.videojuego.titulo}</td>
	                <td>
						<img src="/images/videojuegos/${vec.videojuego.imagenCuadrada}" alt="" class="tabla_admin_imagen_juego">
					</td>	                
	                <td>${vec.precio} €</td>
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