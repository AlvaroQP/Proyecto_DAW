<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alta Videojuego Switch</title>
</head>
<body>

	<form action="/admin/altaVideojuegoSwitch" method="POST">
		<div>
			<label for="titulo">Título</label><br>
			<input type="text" id="titulo" name="titulo" required>		
		</div>
		<div>
			<label for="estudio">Estudio</label><br>
			<input type="text" id="estudio" name="estudio" required>		
		</div>
		<div>
			<label for="fechaLanzamiento">Fecha lanzamiento</label><br>
			<input type="date" id="fechaLanzamiento" name="fechaLanzamiento" required>		
		</div>			
		<div>
			<label for="descripcion">Descripción</label><br>
			<textarea rows="10" cols="50" name="descripcion" required></textarea>
		</div>
		<div>
			<label for="clasificacionEdad">Clasificación Edad</label>		
			<select id="clasificacionEdad" name="clasificacionEdad">
				<option value="PEGI 3">PEGI 3</option>
				<option value="PEGI 7">PEGI 7</option>
				<option value="PEGI 12">PEGI 12</option>	
				<option value="PEGI 16">PEGI 16</option>				
				<option value="PEGI 18">PEGI 18</option>						
			</select>	
		</div>			
		<div class="contenedor_checkbox">
			<div> Novedad
				<input type="radio" id="si" name="novedad" value="s">
				<label for="si">Sí</label>
			</div>
			<div>
				<input type="radio" id="no" name="novedad" value="n">
				<label for="no">No</label>
			</div>
		</div>
		<div>
			<label for="puntuacion">Puntuación</label><br>
			<input type="number" id="puntuacion" name="puntuacion" min="0" max="100" required>		
		</div>		
		<div>
			<label for="stock">Stock</label><br>
			<input type="number" id="stock" name="stock" min="1" max="50" required>		
		</div>		
		<div>
			<label for="numeroJugadores">Número de jugadores</label><br>
			<input type="text" id="numeroJugadores" name="numeroJugadores" placeholder="1-4" required>		
		</div>		
		<div>
			<label for="precio">Precio</label><br>
			<input type="number" id="precio" name="precio" step=".1" placeholder="59.99" required>		
		</div>		
		
		
		<div class="contenedor_generos_form">
			Género
			<c:forEach var="genero" items="${listadoGeneros}">
				<div>
					<input type="checkbox" id="genero" name="genero" value="${genero.idGenero}">
					<label for="genero">${genero.nombre}</label>
				</div>							
			</c:forEach>
		</div>
		
		<div>
			<label for="imagenCuadrada">Imagen cuadrada</label><br>
			<input type="text" id="imagenCuadrada" name="imagenCuadrada" placeholder="/images/videojuegos/tetris/tetris_cuadrada.jpg" required>		
		</div>			
		<div>
			<label for="imagenRectangular">Imagen rectangular</label><br>
			<input type="text" id="imagenRectangular" name="imagenRectangular" placeholder="/images/videojuegos/tetris/tetris_rectangular.jpg" required>		
		</div>				
		<div>
			<label for="imagen1">Imagen 1</label><br>
			<input type="text" id="imagen1" name="imagen1" placeholder="/images/videojuegos/tetris/tetris_1.jpg" required>		
		</div>				
		<div>
			<label for="imagen2">Imagen 2</label><br>
			<input type="text" id="imagen2" name="imagen2" placeholder="/images/videojuegos/tetris/tetris_2.jpg" required>		
		</div>				
		<div>
			<label for="imagen3">Imagen 3</label><br>
			<input type="text" id="imagen3" name="imagen3" placeholder="/images/videojuegos/tetris/tetris_3.jpg" required>		
		</div>				
		<div>
			<label for="imagen4">Imagen 4</label><br>
			<input type="text" id="imagen4" name="imagen4" placeholder="/images/videojuegos/tetris/tetris_4.jpg" required>		
		</div>		
		<div>
			<label for="imagen5">Imagen 5</label><br>
			<input type="text" id="imagen5" name="imagen5" placeholder="/images/videojuegos/tetris/tetris_5.jpg" required>		
		</div>			
		<div>
			<label for="imagenCaja">Imagen caja</label><br>
			<input type="text" id="imagenCaja" name="imagenCaja" placeholder="/images/videojuegos/tetris/tetris_caja.jpg" required>		
		</div>			
						
		<input type="hidden" name="consolaSwitch" value="switch">
	
		<input type="submit" value="Alta">						
	</form>



</body>
</html>