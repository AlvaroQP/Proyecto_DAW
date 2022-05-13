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

	@Override
	public int insertarVideojuegoYGenero(VideojuegoYGenero videojuegoYGenero) {
		int filasInsertadas = 0;
		
		try {
			vygRepo.save(videojuegoYGenero);
			filasInsertadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasInsertadas;
	}

	@Override
	public int editarVideojuegoYGenero(VideojuegoYGenero videojuegoYGenero) {
		int filasModificadas = 0;
		
		try {
			vygRepo.save(videojuegoYGenero);
			filasModificadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasModificadas;
	}

	@Override
	public int eliminarVideojuegoYGenero(int idVyg) {
		int filasEliminadas = 0;
		
		try {
			vygRepo.deleteById(idVyg);
			filasEliminadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasEliminadas;
	}

}
