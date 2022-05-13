package com.jasgaming.pruebas.model.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasgaming.pruebas.model.entities.Genero;
import com.jasgaming.pruebas.model.repository.GeneroRepository;

@Service
public class GeneroServiceImpl implements GeneroService {

	@Autowired
	private GeneroRepository generoRepository;
	
	@Override
	public List<Genero> findAll() {
		return generoRepository.findAll();
	}

	@Override
	public Genero findById(int idGenero) {
		return generoRepository.findById(idGenero).orElse(null);
	}

}
