package com.jasgaming.pruebas.model.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

	@Override
	public void subirImagen(Videojuego videojuego, MultipartFile imagen, 
					        String nombreCarpeta, int ordenInsercion) {
		
		if(!imagen.isEmpty()) {
			try {
				
				String ruta = new File("src//main//resources//static//images//videojuegos").getAbsolutePath() 
											 + "//" + nombreCarpeta + "//" + imagen.getOriginalFilename();
				FileOutputStream output = new FileOutputStream(ruta);
				output.write(imagen.getBytes());
				output.close();
				
				if(ordenInsercion == 1) {
					videojuego.setImagenCuadrada(nombreCarpeta + "/" + imagen.getOriginalFilename());		
				} else if(ordenInsercion == 2) {
					videojuego.setImagenRectangular(nombreCarpeta + "/" + imagen.getOriginalFilename());		
				} else if(ordenInsercion == 3) {
					videojuego.setImagen1(nombreCarpeta + "/" + imagen.getOriginalFilename());
				} else if(ordenInsercion == 4) {
					videojuego.setImagen2(nombreCarpeta + "/" + imagen.getOriginalFilename());
				} else if(ordenInsercion == 5) {
					videojuego.setImagen3(nombreCarpeta + "/" + imagen.getOriginalFilename());
				} else if(ordenInsercion == 6) {
					videojuego.setImagen4(nombreCarpeta + "/" + imagen.getOriginalFilename());
				} else if(ordenInsercion == 7) {
					videojuego.setImagen5(nombreCarpeta + "/" + imagen.getOriginalFilename());
				} 				
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}
