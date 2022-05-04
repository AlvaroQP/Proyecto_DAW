package com.jasgaming.pruebas.model.service;
import java.util.List;

import com.jasgaming.pruebas.model.entities.ModelosConsola;

public interface ModelosConsolaService {

	ModelosConsola findById(String idModeloConsola);
	List<ModelosConsola> findConsolasSwitch();
	List<ModelosConsola> findConsolasPs5();
	List<ModelosConsola> findConsolasXbox();
	
}
