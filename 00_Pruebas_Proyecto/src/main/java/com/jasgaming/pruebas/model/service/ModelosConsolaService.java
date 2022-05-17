package com.jasgaming.pruebas.model.service;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.jasgaming.pruebas.model.entities.ModelosConsola;

public interface ModelosConsolaService {

	ModelosConsola findById(String idModeloConsola);
	List<ModelosConsola> findConsolasSwitch();
	List<ModelosConsola> findConsolasPs5();
	List<ModelosConsola> findConsolasXbox();
	void subirImagen(ModelosConsola modelosConsola, MultipartFile imagen, String nombreCarpeta, int ordenInsercion);
	int insertarModeloConsola(ModelosConsola modelosConsola);
	int modificarModeloConsola(ModelosConsola modelosConsola);
	int eliminarModeloConsola(String idModeloConsola);
	
}
