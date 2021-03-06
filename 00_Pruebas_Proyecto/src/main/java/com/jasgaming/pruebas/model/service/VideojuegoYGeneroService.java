package com.jasgaming.pruebas.model.service;
import java.util.List;

import com.jasgaming.pruebas.model.entities.VideojuegoYGenero;

public interface VideojuegoYGeneroService {

	List<VideojuegoYGenero> findAll();
	VideojuegoYGenero findById(int idVyg);
	List<VideojuegoYGenero> findGenerosIdVideojuego(int idVideojuego);
	int insertarVideojuegoYGenero(VideojuegoYGenero videojuegoYGenero);
	int editarVideojuegoYGenero(VideojuegoYGenero videojuegoYGenero);
	int eliminarVideojuegoYGenero(int idVyg);
	
}
