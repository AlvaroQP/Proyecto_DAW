<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="shortcut icon" type="imagen/x-icon" href="/images/logos/jas_gaming/favicon.png">
<link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
</head>
<body>

    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">
                <img src="/images/logos/jas_gaming/jas_gaming_rectangulo.png" alt="JAS Gaming" class="logo_jas">
            </a>
            <button class="navbar-toggler navbar-dark" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarToggler">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <div class=" drop-menu">
                        <button class="dropbtn">
                        <img src="/images/iconos/mushroom.png" class="icono_nav_admin">
                        	Videojuegos 
                            <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="drop-content">
                            <a class="nav-link" href="/videojuego/ps5">
	                            <img src="/images/iconos/icono_ps.png" class="nav_logo_consola">
	                            PlayStation 5
                            </a>
	                            <a class="nav-link" href="/videojuego/switch">
	                            <img src="/images/iconos/icono_switch.png" class="nav_logo_consola">
                            	Nintendo Switch
                            </a>
                            <a class="nav-link" href="/videojuego/xbox">
	                            <img src="/images/iconos/icono_xbox.png" class="nav_logo_consola">
	                            Xbox Series X/S
                            </a>
                          </div>
                    </div>
                    <div class=" drop-menu">
                        <button class="dropbtn">
                        	<img src="/images/iconos/consola.png" class="icono_nav_admin">
                        	Consolas 
                            <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="drop-content">
                            <a class="nav-link" href="/consola/ps5">
	                            <img src="/images/iconos/icono_ps.png" class="nav_logo_consola">
	                            PlayStation 5
                            </a>
                            <a class="nav-link" href="/consola/switch">
	                            <img src="/images/iconos/icono_switch.png" class="nav_logo_consola">
	                            Nintendo Switch
                            </a>
                            <a class="nav-link" href="/consola/xbox">
	                            <img src="/images/iconos/icono_xbox.png" class="nav_logo_consola">
	                            Xbox Series X/S
                            </a>
                          </div>
                    </div>
                    <div class=" drop-menu">
                        <button class="dropbtn">
                        	<img src="/images/iconos/controller.png" class="icono_nav_admin">
                        	Accesorios 
                            <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="drop-content">
                            <a class="nav-link" href="/accesorio/ps5">
	                            <img src="/images/iconos/icono_ps.png" class="nav_logo_consola">
	                            PlayStation 5
                            </a>
                            <a class="nav-link" href="/accesorio/switch">
	                            <img src="/images/iconos/icono_switch.png" class="nav_logo_consola">
	                            Nintendo Switch
                            </a>
                            <a class="nav-link" href="/accesorio/xbox">
	                            <img src="/images/iconos/icono_xbox.png" class="nav_logo_consola">
	                            Xbox Series X/S
                            </a>
                          </div>
                     </div>   
                     
                     <sec:authorize access="hasAuthority('admin')"> 
	                     <div class=" drop-menu">
	                        <button class="dropbtn">
	                        	<div class="div_panel_admin">
	                        		<img src="/images/iconos/escudo.png" class="icono_nav_admin">
	                        		<!-- <span class="material-symbols-outlined icono_admin">admin_panel_settings</span> -->
	                        		<span class="titulo_admin">Admin</span> 
	                        		<i class="fa fa-caret-down"></i>
	                        	</div>                        
	                        </button>
	                        <div class="drop-content">
	                            <a class="nav-link" href="/admin/videojuego">
	                            	<img src="/images/iconos/mushroom.png" class="icono_nav_admin">
		                            Videojuegos
	                            </a>
	                            <a class="nav-link" href="/admin/consola">
	                            	<img src="/images/iconos/consola.png" class="icono_nav_admin">
		                            Consolas
	                            </a>
	                            <a class="nav-link" href="/admin/accesorio">
	                            	<img src="/images/iconos/controller.png" class="icono_nav_admin">
		                            Accesorios
	                            </a>
	                            <a class="nav-link" href="/admin/cliente">
	                            	<img src="/images/iconos/users.png" class="icono_nav_admin">
		                            Clientes
	                            </a>
	                          </div>
	                     </div>   
                     </sec:authorize>
                     
                     <sec:authorize access="hasAuthority('cliente')">
                     	<div class="div_carrito_nav">
	                     	<a class="" href="/cliente/carrito"> 
                        		<div class="material-symbols-outlined icono_carrito_compra">shopping_cart</div>
                        		<div class="titulo_carrito">Carrito</div> 
	                        </a>
	                    </div>
                     </sec:authorize>    
                   </ul>
                
                	
                
                	<div class="contenedor_usuario">
                
                	<sec:authorize access="!isAuthenticated()">
	                	<div class="contenedor_login_registro">
		                    <div>
			                	<a href="/login">
			                		<span class="material-symbols-outlined icono_login">account_circle</span>
			                		Login
			                	</a>
		                	</div>
		                	<div>
			                	<a href="/registro">
			                		<span class="material-symbols-outlined icono_registro">person_add</span>
			                		Registro
			                	</a>
		                	</div>   
	                	</div>
	                 </sec:authorize>
	                 <sec:authorize access="isAuthenticated()">
                	    <div class=" drop-menu">
		                	<div class="contenedor_info_usuario">
		                		<img src="${usuario.avatarUsuario}" alt="avatar">
		                		<span>${usuario.username}</span>
		                		<i class="fa fa-caret-down"></i>
                			</div>
	                        <div class="drop-content">
	                            <a class="nav-link" href="/perfil">
									<span class="material-symbols-outlined icono_contenedor_usuario">account_circle</span>
		                            Perfil
	                            </a>
	                            <sec:authorize access="hasAuthority('cliente')"> 
		                            <a class="nav-link" href="/cliente/pedidos">
			                            <span class="material-symbols-outlined icono_contenedor_usuario">shopping_bag</span>
			                            Mis Pedidos
		                            </a>
	                            </sec:authorize>
	                            <a class="nav-link" href="/logout">
		                            <span class="material-symbols-outlined icono_contenedor_usuario">logout</span>
		                            Cerrar Sesión
	                            </a>
	                          </div>
	                      </div>  
	                  </sec:authorize> 
                	</div>
               
          </div>
        </div>
    </nav>


</body>
</html>