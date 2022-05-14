<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vec.videojuego.titulo}</title>
<script defer src="/js/slider.js"></script>
</head>
<body class="body_background_detalle">

	<jsp:include page="nav.jsp"></jsp:include>
	
	<section class="seccion_detalle_videojuego">
        <div class="contenedor_videojuego">
            <div class="contenedor_grid_videojuego">
                <div class="contenedor_imagen_videojuego">
                    <img src="/images/videojuegos/${vec.videojuego.imagenRectangular}" alt="imagen videojuego rectangular">
                </div>

				<sec:authorize access="isAuthenticated()">
	                <div class="contenedor_compra">
	                    <h3>¡En stock!</h3>
	                    <div class="contenedor_precio_videojuego">
	                        ${vec.precio} €
	                    </div>
	                    <button type="button" class="btn btn-lg btn-comprar">
	                        <img src="/images/iconos/carrito_compra.png" alt="imagen carrito">
	                        Añadir
	                    </button>
	                </div>
				</sec:authorize>
				
				<sec:authorize access="!isAuthenticated()">
	                <div class="contenedor_compra">
						<p><a href="/registro">Regístrate</a> o <a href="/login">loguéate</a> para realizar tu compra.</p>
						<p>¡Gracias!</p>
	                </div>
				</sec:authorize>				
				
				
				
                <div class="contenedor_caja_videojuego">
                    <img src="/images/videojuegos/${vec.imagenCaja}" alt="caja videojuego">
                </div>

                <div class="titulo_videojuego">
                    <h3>${vec.videojuego.titulo}</h3>
                </div>

                <div class="contenedor_logos">
                    <div class="contenedor_logo_consola">
                        <img src="/images/logos/consolas/${vec.consola.logoConsola}" alt="logo consola" class="imagen_logo_consola">
                    </div>
                    <div class="contenedor_logo_pegi">
                        <img src="/images/logos/pegi/${vec.videojuego.imagenPegi}" alt="" class="imagen_logo_pegi">
                    </div>
                </div> 

                <div class="contenedor_info_videojuego_1">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <strong>Consola</strong><br>
                            ${vec.consola.nombre}
                        <li class="list-group-item">
                            <strong>Fecha de lanzamiento</strong><br>
                            <fmt:formatDate pattern = "dd-MM-yyyy" value = "${vec.videojuego.fechaLanzamiento}"/>
                        </li>
                        <li class="list-group-item">
                            <strong>Género</strong><br>
                      		<c:forEach var="vyg" items="${listaVyg}">
                      			${vyg.genero.nombre} /
                      		</c:forEach>
                        </li>
                    </ul>
                </div>

                <div class="contenedor_info_videojuego_2">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <strong>Número de jugadores</strong><br>
                            ${vec.videojuego.numeroJugadores}
                        </li>
                        <li class="list-group-item">
                            <strong>Estudio</strong><br>
                            ${vec.videojuego.estudio}
                        </li>
                        <li class="list-group-item">
                            <strong>Clasificación por edades</strong><br>
                            ${vec.videojuego.clasificacionEdad}
                        </li>
                    </ul>
                </div>

                <div class="contenedor_puntuacion">
                    <h5 class="puntuacion_texto">Metacritic</h5>
                    <div class="figura_puntuacion">
                        ${vec.videojuego.puntuacion}
                    </div>
                </div>


                <div class="contenedor_descripcion_videojuego">
                    <strong>Descripción</strong><br>
                    ${vec.videojuego.descripcion}
                </div>

                <div class="contenedor_slides">
                    <div class="slide">
                        <img src="/images/videojuegos/${vec.videojuego.imagen1}">
                    </div>

                    <div class="slide">
                        <img src="/images/videojuegos/${vec.videojuego.imagen2}">
                    </div>
                
                    <div class="slide">
                        <img src="/images/videojuegos/${vec.videojuego.imagen3}">
                    </div>
                
                    <div class="slide">
                        <img src="/images/videojuegos/${vec.videojuego.imagen4}">
                    </div>
                
                    <div class="slide">
                        <img src="/images/videojuegos/${vec.videojuego.imagen5}">
                    </div>
                               
                    <!-- Botones "anterior" y "siguiente" -->
                    <a class="anterior">&#10094;</a>
                    <a class="siguiente">&#10095;</a>

                    <div class="contenedor_imagenes_mini">
                        <div class="contenedor_imagen_mini">
                            <img class="imagen_mini" src="/images/videojuegos/${vec.videojuego.imagen1}" alt="imagen videojuego" data-tab="1">
                        </div>
                        <div class="contenedor_imagen_mini">
                            <img class="imagen_mini" src="/images/videojuegos/${vec.videojuego.imagen2}" alt="imagen videojuego" data-tab="2">
                        </div>
                        <div class="contenedor_imagen_mini">
                            <img class="imagen_mini" src="/images/videojuegos/${vec.videojuego.imagen3}" alt="imagen videojuego" data-tab="3">
                        </div>
                        <div class="contenedor_imagen_mini">
                            <img class="imagen_mini" src="/images/videojuegos/${vec.videojuego.imagen4}" alt="imagen videojuego" data-tab="4">
                        </div>
                        <div class="contenedor_imagen_mini">
                            <img class="imagen_mini" src="/images/videojuegos/${vec.videojuego.imagen5}" alt="imagen videojuego" data-tab="5">
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </section>
	

</body>
</html>