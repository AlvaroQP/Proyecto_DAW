<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Panel Admin: Accesorios</title>
</head>
<body class="body_admin">

	<jsp:include page="nav.jsp"></jsp:include>

    <table class="admin_tabla tabla_switch">
        <thead>
        	<tr class="tabla_head_1">
	        	<td colspan="2">
	        		<img src="/images/logos/consolas/switch/switch_logo_horizontal.png" alt="Consolas PlayStation 5" class="tabla_videojuegos_logo">
	        	</td>
	        	<td colspan="3">
	        		<a href="/admin/altaAccesorio">
	        			<button class="boton_alta_accesorio">
			        		<span class="material-symbols-outlined icono_alta_videojuego">add_circle</span>
			        		Alta Accesorio
	        			</button>
	        		</a>
	        	</td>	        	
	        	
        	</tr>
            <tr class="tabla_head_2">
                <th>Accesorio</th>
                <th>Imagen</th>                
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="acc" items="${accesoriosSwitch}">
	            <tr>
	                <td>${acc.nombre}</td>
	                <td>
						<img src="/images/accesorios/${acc.imagenCuadrada}" alt="Imagen accesorio" class="tabla_admin_imagen_juego">
					</td>	                
	                <td>${acc.precio} €</td>
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
                <th>Accesorio</th>
                <th>Imagen</th>                
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="acc" items="${accesoriosXbox}">
	            <tr>
	                <td>${acc.nombre}</td>
	                <td>
						<img src="/images/accesorios/${acc.imagenCuadrada}" alt="Imagen accesorio" class="tabla_admin_imagen_juego">
					</td>	                
	                <td>${acc.precio} €</td>
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
                <th>Accesorio</th>
                <th>Imagen</th>                
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="acc" items="${accesoriosPs5}">
	            <tr>
	                <td>${acc.nombre}</td>
	                <td>
						<img src="/images/accesorios/${acc.imagenCuadrada}" alt="Imagen accesorio" class="tabla_admin_imagen_juego">
					</td>	                
	                <td>${acc.precio} €</td>
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