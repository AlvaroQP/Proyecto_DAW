package com.jasgaming.pruebas.model.service;
import java.util.List;

import com.jasgaming.pruebas.model.entities.Accesorio;

public interface AccesorioService {

	List<Accesorio> findAll();
	Accesorio findById(int idAccesorio);
	List<Accesorio> findAccesoriosSwitch();
	List<Accesorio> findAccesoriosPs5();
	List<Accesorio> findAccesoriosXbox();
	
}
