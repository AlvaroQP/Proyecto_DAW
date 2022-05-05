package com.jasgaming.pruebas.model.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.jasgaming.pruebas.model.entities.VideojuegoYGenero;

public interface VideojuegoYGeneroRepository extends JpaRepository<VideojuegoYGenero, Integer> {

	
	@Query("select v from VideojuegoYGenero v where v.videojuego.idVideojuego = ?1")
	public List<VideojuegoYGenero> findGenerosIdVideojuego(int idVideojuego);
	
}
