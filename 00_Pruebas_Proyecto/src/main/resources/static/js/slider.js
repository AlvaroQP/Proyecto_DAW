const anterior = document.querySelector('.anterior');
const siguiente = document.querySelector('.siguiente');
const slides = document.getElementsByClassName('slide');
const imagenesMini = document.getElementsByClassName('imagen_mini');
const contenedorImagenesMini = document.querySelector('.contenedor_imagenes_mini');

let indiceSlide = 1;
mostrarSlides(indiceSlide);

function mostrarSlides(indice) {
  /* Si sobrepasamos el total de slides, volvemos a la primera */
  indice > slides.length ? indiceSlide = 1 : indiceSlide = indiceSlide;

  /* Si el índice fuese menor a 0, volvemos a la última */
  indice < 1 ? indiceSlide = slides.length : indiceSlide = indiceSlide;

  /* Ocultamos las imágenes del slider */
  for(const slide of slides) {
    slide.style.display = "none";
  }
  /* Quitamos la clase "activa" de las imágenes_mini */
  for(const imagenMini of imagenesMini) {
    imagenMini.className = imagenMini.className.replace(" activa", "");
  }
  /* Mostramos la imagen del índice actual */
  slides[indiceSlide-1].style.display = "block";
  /* A la imagen mini actual le añadimos la clase "activa" para quitarle la opacidad */
  imagenesMini[indiceSlide-1].className += " activa";
} 


// EVENT LISTENERS
/* Dependiendo de la imagen_mini que cliquemos, el índice del slide a mostrar será uno u otro */
contenedorImagenesMini.addEventListener('click', function(event) {
    if(event.target.classList.contains('imagen_mini')) {
        const slide = event.target.getAttribute('data-tab');  // Tenemos el data-tab como atributo en HTML
        mostrarSlides(indiceSlide = slide);
    }
});

/* Si pulsamos el botón "anterior" o "siguiente" el índice del slide a mostrar bajará o subirá en 1 */
anterior.addEventListener('click', function() {
  mostrarSlides(indiceSlide -= 1);
});
siguiente.addEventListener('click', function() {
  mostrarSlides(indiceSlide += 1);
});

/* Si pulsamos flechas izquierda y derecha movemos las slides del carrusel */
document.addEventListener('keydown', function(event) {
  if(event.key === 'ArrowLeft') {
    mostrarSlides(indiceSlide -= 1);
  }
  if(event.key === 'ArrowRight') {
    mostrarSlides(indiceSlide += 1);
  }
});