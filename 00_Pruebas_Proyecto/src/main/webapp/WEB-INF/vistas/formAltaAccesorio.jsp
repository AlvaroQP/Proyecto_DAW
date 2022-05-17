<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alta accesorio</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	
	<form action="/admin/altaAccesorio" method="POST" enctype="multipart/form-data" class="form_alta_accesorio">
		<h2>Alta Accesorio</h2>
		<div>
			<h4><label for="nombre">Nombre accesorio</label></h4>		
			<input type="text" id="nombre" name="nombre" required>		
		</div>
		<div>
			<h4><label for="consola">Plataforma accesorio</label></h4> 	
			<select id="consola" name="idConsola">
				<option value="switch">Nintendo Switch</option>
				<option value="ps5">PlayStation 5</option>
				<option value="xbox_s_xs">Xbox Series X/S</option>							
			</select>	
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
		<div>
			<h4><label for="nombreCarpeta">Nombre carpeta accesorio</label></h4>
			<input type="text" id="nombreCarpeta" name="nombreCarpeta" required>
		</div>							
		<div>
			<h4><label for="imagenCuadrada">Imagen cuadrada</label></h4>
			<input type="file" id="imagenCuadrada" name="imagenCua" accept="image/png, image/jpeg" required>		
		</div>			
		<div>
			<h4><label for="imagenRectangular">Imagen rectangular</label></h4>
			<input type="file" id="imagenRectangular" name="imagenRec" required>		
		</div>		
		<div>
			<h4><label for="imagen1">Imagen 1</label></h4>
			<input type="file" id="imagen1" name="imag1" required>		
		</div>				
		<div>
			<h4><label for="imagen2">Imagen 2</label></h4>
			<input type="file" id="imagen2" name="imag2" required>		
		</div>				
		<div>
			<h4><label for="imagen3">Imagen 3</label></h4>
			<input type="file" id="imagen3" name="imag3" required>		
		</div>	
		
		<div class="contenedor_sub_res_alta_vid">
			<input type="submit" value="Alta" class="submit_alta_accesorio">
			<input type="reset" value="Borrar campos" class="reset_alta_accesorio">	
		</div>					
	</form>
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>