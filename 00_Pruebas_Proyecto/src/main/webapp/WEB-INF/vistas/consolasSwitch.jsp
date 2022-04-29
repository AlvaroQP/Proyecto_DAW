<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consolas Nintendo Switch</title>
</head>
<body>
	
	<jsp:include page="nav.jsp"></jsp:include>
	
	    <div class="contenedor_tarjetas">
  			<c:forEach var="modConsola" items="${consolasSwitch}">
  				<div class="tarjeta_wrapper">
  				 	<a href="/consola/detalle/${modConsola.idModeloConsola}">
			            <div class="tarjeta_juego tarjeta_consola">
			                <div class="imagen_juego imagen_consola">
			                    <img src="/images/consolas/${modConsola.imagenCuadrada}" alt="imagen consola">
			                </div>
			                <div class="titulo_juego titulo_consola">${modConsola.nombre}</div>
			                
			                <div class="flex_texto_logo">
			                    <div class="contenedor_texto_tarjeta item_flex_tarjeta_1">
			                        <div class="titulo_plataforma">${modConsola.consola.nombre}</div>
			                        <div class="contenedor_precio">${modConsola.precio} €</div>
			                    </div>
			                    <div class="contenedor_logo_consola item_flex_tarjeta_2">		                        
			                    	<div>
			                        	<img src="/images/logos/consolas/${modConsola.consola.logoConsola}" alt="logo consola" class="logo_consola">			                    	
			                    	</div>
  
			                    </div>
			                </div>
		            	</div> 
		            </a>
	        	</div> 	
  			</c:forEach>
       </div>
</body>
</html>