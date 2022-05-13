package com.jasgaming.pruebas.model.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasgaming.pruebas.model.entities.Consola;
import com.jasgaming.pruebas.model.repository.ConsolaRepository;

@Service
public class ConsolaServiceImpl implements ConsolaService {

	
	@Autowired
	private ConsolaRepository consolaRepository;

	@Override
	public Consola findById(String idConsola) {
		return consolaRepository.findById(idConsola).orElse(null);
	}

	@Override
	public List<Consola> findAll() {
		return consolaRepository.findAll();
	}
	
	
	
	
}
