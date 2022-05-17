package com.jasgaming.pruebas.model.service;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

	@Override
	public void subirImagen(Accesorio accesorio, MultipartFile imagen, String nombreCarpeta, int ordenInsercion) {
		
		if(!imagen.isEmpty()) {
			try {
				
				String ruta = new File("src//main//resources//static//images//accesorios").getAbsolutePath() 
											 + "//" + nombreCarpeta + "//" + imagen.getOriginalFilename();
				FileOutputStream output = new FileOutputStream(ruta);
				output.write(imagen.getBytes());
				output.close();
				
				if(ordenInsercion == 1) {
					accesorio.setImagenCuadrada(nombreCarpeta + "/" + imagen.getOriginalFilename());		
				} else if(ordenInsercion == 2) {
					accesorio.setImagenRectangular(nombreCarpeta + "/" + imagen.getOriginalFilename());		
				} else if(ordenInsercion == 3) {
					accesorio.setImagen1(nombreCarpeta + "/" + imagen.getOriginalFilename());
				} else if(ordenInsercion == 4) {
					accesorio.setImagen2(nombreCarpeta + "/" + imagen.getOriginalFilename());
				} else if(ordenInsercion == 5) {
					accesorio.setImagen3(nombreCarpeta + "/" + imagen.getOriginalFilename());
				} 			
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public int insertarAccesorio(Accesorio accesorio) {
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
	public int modificarAccesorio(Accesorio accesorio) {
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
	public int eliminarAccesorio(int idAccesorio) {
		int filasEliminadas = 0;
		
		try {
			accesorioRepo.deleteById(idAccesorio);
			filasEliminadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasEliminadas;
	}

}
