<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${modeloConsola.nombre}</title>
<script defer src="/js/slider.js"></script>
</head>
<body class="body_background_detalle">

	<jsp:include page="nav.jsp"></jsp:include>


	<section class="seccion_detalle_consola">
        <div class="contenedor_consola">
            <div class="contenedor_grid_consola">
                <div class="contenedor_imagen_consola">
                    <img src="/images/consolas/${modeloConsola.imagenRectangular}" alt="imagen consola">
                </div>
			<sec:authorize access="hasAuthority('cliente')">
                <div class="contenedor_compra">
                    <h3>¡En stock!</h3>
                    <div class="contenedor_precio_consola">
                        ${modeloConsola.precio} €
                    </div>
                    <a href="/cliente/anadir/consola/${modeloConsola.idModeloConsola}">
	                    <button type="button" class="btn btn-lg btn-comprar">
	                        <img src="/images/iconos/carrito_compra.png" alt="imagen carrito">
	                        Añadir
	                    </button>
                    </a>
                </div>
            </sec:authorize>
			<sec:authorize access="hasAuthority('admin')">
				<div class="contenedor_compra_vacio_consola">
					<img src="/images/logos/jas_gaming/jas_gaming_logo.png" alt="logo" class="">
				</div>
			</sec:authorize>
			<sec:authorize access="!isAuthenticated()">
				<div class="contenedor_compra_vacio_consola">
					<img src="/images/logos/jas_gaming/jas_gaming_logo.png" alt="logo" class="">
				</div>
			</sec:authorize>


                <div class="contenedor_caja_consola">
                    <img src="/images/consolas/${modeloConsola.imagenCuadrada}" alt="caja consola">
                </div>

				<div class="nombre_consola">
                    <h3>${modeloConsola.nombre}</h3>
                </div>

                <div class="contenedor_info_consola_1">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <strong>Fecha de lanzamiento</strong><br>
                            <fmt:formatDate pattern = "dd-MM-yyyy" value = "${modeloConsola.fechaLanzamiento}"/>
                        </li>
                        <li class="list-group-item">
                            <strong>Memoria consola</strong><br>
                            ${modeloConsola.memoriaConsola}
                        </li>

                    </ul>
                </div>

                <div class="contenedor_info_consola_2">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <strong>Tamaño</strong><br>
                            ${modeloConsola.tamano}
                        </li>
                        <li class="list-group-item">
                            <strong>Peso</strong><br>
                            ${modeloConsola.peso}
                        </li>
                    </ul>
                </div>

                <div class="contenedor_descripcion_videojuego contenedor_descripcion_consola">
                    <strong>Descripción</strong><br>
                    ${modeloConsola.descripcion}
                </div>

                <div class="contenedor_slides">
                    <div class="slide">
                        <img src="/images/consolas/${modeloConsola.imagen1}">
                    </div>

                    <div class="slide">
                        <img src="/images/consolas/${modeloConsola.imagen2}">
                    </div>
                
                    <div class="slide">
                        <img src="/images/consolas/${modeloConsola.imagen3}">
                    </div>
                

                               
                    <!-- Botones "anterior" y "siguiente" -->
                    <a class="anterior">&#10094;</a>
                    <a class="siguiente">&#10095;</a>

                    <div class="contenedor_imagenes_mini">
                        <div class="contenedor_imagen_mini">
                            <img class="imagen_mini" src="/images/consolas/${modeloConsola.imagen1}" alt="imagen videojuego" data-tab="1">
                        </div>
                        <div class="contenedor_imagen_mini">
                            <img class="imagen_mini" src="/images/consolas/${modeloConsola.imagen2}" alt="imagen videojuego" data-tab="2">
                        </div>
                        <div class="contenedor_imagen_mini">
                            <img class="imagen_mini" src="/images/consolas/${modeloConsola.imagen3}" alt="imagen videojuego" data-tab="3">
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </section>


</body>
</html>