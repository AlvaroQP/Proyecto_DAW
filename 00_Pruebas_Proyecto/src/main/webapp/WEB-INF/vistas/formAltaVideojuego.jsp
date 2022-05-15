<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alta Videojuego Switch</title>
<link href="/css/style.css" rel="stylesheet">
</head>
<body class="body_form_alta_videojuego">

	<jsp:include page="nav.jsp"></jsp:include>

	<form action="/admin/altaVideojuegoSwitch" method="POST" class="form_alta_videojuego">
	 	<h2>Alta Videojuego</h2>

		<img src="/images/png/pikachu.png" class="imagen_form_alta_vj">

		<div>
			<h4><label for="titulo">Título</label></h4>		
			<input type="text" id="titulo" name="titulo" required>		
		</div>
		<div>
			<h4><label for="estudio">Estudio</label></h4>			
			<input type="text" id="estudio" name="estudio" required>		
		</div>
		<h4><label for="consola">Consola</label></h4> 
		<select id="consola" name="idConsola">
			<option value="switch">Nintendo Switch</option>
			<option value="ps5">PlayStation 5</option>
			<option value="xbox_s_xs">Xbox Series X/S</option>							
		</select>		
		<div>
			<h4><label for="fechaLanzamiento">Fecha lanzamiento</label></h4>			
			<input type="date" id="fechaLanzamiento" name="fechaLanzamiento" required>	
		</div>			
		<div>
			<h4><label for="descripcion">Descripción</label></h4>
			<textarea rows="10" cols="50" name="descripcion" required></textarea>
		</div>
				
		<div class="form_alta_videojuego_grid">
			<div>
				<h4><label for="clasificacionEdad">Clasificación Edad</label></h4> 	
				<select id="clasificacionEdad" name="clasificacionEdad">
					<option value="PEGI 3">PEGI 3</option>
					<option value="PEGI 7">PEGI 7</option>
					<option value="PEGI 12">PEGI 12</option>	
					<option value="PEGI 16">PEGI 16</option>				
					<option value="PEGI 18">PEGI 18</option>						
				</select>	
			</div>			
			<div class="contenedor_checkbox">
				<div> 
					<h4>Novedad</h4> 
					<input type="radio" id="si" name="novedad" value="s" checked>
					<label for="si">Sí</label>
					<input type="radio" id="no" name="novedad" value="n">
					<label for="no">No</label>
				</div>	
			</div>
			<div>
				<h4><label for="puntuacion">Puntuación Metracritic (0-100)</label></h4>
				<input type="number" id="puntuacion" name="puntuacion" min="0" max="100" required>		
			</div>		
			<div>
				<h4><label for="stock">Stock</label></h4>
				<input type="number" id="stock" name="stock" min="1" max="50" required>		
			</div>		
			<div>
				<h4><label for="numeroJugadores">Número de jugadores</label></h4>
				<input type="text" id="numeroJugadores" name="numeroJugadores" placeholder="1-4" required>		
			</div>		
			<div>
				<h4><label for="precio">Precio</label></h4>
				<input type="number" id="precio" name="precio" placeholder="59.99" required>		
			</div>				
		</div>
			
		<h4>Género/s</h4>
		<div class="contenedor_generos_form">
			<c:forEach var="genero" items="${listadoGeneros}">
				<div>
					<input type="checkbox" id="${genero.nombre}" name="genero" value="${genero.idGenero}">
					<label for="${genero.nombre}">${genero.nombre}</label>
				</div>							
			</c:forEach>
		</div>
		
		<div>
			<h4><label for="imagenCuadrada">Imagen cuadrada</label></h4>
			<input type="text" id="imagenCuadrada" name="imagenCuadrada" placeholder="/images/videojuegos/tetris/tetris_cuadrada.jpg" required>		
		</div>			
		<div>
			<h4><label for="imagenRectangular">Imagen rectangular</label></h4>
			<input type="text" id="imagenRectangular" name="imagenRectangular" placeholder="/images/videojuegos/tetris/tetris_rectangular.jpg" required>		
		</div>				
		<div>
			<h4><label for="imagen1">Imagen 1</label></h4>
			<input type="text" id="imagen1" name="imagen1" placeholder="/images/videojuegos/tetris/tetris_1.jpg" required>		
		</div>				
		<div>
			<h4><label for="imagen2">Imagen 2</label></h4>
			<input type="text" id="imagen2" name="imagen2" placeholder="/images/videojuegos/tetris/tetris_2.jpg" required>		
		</div>				
		<div>
			<h4><label for="imagen3">Imagen 3</label></h4>
			<input type="text" id="imagen3" name="imagen3" placeholder="/images/videojuegos/tetris/tetris_3.jpg" required>		
		</div>				
		<div>
			<h4><label for="imagen4">Imagen 4</label></h4>
			<input type="text" id="imagen4" name="imagen4" placeholder="/images/videojuegos/tetris/tetris_4.jpg" required>		
		</div>		
		<div>
			<h4><label for="imagen5">Imagen 5</label></h4>
			<input type="text" id="imagen5" name="imagen5" placeholder="/images/videojuegos/tetris/tetris_5.jpg" required>		
		</div>			
		<div>
			<h4><label for="imagenCaja">Imagen caja</label></h4>
			<input type="text" id="imagenCaja" name="imagenCaja" placeholder="/images/videojuegos/tetris/tetris_caja.jpg" required>		
		</div>			
						
		<input type="hidden" name="consolaSwitch" value="switch">
	
		<div class="contenedor_sub_res_alta_vid">
			<input type="submit" value="Alta" class="submit_alta_videojuego">
			<input type="reset" value="Borrar campos" class="reset_alta_videojuego">	
		</div>
					
	</form>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>