package com.jasgaming.pruebas.model.service;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jasgaming.pruebas.model.entities.VideojuegoEnConsola;
import com.jasgaming.pruebas.model.repository.VideojuegoEnConsolaRepository;

@Service
public class VideojuegoEnConsolaServiceImpl implements VideojuegoEnConsolaService {

	@Autowired
	private VideojuegoEnConsolaRepository vecRepository;
	
	@Override
	public List<VideojuegoEnConsola> findAll() {
		return vecRepository.findAll();
	}

	@Override
	public VideojuegoEnConsola findById(int idVec) {
		return vecRepository.findById(idVec).orElse(null);
	}

	@Override
	public List<VideojuegoEnConsola> findVideojuegosPs5() {
		return vecRepository.findVideojuegosPs5();
	}

	@Override
	public List<VideojuegoEnConsola> findVideojuegosSwitch() {
		return vecRepository.findVideojuegosSwitch();
	}

	@Override
	public List<VideojuegoEnConsola> findVideojuegosXbox() {
		return vecRepository.findVideojuegosXbox();
	}

	@Override
	public int insertarVec(VideojuegoEnConsola videojuegoEnConsola) {
		int filasInsertadas = 0;
		
		try {
			vecRepository.save(videojuegoEnConsola);
			filasInsertadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasInsertadas;		
	}

	@Override
	public int editarVec(VideojuegoEnConsola videojuegoEnConsola) {
		int filasModificadas = 0;
		
		try {
			vecRepository.save(videojuegoEnConsola);
			filasModificadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasModificadas;
	}

	@Override
	public int eliminarVec(int idVec) {
		int filasEliminadas = 0;
		
		try {
			vecRepository.deleteById(idVec);
			filasEliminadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasEliminadas;
	}

	@Override
	public List<VideojuegoEnConsola> findPrecioMenorIgualA(BigDecimal precio) {
		return vecRepository.findPrecioMenorIgualA(precio);
	}

	@Override
	public List<VideojuegoEnConsola> findPrecioMayorIgualA(BigDecimal precio) {
		return vecRepository.findPrecioMayorIgualA(precio);
	}

	@Override
	public List<VideojuegoEnConsola> findVecPorCadena(String cadena) {
		return vecRepository.findVecPorCadena(cadena);
	}

	@Override
	public List<VideojuegoEnConsola> findNovedades() {
		return vecRepository.findNovedades();
	}

	@Override
	public List<VideojuegoEnConsola> findNovedadPs5() {
		return vecRepository.findNovedadPs5();
	}

	@Override
	public List<VideojuegoEnConsola> findNovedadSwitch() {
		return vecRepository.findNovedadSwitch();
	}

	@Override
	public List<VideojuegoEnConsola> findNovedadXbox() {
		return vecRepository.findNovedadXbox();
	}

	@Override
	public void subirImagenCaja(VideojuegoEnConsola videojuegoEnConsola, MultipartFile imagenCaja, String nombreCarpeta) {
		
		if(!imagenCaja.isEmpty()) {
			try {
				videojuegoEnConsola.setImagenCaja(nombreCarpeta + "/" + imagenCaja.getOriginalFilename());
				String fileLocation = new File("src//main//resources//static//images//videojuegos").getAbsolutePath() + "//" + nombreCarpeta + "//" + imagenCaja.getOriginalFilename();
				FileOutputStream output = new FileOutputStream(fileLocation);
				output.write(imagenCaja.getBytes());
				output.close();	
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
}
