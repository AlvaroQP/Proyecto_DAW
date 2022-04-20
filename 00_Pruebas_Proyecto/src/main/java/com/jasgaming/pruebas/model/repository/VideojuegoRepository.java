package com.jasgaming.pruebas.model.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.jasgaming.pruebas.model.entities.Videojuego;

public interface VideojuegoRepository extends JpaRepository<Videojuego, Integer> {

	
}
