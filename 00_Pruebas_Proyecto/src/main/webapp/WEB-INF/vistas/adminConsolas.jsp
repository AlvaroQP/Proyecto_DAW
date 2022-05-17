<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Panel Admin: Consolas</title>
</head>
<body class="body_admin">

	<jsp:include page="nav.jsp"></jsp:include>

	<h3 class="alerta_admin_consolas">${mensaje}</h3>

    <table class="admin_tabla tabla_switch">
        <thead>
        	<tr class="tabla_head_1">
	        	<td colspan="2">
	        		<img src="/images/logos/consolas/switch/switch_logo_horizontal.png" alt="Consolas PlayStation 5" class="tabla_videojuegos_logo">
	        	</td>
	        	<td colspan="3">
	        		<a href="/admin/altaConsola">
	        			<button class="boton_alta_consola">
			        		<span class="material-symbols-outlined icono_alta_videojuego">add_circle</span>
			        		Alta Consola
	        			</button>
	        		</a>
	        	</td>
        	</tr>
            <tr class="tabla_head_2">
                <th>Consola</th>
                <th>Imagen</th>                
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="con" items="${consolasSwitch}">
	            <tr>
	                <td>${con.nombre}</td>
	                <td>
						<img src="/images/consolas/${con.imagenCuadrada}" alt="Imagen consola" class="tabla_admin_imagen_juego">
					</td>	                
	                <td>${con.precio} €</td>
	                <td class="acciones">
	                    <a href="/admin/consola/detalle/${con.idModeloConsola}" title="Detalle"><img src="/images/iconos/eye-solid.svg" alt="detalle"></a>
	                    <a href="/admin/consola/editar/${con.idModeloConsola}" title="Editar"><img src="/images/iconos/pen-solid.svg" alt="editar"></a>
	                    <a href="/admin/consola/eliminar/${con.idModeloConsola}" title="Eliminar"><img src="/images/iconos/trash-solid.svg" alt="eliminar"></a>
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
                <th>Consola</th>
                <th>Imagen</th>                
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="con" items="${consolasXbox}">
	            <tr>
	                <td>${con.nombre}</td>
	                <td>
						<img src="/images/consolas/${con.imagenCuadrada}" alt="Imagen consola" class="tabla_admin_imagen_juego">
					</td>	                
	                <td>${con.precio} €</td>
	                <td class="acciones">
	                    <a href="/admin/consola/detalle/${con.idModeloConsola}" title="Detalle"><img src="/images/iconos/eye-solid.svg" alt="detalle"></a>
	                    <a href="/admin/consola/editar/${con.idModeloConsola}" title="Editar"><img src="/images/iconos/pen-solid.svg" alt="editar"></a>
	                    <a href="/admin/consola/eliminar/${con.idModeloConsola}" title="Eliminar"><img src="/images/iconos/trash-solid.svg" alt="eliminar"></a>
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
                <th>Consola</th>
                <th>Imagen</th>                
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="con" items="${consolasPs5}">
	            <tr>
	                <td>${con.nombre}</td>
	                <td>
						<img src="/images/consolas/${con.imagenCuadrada}" alt="Imagen consola" class="tabla_admin_imagen_juego">
					</td>	                
	                <td>${con.precio} €</td>
	                <td class="acciones">
	                    <a href="/admin/consola/detalle/${con.idModeloConsola}" title="Detalle"><img src="/images/iconos/eye-solid.svg" alt="detalle"></a>
	                    <a href="/admin/consola/editar/${con.idModeloConsola}" title="Editar"><img src="/images/iconos/pen-solid.svg" alt="editar"></a>
	                    <a href="/admin/consola/eliminar/${con.idModeloConsola}" title="Eliminar"><img src="/images/iconos/trash-solid.svg" alt="eliminar"></a>
	                </td>
	            </tr>
			</c:forEach>
        </tbody>
    </table>	



	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>