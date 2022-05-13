package com.jasgaming.pruebas.model.service;
import java.util.List;

import com.jasgaming.pruebas.model.entities.Consola;

public interface ConsolaService {

	Consola findById(String idConsola);
	List<Consola> findAll();
}
