<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar ${nombreConsola}</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	
	<form action="/admin/consola/editar" method="POST" class="form_alta_consola">
		<h2>Editar ${nombreConsola}</h2>

		<div>
			<h4><label for="nombre">Nombre consola</label></h4>		
			<input type="text" id="nombre" name="nombre" required>		
		</div>
		<!--
		<div>
			<h4><label for="consola">Plataforma consola</label></h4> 	
			<select id="consola" name="idConsola">
				<option value="switch">Nintendo Switch</option>
				<option value="ps5">PlayStation 5</option>
				<option value="xbox_s_xs">Xbox Series X/S</option>							
			</select>	
		</div>
		-->		
		<div>
			<h4><label for="fechaLanzamiento">Fecha lanzamiento</label></h4>			
			<input type="date" id="fechaLanzamiento" name="fechaLanzamiento" required>	
		</div>			
		<div>
			<h4><label for="descripcion">Descripción</label></h4>
			<textarea rows="10" cols="50" name="descripcion" required></textarea>
		</div>	
		<div>
			<h4><label for="tamano">Tamaño</label></h4>		
			<input type="text" id="tamano" name="tamano" placeholder="50cm x 20cm x 40cm" required>		
		</div>	
		<div>
			<h4><label for="peso">Peso</label></h4>		
			<input type="text" id="peso" name="peso" placeholder="3.5kg" required>		
		</div>
		<div>
			<h4><label for="memoriaConsola">Memoria</label></h4>		
			<input type="text" id="memoriaConsola" name="memoriaConsola" placeholder="500 GB" required>		
		</div>						
		<div>
			<h4><label for="precio">Precio</label></h4>
			<input type="number" id="precio" name="precio" step=".01" placeholder="299.99" required>		
		</div>		

		<input type="hidden" name="idModeloConsola" value="${idModeloConsola}">	
		
		<div class="contenedor_sub_res_alta_vid">
			<input type="reset" value="Borrar campos" class="reset_alta_consola">	
			<input type="submit" value="Alta" class="submit_alta_consola">			
		</div>					
	
	</form>
	
	
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>