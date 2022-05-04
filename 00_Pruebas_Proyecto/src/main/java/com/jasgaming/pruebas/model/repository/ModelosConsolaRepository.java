package com.jasgaming.pruebas.model.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.jasgaming.pruebas.model.entities.ModelosConsola;

public interface ModelosConsolaRepository extends JpaRepository<ModelosConsola, String> {

	@Query("select m from ModelosConsola m where m.consola.idConsola = 'switch'")
	public List<ModelosConsola> findConsolasSwitch();
	
	@Query("select m from ModelosConsola m where m.consola.idConsola = 'ps5'")
	public List<ModelosConsola> findConsolasPs5();
	
	@Query("select m from ModelosConsola m where m.consola.idConsola = 'xbox_s_xs'")
	public List<ModelosConsola> findConsolasXbox();
	
}
