<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar ${nombreAccesorio}</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	
	<form action="/admin/accesorio/editar" method="POST" class="form_alta_accesorio">
		<h2>Editar ${nombreAccesorio}</h2>
		<div>
			<h4><label for="nombre">Nombre accesorio</label></h4>		
			<input type="text" id="nombre" name="nombre" required>		
		</div>	
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
			<h4><label for="conectividad">Conectividad</label></h4>		
			<input type="text" id="conectividad" name="conectividad" placeholder="USB/HDMI" required>		
		</div>						
		<div>
			<h4><label for="precio">Precio</label></h4>
			<input type="number" id="precio" name="precio" step=".01" placeholder="299.99" required>		
		</div>		

		<input type="hidden" name="idAccesorio" value="${idAccesorio}">	
		
		<div class="contenedor_sub_res_alta_vid">
			<input type="reset" value="Borrar campos" class="reset_alta_accesorio">
			<input type="submit" value="Alta" class="submit_alta_accesorio">	
		</div>					
	</form>
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>