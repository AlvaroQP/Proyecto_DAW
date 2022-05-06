const formularioAlta = document.querySelector('.formulario_alta');
const botonSiguiente = document.querySelector('.boton_siguiente');
const botonSiguiente2 = document.querySelector('.boton_siguiente_2');
const imagenFormulario = document.querySelector('.imagen_formulario');
const contenedor1 = document.querySelector('.contenedor_derecha_1');
const contenedor2 = document.querySelector('.contenedor_derecha_2');
const contenedor3 = document.querySelector('.contenedor_derecha_3');
const inputs = document.getElementsByClassName('input_form');
const inputEmail = document.querySelector('.input_email');
const username = document.querySelector('#username');
const pass = document.querySelector('#password');
const nombre = document.querySelector('#nombre');
const apellidos = document.querySelector('#apellidos');
const email = document.querySelector('#email');
const direccion = document.querySelector('#direccion');
const comprobacionTexto = document.querySelector('.comprobacion_texto');
const submit = document.querySelector('.submit_form');
const reset = document.querySelector('.reset_form');
const bocadillo = document.querySelector('.bocadillo');
const radioAvatares = document.querySelectorAll('.contenedor_avatares input[type="radio"]');
const avatarElegido = document.querySelector('.avatar_elegido');
const ojo = document.querySelector('#icono_ojo');
const password = document.querySelector('#password');
let imagenUrl = '';
let imagenUsuario = '';

mostrarContenedor(1);

function mostrarContenedor(numeroContenedor) {
    if(numeroContenedor == 1) {
        imagenFormulario.setAttribute('src', '/images/form/mario.png');
        contenedor1.style.display = "grid";
        contenedor2.style.display = "none";
        contenedor3.style.display = "none";
    } else if(numeroContenedor == 2) {
        bocadillo.style.display = "none";
        imagenFormulario.setAttribute('src', '/images/form/link.png');
        contenedor1.style.display = "none";
        contenedor2.style.display = "grid";
    } else if(numeroContenedor == 3) {
        comprobarDatos();
        imagenFormulario.setAttribute('src', '/images/form/yoshi-waving.png');
        contenedor1.style.display = "none";
        contenedor2.style.display = "none";
        contenedor3.style.display = "grid";

       submit.addEventListener('click', function() {
            formularioAlta.removeEventListener('submit', prevenirEnvio);
       });
    }
}

function comprobarDatos() {
    let texto = 
        `<ul class="list-group list-group-flush">
            <li class="list-group-item">
                <strong>Username:</strong> ${username.value}
            </li>
            <li class="list-group-item">
                <strong>Password:</strong> ${pass.value}
            </li>
            <li class="list-group-item">
                <strong>Nombre:</strong> ${nombre.value} ${apellidos.value}
            </li>
            <li class="list-group-item">
                <strong>Email:</strong> ${email.value}
            </li>
            <li class="list-group-item">
                <strong>Dirección:</strong> ${direccion.value}
            </li>
        </ul>`;
    comprobacionTexto.innerHTML = texto;
}

function validarForm() {
    let valido = true;
 
    for(let i=0; i<inputs.length; i++) {
        if(inputs[i].value == '') {
            console.log(`${inputs[i].name} vacío`);
            inputs[i].className += ' noValido';
            bocadillo.style.display = "block";
            valido = false;
        } else {
            console.log(`${inputs[i].name}: ${inputs[i].value}`);
        } 
    }

    // Validación del email
    const validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    if(!inputEmail.value.match(validRegex)) {
        valido = false;
    } 

    return valido;
}


botonSiguiente.addEventListener('click', function() {
    validarForm() ? mostrarContenedor(2) : bocadillo.style.display = "block";
});

/* Al pasar a la última pantalla del formulario, mostramos el avatar que ha elegido el usuario */
botonSiguiente2.addEventListener('click', function() {
    radioAvatares.forEach(function(radio) {
        if(radio.checked) {
            avatarElegido.setAttribute('src', radio.getAttribute('value'));
        }
    });
    mostrarContenedor(3);
});

/* Si el usuario resetea el formulario, además de vaciar los campos, le devuelve a la primera pantalla del formulario */
reset.addEventListener('click', function() {
    mostrarContenedor(1);
});

/* Prevenimos el envío del formulario hasta que todos los datos estén bien */
formularioAlta.addEventListener('submit', prevenirEnvio);

function prevenirEnvio(event) {
    event.preventDefault();
}  



/* Icono ojo */
ojo.addEventListener('click', function() {
    // Si el atributo 'type' es password, lo cambiamos a texto (y a la inversa).
    let tipo = password.getAttribute('type');
    tipo === 'password' ? tipo = 'text' : tipo = 'password';
    password.setAttribute('type', tipo);
    // Cambiamos el icono del ojo
    ojo.classList.toggle('bi-eye');
});