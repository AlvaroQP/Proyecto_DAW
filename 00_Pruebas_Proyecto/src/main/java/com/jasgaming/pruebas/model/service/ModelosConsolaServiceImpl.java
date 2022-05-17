package com.jasgaming.pruebas.model.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jasgaming.pruebas.model.entities.ModelosConsola;
import com.jasgaming.pruebas.model.repository.ModelosConsolaRepository;

@Service
public class ModelosConsolaServiceImpl implements ModelosConsolaService {

	@Autowired
	private ModelosConsolaRepository mcRepository;

	@Override
	public ModelosConsola findById(String idModeloConsola) {
		return mcRepository.findById(idModeloConsola).orElse(null);
	}
	
	@Override
	public List<ModelosConsola> findConsolasSwitch() {
		return mcRepository.findConsolasSwitch();
	}

	@Override
	public List<ModelosConsola> findConsolasPs5() {
		return mcRepository.findConsolasPs5();
	}

	@Override
	public List<ModelosConsola> findConsolasXbox() {
		return mcRepository.findConsolasXbox();
	}

	@Override
	public void subirImagen(ModelosConsola modelosConsola, MultipartFile imagen, 
							String nombreCarpeta, int ordenInsercion) {
		
		if(!imagen.isEmpty()) {
			try {
				String ruta = new File("src//main//resources//static//images//consolas").getAbsolutePath() 
											 + "//" + nombreCarpeta + "//" + imagen.getOriginalFilename();
				FileOutputStream output = new FileOutputStream(ruta);
				output.write(imagen.getBytes());
				output.close();
				
				if(ordenInsercion == 1) {
					modelosConsola.setImagenCuadrada(nombreCarpeta + "/" + imagen.getOriginalFilename());		
				} else if(ordenInsercion == 2) {
					modelosConsola.setImagenRectangular(nombreCarpeta + "/" + imagen.getOriginalFilename());		
				} else if(ordenInsercion == 3) {
					modelosConsola.setImagen1(nombreCarpeta + "/" + imagen.getOriginalFilename());
				} else if(ordenInsercion == 4) {
					modelosConsola.setImagen2(nombreCarpeta + "/" + imagen.getOriginalFilename());
				} else if(ordenInsercion == 5) {
					modelosConsola.setImagen3(nombreCarpeta + "/" + imagen.getOriginalFilename());
				}				
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public int insertarModeloConsola(ModelosConsola modelosConsola) {
		int filasInsertadas = 0;
		
		try {
			mcRepository.save(modelosConsola);
			filasInsertadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasInsertadas;
	}

	@Override
	public int modificarModeloConsola(ModelosConsola modelosConsola) {
		int filasModificadas = 0;
		
		try {
			mcRepository.save(modelosConsola);
			filasModificadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasModificadas;
	}

	@Override
	public int eliminarModeloConsola(String idModeloConsola) {
		int filasEliminadas = 0;
		
		try {
			mcRepository.deleteById(idModeloConsola);
			filasEliminadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasEliminadas;
	}

}
