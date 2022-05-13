package com.jasgaming.pruebas.model.service;
import java.util.List;

import com.jasgaming.pruebas.model.entities.Videojuego;

public interface VideojuegoService {

	List<Videojuego> findAll();
	Videojuego findById(int idVideojuego);
	int insertarVideojuego(Videojuego videojuego);
	int editarVideojuego(Videojuego videojuego);
	int eliminarVideojuego(int idVideojuego);
	
}
