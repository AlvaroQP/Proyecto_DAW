package com.jasgaming.pruebas.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasgaming.pruebas.model.entities.ModelosConsola;
import com.jasgaming.pruebas.model.repository.ModelosConsolaRepository;

@Service
public class ModelosConsolaServiceImpl implements ModelosConsolaService {

	@Autowired
	private ModelosConsolaRepository mcRepository;

	@Override
	public List<ModelosConsola> findConsolasSwitch() {
		return mcRepository.findConsolasSwitch();
	}
	
}
