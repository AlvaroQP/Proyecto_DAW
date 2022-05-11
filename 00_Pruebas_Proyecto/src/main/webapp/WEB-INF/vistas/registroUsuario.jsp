<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Únete a JAS Gaming!</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script defer src="/js/form.js"></script>
</head>
<body>

   <jsp:include page="nav.jsp"></jsp:include>

   <section class="seccion_formulario_alta">
        <div class="contenedor_formulario_alta">
            
            <form action="/registro" method="POST" class="formulario_alta">
                <div class="contenedor_arriba">
                    Formulario de alta
                    <div class="bocadillo">
                        ¡Revisa que todos los <br>
                        campos estén bien!
                    </div>
                    <div class="contenedor_imagen_2">
                        <img src="/images/form/toad-waving.png" alt="toad saludando" class="imagen_formulario_2">
                    </div>
                </div>
                <div class="formulario_izquierda">
                    <div class="contenedor_izquierda">
                        <img src="/images/form/mario.png" alt="imagen formulario" class="imagen_formulario">
                    </div>
                </div>

                <div class="formulario_derecha">
                    <div class="contenedor_derecha contenedor_derecha_1">
                        <div class="registro registro_1">
                            <label for="username">Username</label><br>
                            <input type="text" name="username" id="username" class="input_form" maxlength="10" required>
                        </div>
                        <div class="registro registro_2">
                            <label for="password">Password</label><br>
                            <input type="password" name="password" id="password" class="input_form" required>
                            <i class="bi bi-eye-slash" id="icono_ojo"></i> 
                        </div>
                        <div class="registro registro_3">
                            <label for="nombre">Nombre</label><br>
                            <input type="text" name="nombre" id="nombre" class="input_form" required>
                        </div>
                        <div class="registro registro_4">
                            <label for="nombre">Apellidos</label><br>
                            <input type="text" name="apellidos" id="apellidos" class="input_form" required>
                        </div>
                        <div class="registro registro_5">
                            <label for="email">Email</label><br>
                            <input type="email" name="email" id="email" class="input_form input_email" required> 
                        </div>
                        <div class="registro registro_6">
                            <label for="direccion">Dirección</label><br>
                            <input type="text" name="direccion" id="direccion" class="input_form" required> 
                        </div>
                        <div class="registro registro_7">
                            Género
                            <div class="contenedor_radio">
                                <input type="radio" id="mujer" name="genero" value="mujer" checked>
                                <label for="mujer">Mujer</label>
                                <input type="radio" id="hombre" name="genero" value="hombre">
                                <label for="hombre">Hombre</label>
                            </div>
                        </div>
                        <div class="registro registro_8">
                            Apuntarse al Newsletter
                            <div class="contenedor_radio">
                                <input type="radio" id="si" name="newsletter" value="si" checked>
                                <label for="si">Sí</label>
                                <input type="radio" id="no" name="newsletter" value="no">
                                <label for="no">No</label>
                            </div>
                        </div>

                        <button class="boton_siguiente">Siguiente
                            <span class="material-symbols-outlined flecha_derecha">east</span>
                        </button>
                    </div>

                    <div class="contenedor_derecha contenedor_derecha_2">
                        <div class="selecciona_imagen">Selecciona tu avatar</div>
                        <div class="contenedor_avatares">
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-mario.png" checked>
                                <img src="/images/avatares/avatar-mario.png" alt="avatar usuario" class="avatar_usuario">
                            </label>
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-yoshi.png">
                                <img src="/images/avatares/avatar-yoshi.png" alt="avatar usuario" class="avatar_usuario">
                            </label>
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-peach.png">
                                <img src="/images/avatares/avatar-peach.png" alt="avatar usuario" class="avatar_usuario">
                            </label>  
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-luigi.png">
                                <img src="/images/avatares/avatar-luigi.png" alt="avatar usuario" class="avatar_usuario">
                            </label>  
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-bowser.png">
                                <img src="/images/avatares/avatar-bowser.png" alt="avatar usuario" class="avatar_usuario">
                            </label>  
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-link.png">
                                <img src="/images/avatares/avatar-link.png" alt="avatar usuario" class="avatar_usuario">
                            </label>  
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-zelda.png">
                                <img src="/images/avatares/avatar-zelda.png" alt="avatar usuario" class="avatar_usuario">
                            </label>  
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-pikachu.png">
                                <img src="/images/avatares/avatar-pikachu.png" alt="avatar usuario" class="avatar_usuario">
                            </label>  
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-charizard.png">
                                <img src="/images/avatares/avatar-charizard.png" alt="avatar usuario" class="avatar_usuario">
                            </label>  
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-charmander.png">
                                <img src="/images/avatares/avatar-charmander.png" alt="avatar usuario" class="avatar_usuario">
                            </label>  
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-squirtle.png">
                                <img src="/images/avatares/avatar-squirtle.png" alt="avatar usuario" class="avatar_usuario">
                            </label>
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-sonic.png">
                                <img src="/images/avatares/avatar-sonic.png" alt="avatar usuario" class="avatar_usuario">
                            </label>
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-spyro.png">
                                <img src="/images/avatares/avatar-spyro.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-crash.png">
                                <img src="/images/avatares/avatar-crash.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-cloud.png">
                                <img src="/images/avatares/avatar-cloud.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-ryu.png">
                                <img src="/images/avatares/avatar-ryu.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-ken.png">
                                <img src="/images/avatares/avatar-ken.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-kratos.png">
                                <img src="/images/avatares/avatar-kratos.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-lara.png">
                                <img src="/images/avatares/avatar-lara.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-mg.png">
                                <img src="/images/avatares/avatar-mg.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-metroid.png">
                                <img src="/images/avatares/avatar-metroid.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-megaman.png">
                                <img src="/images/avatares/avatar-megaman.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-minecraft.png">
                                <img src="/images/avatares/avatar-minecraft.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-mk.png">
                                <img src="/images/avatares/avatar-mk.png" alt="avatar usuario" class="avatar_usuario">
                            </label>
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-mc.png">
                                <img src="/images/avatares/avatar-mc.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-ac.png">
                                <img src="/images/avatares/avatar-ac.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-borderlands.png">
                                <img src="/images/avatares/avatar-borderlands.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-fallout.png">
                                <img src="/images/avatares/avatar-fallout.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-chrom.png">
                                <img src="/images/avatares/avatar-chrom.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-lucina.png">
                                <img src="/images/avatares/avatar-lucina.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-ellie.png">
                                <img src="/images/avatares/avatar-ellie.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-joel.png">
                                <img src="/images/avatares/avatar-joel.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-goku.png">
                                <img src="/images/avatares/avatar-goku.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-gta.png">
                                <img src="/images/avatares/avatar-gta.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-kirby.png">
                                <img src="/images/avatares/avatar-kirby.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-jinx.png">
                                <img src="/images/avatares/avatar-jinx.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-got.png">
                                <img src="/images/avatares/avatar-got.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-na.png">
                                <img src="/images/avatares/avatar-na.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-overwatch.png">
                                <img src="/images/avatares/avatar-overwatch.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-dva.png">
                                <img src="/images/avatares/avatar-dva.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-rac.png">
                                <img src="/images/avatares/avatar-rac.png" alt="avatar usuario" class="avatar_usuario">
                            </label>
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-re.png">
                                <img src="/images/avatares/avatar-re.png" alt="avatar usuario" class="avatar_usuario">
                            </label>
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-rdr.png">
                                <img src="/images/avatares/avatar-rdr.png" alt="avatar usuario" class="avatar_usuario">
                            </label>
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-skyrim.png">
                                <img src="/images/avatares/avatar-skyrim.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-spiderman.png">
                                <img src="/images/avatares/avatar-spiderman.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-uncharted.png">
                                <img src="/images/avatares/avatar-uncharted.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-sw.png">
                                <img src="/images/avatares/avatar-sw.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                            <label>
                                <input type="radio" name="avatarUsuario" value="/images/avatares/avatar-witcher.png">
                                <img src="/images/avatares/avatar-witcher.png" alt="avatar usuario" class="avatar_usuario">
                            </label> 
                        </div>

                        <div> 
                            <button class="boton_siguiente_2">
                                Siguiente
                                <span class="material-symbols-outlined flecha_derecha">east</span>
                            </button>   
                        </div>  
                    </div>

                    <div class="contenedor_derecha contenedor_derecha_3">
                        <div class="texto_comprobar_datos">
                            <div>
                                Si la información es correcta, puedes finalizar el alta.
                            </div>
                        </div>
                        
                        <div class="contenedor_comprobar_datos">
                            <div>
                                <img src="" alt="avatar usuario" class="avatar_elegido">
                            </div>
                            <div class="comprobacion_texto"></div>
                        </div>
                        
                        <div class="contenedor_submit_reset">
                            <div>
                                <input type="submit" value="Finalizar Alta" class="submit_form">
                            </div>
                            <div>
                                <input type="reset" value="Resetear" class="reset_form">
                            </div>
                        </div>

                    </div>

                </div>
            </form>
        </div>
    </section>

	<jsp:include page="footer.jsp"></jsp:include>  
</body>
</html>