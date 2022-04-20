package com.jasgaming.pruebas.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasgaming.pruebas.model.entities.Videojuego;
import com.jasgaming.pruebas.model.repository.VideojuegoRepository;

@Service
public class VideojuegoServiceImpl implements VideojuegoService {

	@Autowired
	private VideojuegoRepository videojuegoRepo;
	
	@Override
	public List<Videojuego> findAll() {
		return videojuegoRepo.findAll();
	}

	@Override
	public Videojuego findById(int idVideojuego) {
		return videojuegoRepo.findById(idVideojuego).orElse(null);
	}

}
