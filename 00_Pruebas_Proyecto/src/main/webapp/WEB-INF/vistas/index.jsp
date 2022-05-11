<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAS Gaming</title>
</head>
<body class="body_background_general">

	<jsp:include page="nav.jsp"></jsp:include>
	
		<header>
			<img src="/images/banners/banner_index.jpg" alt="banner index" class="banner_index">
		</header>
	
		<h3>${mensaje}</h3>
	
		<div class=contenedor_tituloIndex> <h2 class=tituloIndex>NOVEDADES</h2> </div>
		<div class=contenedor_titulos> <h2 class=tituloIndexPS>PS5</h2> </div>
		    <div class="contenedor_tarjetas">
 			<c:forEach var="vec" items="${novedadPs5}">
 				<div class="tarjeta_wrapper">
 				 	<a href="/videojuego/detalle/${vec.videojuego.idVideojuego}">
		            <div class="tarjeta_juego">
		                <div class="imagen_juego">
		                    <img src="/images/videojuegos/${vec.videojuego.imagenCuadrada}" alt="imagen_juego">
		                </div>
		                <div class="titulo_juego">${vec.videojuego.titulo}</div>
		                
		                <div class="flex_texto_logo">
		                    <div class="contenedor_texto_tarjeta item_flex_tarjeta_1">
		                        <div class="titulo_plataforma">${vec.consola.nombre}</div>
		                        <div class="contenedor_precio">${vec.precio} €</div>
		                    </div>
		                    <div class="contenedor_logo_consola item_flex_tarjeta_2">
		                    <div>
		                        	<img src="/images/logos/pegi/${vec.videojuego.imagenPegi}" alt="logo pegi" class="logo_pegi">			                  	
		                    </div>			                    
		                   	<div>
		                        	<img src="/images/logos/consolas/${vec.consola.logoConsola}" alt="logo consola" class="logo_consola">			                    	
		                    </div>
		                    </div>
		                </div>
	            	</div> 
	            </a>
        	</div> 	
 			</c:forEach>
      	</div>
        <div class=contenedor_titulos> <h2 class=tituloIndexSW>SWITCH</h2> </div>
      		<div class="contenedor_tarjetas contenedor_tarjetas_switch">
  			<c:forEach var="vec" items="${novedadSwitch}">
  				<div class="tarjeta_wrapper">
  				 	<a href="/videojuego/detalle/${vec.videojuego.idVideojuego}">
			            <div class="tarjeta_juego">
			                <div class="imagen_juego">
			                    <img src="/images/videojuegos/${vec.videojuego.imagenCuadrada}" alt="imagen_juego">
			                </div>
			                <div class="titulo_juego">${vec.videojuego.titulo}</div>
			                
			                <div class="flex_texto_logo">
			                    <div class="contenedor_texto_tarjeta item_flex_tarjeta_1">
			                        <div class="titulo_plataforma">${vec.consola.nombre}</div>
			                        <div class="contenedor_precio">${vec.precio} €</div>
			                    </div>
			                    <div class="contenedor_logo_consola item_flex_tarjeta_2">
			                        <div>
			                        	<img src="/images/logos/pegi/${vec.videojuego.imagenPegi}" alt="logo pegi" class="logo_pegi">			                  	
			                        </div>			                    
			                    	<div>
			                        	<img src="/images/logos/consolas/${vec.consola.logoConsola}" alt="logo consola" class="logo_consola">			                    	
			                    	</div>              
			                    </div>
			                </div>
		            	</div> 
		            </a>
	        	</div> 	
  			</c:forEach>
       </div>
       <div class=contenedor_titulos> <h2 class=tituloIndexXB>XBOX S/X</h2> </div>
        <div class="contenedor_tarjetas">
  			<c:forEach var="vec" items="${novedadXbox}">
  				<div class="tarjeta_wrapper">
  				 	<a href="/videojuego/detalle/${vec.videojuego.idVideojuego}">
			            <div class="tarjeta_juego">
			                <div class="imagen_juego">
			                    <img src="/images/videojuegos/${vec.videojuego.imagenCuadrada}" alt="imagen_juego">
			                </div>
			                <div class="titulo_juego">${vec.videojuego.titulo}</div>
			                
			                <div class="flex_texto_logo">
			                    <div class="contenedor_texto_tarjeta item_flex_tarjeta_1">
			                        <div class="titulo_plataforma">${vec.consola.nombre}</div>
			                        <div class="contenedor_precio">${vec.precio} €</div>
			                    </div>
			                    <div class="contenedor_logo_consola item_flex_tarjeta_2">
			                    <div>
			                        <img src="/images/logos/pegi/${vec.videojuego.imagenPegi}" alt="logo pegi" class="logo_pegi">			                  	
			                    </div>			                    
			                   	<div>
			                        <img src="/images/logos/consolas/${vec.consola.logoConsola}" alt="logo consola" class="logo_consola">			                    	
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