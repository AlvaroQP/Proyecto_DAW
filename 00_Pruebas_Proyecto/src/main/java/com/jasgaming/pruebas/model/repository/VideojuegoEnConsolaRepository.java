package com.jasgaming.pruebas.model.repository;
import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.jasgaming.pruebas.model.entities.VideojuegoEnConsola;

public interface VideojuegoEnConsolaRepository extends JpaRepository<VideojuegoEnConsola, Integer> {

	@Query("select v from VideojuegoEnConsola v where v.consola.idConsola = 'ps5'")
	public List<VideojuegoEnConsola> findVideojuegosPs5();
	
	@Query("select v from VideojuegoEnConsola v where v.consola.idConsola = 'ps5' and v.videojuego.novedad= 's'")
	public List<VideojuegoEnConsola> findNovedadPs5();
	
	@Query("select v from VideojuegoEnConsola v where v.consola.idConsola = 'switch'")
	public List<VideojuegoEnConsola> findVideojuegosSwitch();
	
	@Query("select v from VideojuegoEnConsola v where v.consola.idConsola = 'switch' and v.videojuego.novedad= 's'")
	public List<VideojuegoEnConsola> findNovedadSwitch();
	
	@Query("select v from VideojuegoEnConsola v where v.consola.idConsola = 'xbox_s_xs'")
	public List<VideojuegoEnConsola> findVideojuegosXbox();
	
	@Query("select v from VideojuegoEnConsola v where v.consola.idConsola = 'xbox_s_xs' and v.videojuego.novedad= 's'")
	public List<VideojuegoEnConsola> findNovedadXbox();
	
	@Query("select v from VideojuegoEnConsola v where v.precio <= ?1")
	public List<VideojuegoEnConsola> findPrecioMenorIgualA(BigDecimal precio);
	
	@Query("select v from VideojuegoEnConsola v where v.precio >= ?1")
	public List<VideojuegoEnConsola> findPrecioMayorIgualA(BigDecimal precio);
	
	@Query("select v from VideojuegoEnConsola v where v.videojuego.titulo like %?1%")
	public List<VideojuegoEnConsola> findVecPorCadena(String cadena);
	
	@Query("select v from VideojuegoEnConsola v where v.videojuego.novedad = 's'")
	public List<VideojuegoEnConsola> findNovedades();
}
