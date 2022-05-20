<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accesorios PS5</title>
</head>
<body class="body_juegos_ps">
	<jsp:include page="nav.jsp"></jsp:include>
	
		<header>
			<img src="/images/banners/banner_PS5_2.jpg" alt="banner PS" class="banner_PS">
		</header>
	
	    <div class="contenedor_tarjetas contenedor_tarjetas_accesorios">
  			<c:forEach var="accesorio" items="${accesoriosPs5}">
  				<div class="tarjeta_wrapper">
  				 	<a href="/accesorio/detalle/${accesorio.idAccesorio}">
			            <div class="tarjeta_accesorio">
			                <div class="imagen_accesorio">
			                    <img src="/images/accesorios/${accesorio.imagenCuadrada}" alt="imagen accesorio">
			                </div>
			                <div class="titulo_accesorio">${accesorio.nombre}</div>
			                
			                <div class="flex_texto_logo">
			                    <div class="contenedor_texto_tarjeta item_flex_tarjeta_1">
			                        <div class="titulo_plataforma">${accesorio.consola.nombre}</div>
			                        <div class="contenedor_precio">${accesorio.precio} €</div>
			                    </div>
			                    <div class="contenedor_logo_consola item_flex_tarjeta_2">		                        
			                    	<div>
			                        	<img src="/images/logos/consolas/${accesorio.consola.logoConsola}" alt="logo consola" class="logo_consola">			                    	
			                    	</div>
			                    </div>
			                </div>
		            	</div> 
		            </a>
	        	</div> 	
  			</c:forEach>
       </div>
	<jsp:include page="footer.jsp"></jsp:include> 

</body>
</html>

