<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
            <a class="navbar-brand" href="/index">
                <img src="/images/logos/jas_gaming/jas_gaming_rectangulo.png" alt="JAS Gaming" class="logo_jas">
            </a>
            <button class="navbar-toggler navbar-dark" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarToggler">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <div class=" drop-menu">
                        <button class="dropbtn">Videojuegos 
                            <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="drop-content">
                            <a class="nav-link" href="/videojuego/ps5">
	                            <img src="/images/logos/consolas/ps/playstation_logo.png" class="nav_logo_consola">
	                            PlayStation 5
                            </a>
	                            <a class="nav-link" href="/videojuego/switch">
	                            <img src="/images/logos/consolas/switch/switch_logo.png" class="nav_logo_consola">
                            Nintendo Switch
                            </a>
                            <a class="nav-link" href="/videojuego/xbox">
	                            <img src="/images/logos/consolas/xbox/xbox_logo.png" class="nav_logo_consola">
	                            Xbox Series X/S
                            </a>
                          </div>
                    </div>
                    <div class=" drop-menu">
                        <button class="dropbtn">Consolas 
                            <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="drop-content">
                            <a class="nav-link" href="/consola/ps5">
	                            <img src="/images/logos/consolas/ps/playstation_logo.png" class="nav_logo_consola">
	                            PlayStation 5
                            </a>
                            <a class="nav-link" href="/consola/switch">
	                            <img src="/images/logos/consolas/switch/switch_logo.png" class="nav_logo_consola">
	                            Nintendo Switch
                            </a>
                            <a class="nav-link" href="/consola/xbox">
	                            <img src="/images/logos/consolas/xbox/xbox_logo.png" class="nav_logo_consola">
	                            Xbox Series X/S
                            </a>
                          </div>
                    </div>
                    <div class=" drop-menu">
                        <button class="dropbtn">Accesorios 
                            <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="drop-content">
                            <a class="nav-link" href="/accesorio/ps5">
	                            <img src="/images/logos/consolas/ps/playstation_logo.png" class="nav_logo_consola">
	                            PlayStation 5
                            </a>
                            <a class="nav-link" href="/accesorio/switch">
	                            <img src="/images/logos/consolas/switch/switch_logo.png" class="nav_logo_consola">
	                            Nintendo Switch
                            </a>
                            <a class="nav-link" href="/accesorio/xbox">
	                            <img src="/images/logos/consolas/xbox/xbox_logo.png" class="nav_logo_consola">
	                            Xbox Series X/S
                            </a>
                          </div>
                    </div>   
                </ul>
                
                <div class="contenedor_login_registro">
                	<div>
	                	<a href="">
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
          </div>
        </div>
    </nav>


</body>
</html>