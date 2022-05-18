<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${accesorio.nombre}</title>
<script defer src="/js/slider.js"></script>
</head>
<body class="body_background_detalle">

	<jsp:include page="nav.jsp"></jsp:include>

	<section class="seccion_detalle_accesorio">
        <div class="contenedor_accesorio">
            <div class="contenedor_grid_accesorio">
                <div class="contenedor_imagen_accesorio">
                    <img src="/images/accesorios/${accesorio.imagenRectangular}" alt="imagen accesorio">
                </div>

	 		<sec:authorize access="hasAuthority('cliente')">
                <div class="contenedor_compra">
                    <h3>¡En stock!</h3>
                    <div class="contenedor_precio_accesorio">
                        ${accesorio.precio} €
                    </div>
                    <a href="/cliente/anadir/accesorio/${accesorio.idAccesorio}">
	                    <button type="button" class="btn btn-lg btn-comprar">
	                        <img src="/images/iconos/carrito_compra.png" alt="imagen carrito">
	                        Añadir
	                    </button>
                    </a>
                </div>
			</sec:authorize>
			<sec:authorize access="hasAuthority('admin')">
				<div class="contenedor_compra_vacio_accesorio">
					<img src="/images/logos/jas_gaming/jas_gaming_logo.png" alt="logo" class="">
				</div>
			</sec:authorize>
			<sec:authorize access="!isAuthenticated()">
				<div class="contenedor_compra_vacio_accesorio">
					<img src="/images/logos/jas_gaming/jas_gaming_logo.png" alt="logo" class="">
				</div>
			</sec:authorize>

			
                <div class="contenedor_caja_accesorio">
                    <img src="/images/accesorios/${accesorio.imagenCuadrada}" alt="caja accesorio">
                </div>

				<div class="nombre_accesorio">
                    <h3>${accesorio.nombre}</h3>
                </div>

                <div class="contenedor_info_accesorio_1">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <strong>Fecha de lanzamiento</strong><br>
                            <fmt:formatDate pattern = "dd-MM-yyyy" value = "${accesorio.fechaLanzamiento}"/>
                        </li>
                        <li class="list-group-item">
                            <strong>Conectividad</strong><br>
                            ${accesorio.conectividad}
                        </li>
                    </ul>
                </div>

                <div class="contenedor_info_accesorio_2">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <strong>Tamaño</strong><br>
                            ${accesorio.tamano}
                        </li>
                        <li class="list-group-item">
                            <strong>Peso</strong><br>
                            ${accesorio.peso}
                        </li>
                    </ul>
                </div>

                <div class="contenedor_descripcion_accesorio">
                    <strong>Descripción</strong><br>
                    ${accesorio.descripcion}
                </div>

                <div class="contenedor_slides">
                    <div class="slide">
                        <img src="/images/accesorios/${accesorio.imagen1}" alt="imagen accesorio">
                    </div>

                    <div class="slide">
                        <img src="/images/accesorios/${accesorio.imagen2}" alt="imagen accesorio">
                    </div>
                
                    <div class="slide">
                        <img src="/images/accesorios/${accesorio.imagen3}" alt="imagen accesorio">
                    </div>
                

                               
                    <!-- Botones "anterior" y "siguiente" -->
                    <a class="anterior">&#10094;</a>
                    <a class="siguiente">&#10095;</a>

                    <div class="contenedor_imagenes_mini">
                        <div class="contenedor_imagen_mini">
                            <img class="imagen_mini" src="/images/accesorios/${accesorio.imagen1}" alt="imagen accesorio" data-tab="1">
                        </div>
                        <div class="contenedor_imagen_mini">
                            <img class="imagen_mini" src="/images/accesorios/${accesorio.imagen2}" alt="imagen accesorio" data-tab="2">
                        </div>
                        <div class="contenedor_imagen_mini">
                            <img class="imagen_mini" src="/images/accesorios/${accesorio.imagen3}" alt="imagen accesorio" data-tab="3">
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </section>
	

</body>
</html>