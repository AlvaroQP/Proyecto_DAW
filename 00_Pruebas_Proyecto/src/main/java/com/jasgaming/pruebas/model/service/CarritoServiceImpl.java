package com.jasgaming.pruebas.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasgaming.pruebas.model.entities.Accesorio;
import com.jasgaming.pruebas.model.entities.Consola;
import com.jasgaming.pruebas.model.entities.Videojuego;
import com.jasgaming.pruebas.model.repository.AccesorioRepository;
import com.jasgaming.pruebas.model.repository.ConsolaRepository;
import com.jasgaming.pruebas.model.repository.VideojuegoRepository;

@Service
public class CarritoServiceImpl implements CarritoService{

	@Autowired
	private AccesorioRepository accesorioRepo;

	@Autowired
	private ConsolaRepository consolaRepo;

	@Autowired
	private VideojuegoRepository videojuegoRepo;
	
	@Override
	public int altaVideojuegoCarrito(Videojuego videojuego) {
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
	public int altaAccesorioCarrito(Accesorio accesorio) {
		int filasInsertadas = 0;
		
		try {
			accesorioRepo.save(accesorio);
			filasInsertadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasInsertadas;
	}

	@Override
	public int altaConsolaCarrito(Consola consola) {
		int filasInsertadas = 0;
		
		try {
			consolaRepo.save(consola);
			filasInsertadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasInsertadas;
	}

	@Override
	public int modificarVideojuegoCarrito(Videojuego videojuego) {
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
	public int modificarAccesorioCarrito(Accesorio accesorio) {
		int filasModificadas = 0;
		
		try {
			accesorioRepo.save(accesorio);
			filasModificadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasModificadas;
	}

	@Override
	public int modificarConsolaCarrito(Consola consola) {
		int filasModificadas = 0;
		
		try {
			consolaRepo.save(consola);
			filasModificadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasModificadas;
	}

	@Override
	public int borrarVideojuegoCarrito(int idVideojuego) {
		int filasEliminadas = 0;
		
		try {
			videojuegoRepo.deleteById(idVideojuego);
			filasEliminadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasEliminadas;
	}

	@Override
	public int borrarAccesorioCarrito(int idAccesorio) {
		int filasEliminadas = 0;
		
		try {
			accesorioRepo.deleteById(idAccesorio);
			filasEliminadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasEliminadas;
	}

	@Override
	public int borrarConsolaCarrito(String idConsola) {
		int filasEliminadas = 0;
		
		try {
			consolaRepo.deleteById(idConsola);
			filasEliminadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasEliminadas;
	}
	
	
}
