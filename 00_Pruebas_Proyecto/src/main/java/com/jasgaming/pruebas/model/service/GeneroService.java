package com.jasgaming.pruebas.model.service;
import java.util.List;

import com.jasgaming.pruebas.model.entities.Genero;

public interface GeneroService {

	List<Genero> findAll();
	Genero findById(int idGenero);
	
}
