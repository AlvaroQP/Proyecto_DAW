package com.jasgaming.pruebas.model.service;

import com.jasgaming.pruebas.model.entities.Accesorio;
import com.jasgaming.pruebas.model.entities.Consola;
import com.jasgaming.pruebas.model.entities.Videojuego;

public interface CarritoService {
	int altaVideojuegoCarrito(Videojuego videojuego);
	int altaAccesorioCarrito(Accesorio accesorio);
	int altaConsolaCarrito(Consola consola);
	int modificarVideojuegoCarrito(Videojuego videojuego);
	int modificarAccesorioCarrito(Accesorio accesorio); 
	int modificarConsolaCarrito(Consola consola);
	int borrarVideojuegoCarrito(int idVideojuego);
	int borrarAccesorioCarrito(int idAccesorio);
	int borrarConsolaCarrito(String idConsola);

}
