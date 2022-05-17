package com.jasgaming.pruebas.model.service;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.jasgaming.pruebas.model.entities.Accesorio;


public interface AccesorioService {

	List<Accesorio> findAll();
	Accesorio findById(int idAccesorio);
	List<Accesorio> findAccesoriosSwitch();
	List<Accesorio> findAccesoriosPs5();
	List<Accesorio> findAccesoriosXbox();
	void subirImagen(Accesorio accesorio, MultipartFile imagen, String nombreCarpeta, int ordenInsercion);
	int insertarAccesorio(Accesorio accesorio);
	int modificarAccesorio(Accesorio accesorio);
	int eliminarAccesorio(int idAccesorio);
	
	
}
