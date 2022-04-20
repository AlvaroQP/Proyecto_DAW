package com.jasgaming.pruebas.model.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasgaming.pruebas.model.entities.VideojuegoYGenero;
import com.jasgaming.pruebas.model.repository.VideojuegoYGeneroRepository;

@Service
public class VideojuegoYGeneroServiceImpl implements VideojuegoYGeneroService {

	@Autowired
	private VideojuegoYGeneroRepository vygRepo;
	
	@Override
	public List<VideojuegoYGenero> findAll() {
		return vygRepo.findAll();
	}

	@Override
	public VideojuegoYGenero findById(int idVyg) {
		return vygRepo.findById(idVyg).orElse(null);
	}
	
	@Override
	public List<VideojuegoYGenero> findGenerosIdVideojuego(int idVideojuego) {
		return vygRepo.findGenerosIdVideojuego(idVideojuego);
	}

}
