package com.jasgaming.pruebas.model.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasgaming.pruebas.model.entities.Accesorio;
import com.jasgaming.pruebas.model.repository.AccesorioRepository;

@Service
public class AccesorioServiceImpl implements AccesorioService {

	@Autowired
	private AccesorioRepository accesorioRepo;
	
	@Override
	public List<Accesorio> findAll() {
		return accesorioRepo.findAll();
	}

	@Override
	public Accesorio findById(int idAccesorio) {
		return accesorioRepo.findById(idAccesorio).orElse(null);
	}

	@Override
	public List<Accesorio> findAccesoriosSwitch() {
		return accesorioRepo.findAccesoriosSwitch();
	}

	@Override
	public List<Accesorio> findAccesoriosPs5() {
		return accesorioRepo.findAccesoriosPs5();
	}

	@Override
	public List<Accesorio> findAccesoriosXbox() {
		return accesorioRepo.findAccesoriosXbox();
	}

}
