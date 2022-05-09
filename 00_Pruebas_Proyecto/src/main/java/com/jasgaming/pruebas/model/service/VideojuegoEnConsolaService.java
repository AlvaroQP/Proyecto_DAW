package com.jasgaming.pruebas.model.service;

import java.math.BigDecimal;
import java.util.List;

import com.jasgaming.pruebas.model.entities.VideojuegoEnConsola;

public interface VideojuegoEnConsolaService {

	List<VideojuegoEnConsola> findAll();
	VideojuegoEnConsola findById(int idVec);
	List<VideojuegoEnConsola> findVideojuegosPs5();
	List<VideojuegoEnConsola> findNovedadPs5();
	List<VideojuegoEnConsola> findVideojuegosSwitch();
	List<VideojuegoEnConsola> findNovedadSwitch();
	List<VideojuegoEnConsola> findVideojuegosXbox();
	List<VideojuegoEnConsola> findNovedadXbox();
	List<VideojuegoEnConsola> findPrecioMenorIgualA(BigDecimal precio);
	List<VideojuegoEnConsola> findPrecioMayorIgualA(BigDecimal precio);
	List<VideojuegoEnConsola> findVecPorCadena(String cadena);
	List<VideojuegoEnConsola> findNovedades();
	int insertarVec(VideojuegoEnConsola videojuegoEnConsola);
	int editarVec(VideojuegoEnConsola videojuegoEnConsola);
	int eliminarVec(int idVec);
}
