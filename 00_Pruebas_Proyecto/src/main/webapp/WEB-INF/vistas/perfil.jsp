<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Perfil ${usuario.username}</title>
</head>
<body class="body_perfil">

   <jsp:include page="nav.jsp"></jsp:include>
   
   <div class="contenedor_perfil_usuario">
    
	   	<div class="contenedor_imagen_perfil">
		   	<div class="perfil_usuario_texto">
	   			${usuario.perfile.nombre}
	   		</div>
	   		<img src="${usuario.avatarUsuario}" alt="avatar usuario" class="perfil_avatar_usuario">
	   		<h2>${usuario.username}</h2>
	   		
	   	</div>
	   	
	    <div class="contenedor_username_perfil">
	   		
	   		
	   	</div>
	   	
	   	<div class="contenedor_datos_perfil_1">
		    <ul class="list-group list-group-flush">
		         <li class="list-group-item li_perfil_1" style="overflow: hidden;">
		         	 <c:if test="${usuario.genero == 'mujer'}">
		             	<img src="/images/png/usuario_mujer.png" alt="" class="png_perfil png_perfil_usuario">
                     </c:if>
                     <c:if test="${usuario.genero == 'hombre'}">
                     	<img src="/images/png/usuario_hombre.png" alt="" class="png_perfil png_perfil_usuario">
                     </c:if>
                     <strong>Nombre</strong><br>
                     ${usuario.nombre} ${usuario.apellidos}
                 </li>
		         <li class="list-group-item" style="overflow: hidden;">
		         	 <img src="/images/png/mail.png" alt="" class="png_perfil png_perfil_mail"> 
                     <strong>Email</strong><br>
                     ${usuario.email}
                 </li>
		         <li class="list-group-item li_perfil_3" style="overflow: hidden;">
		         	 <img src="/images/png/casa.png" alt="" class="png_perfil png_perfil_mapa"> 
                     <strong>Dirección</strong><br>
                     ${usuario.direccion}
                 </li>                                  
            </ul>
	   	</div>
	   	
	   	<div class="contenedor_datos_perfil_2">   		
		    <ul class="list-group list-group-flush">
	   	         <li class="list-group-item li_perfil_4" style="overflow: hidden;">
	   	         	 <img src="/images/png/calendar.png" alt="" class="png_perfil png_perfil_calendario"> 
                     <strong>Fecha de registro</strong><br>
                     <fmt:formatDate pattern = "dd-MM-yyyy" value = "${usuario.fechaRegistro}"/>
                 </li>
		         <li class="list-group-item" style="overflow: hidden;">
		             <img src="/images/png/newsletter.png" alt="" class="png_perfil png_perfil_newsletter">
                     <strong>¿Suscrito a Newsletter?</strong><br>
                     ${usuario.newsletter}
                 </li>
		         <li class="list-group-item li_perfil_6" style="overflow: hidden;">
		         	<c:if test="${usuario.genero == 'hombre'}">
				         <img src="/images/png/gow.png" alt="" class="png_perfil png_perfil_genero_h">         	
		         	</c:if>
		         	<c:if test="${usuario.genero == 'mujer'}">
				         <img src="/images/png/lc.png" alt="" class="png_perfil">         	
		         	</c:if>		         
                     <strong>Género</strong><br>
                     ${usuario.genero}
                 </li>                                  
            </ul>
	   	</div>	   		   		   	
   </div>
   
   
   <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>