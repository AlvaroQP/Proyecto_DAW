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
                        <button class="dropbtn">Videojuegos 
                            <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="drop-content">
                            <a class="nav-link" href="#">PlayStation 5</a>
                            <a class="nav-link" href="/videojuego/switch">Nintendo Switch</a>
                            <a class="nav-link" href="/videojuego/xbox">Xbox Series X/S</a>
                          </div>
                    </div>
                    <div class=" drop-menu">
                        <button class="dropbtn">Consolas 
                            <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="drop-content">
                            <a class="nav-link" href="#">PlayStation 5</a>
                            <a class="nav-link" href="/consola/switch">Nintendo Switch</a>
                            <a class="nav-link" href="#">Xbox Series X/S</a>
                          </div>
                    </div>
                    <div class=" drop-menu">
                        <button class="dropbtn">Accesorios 
                            <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="drop-content">
                            <a class="nav-link" href="#">PlayStation 5</a>
                            <a class="nav-link" href="#">Nintendo Switch</a>
                            <a class="nav-link" href="#">Xbox Series X/S</a>
                          </div>
                    </div>   
                </ul>
                <form action="" method="POST">
                    <input class="form-control" type="text" name="cadena" placeholder="Buscar por título" required>
                    <input type="submit" value="Buscar" class="boton_buscar">
                </form>
          </div>
        </div>
    </nav>


</body>
</html>