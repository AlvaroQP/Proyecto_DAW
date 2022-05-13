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

	@Override
	public int insertarVideojuego(Videojuego videojuego) {
		int filasInsertadas = 0;
		
		try {
			videojuegoRepo.save(videojuego);
			filasInsertadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasInsertadas;
	}

	@Override
	public int editarVideojuego(Videojuego videojuego) {
		int filasModificadas = 0;
		
		try {
			videojuegoRepo.save(videojuego);
			filasModificadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasModificadas;
	}

	@Override
	public int eliminarVideojuego(int idVideojuego) {
		int filasEliminadas = 0;
		
		try {
			videojuegoRepo.deleteById(idVideojuego);
			filasEliminadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasEliminadas;
	}

}
