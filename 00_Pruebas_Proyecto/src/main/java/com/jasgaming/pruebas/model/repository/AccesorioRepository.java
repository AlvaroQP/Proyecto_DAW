package com.jasgaming.pruebas.model.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.jasgaming.pruebas.model.entities.Accesorio;

public interface AccesorioRepository extends JpaRepository<Accesorio, Integer> {

	@Query("select a from Accesorio a where a.consola.idConsola = 'switch'")
	public List<Accesorio> findAccesoriosSwitch();
	
	@Query("select a from Accesorio a where a.consola.idConsola = 'ps5'")
	public List<Accesorio> findAccesoriosPs5();
	
	@Query("select a from Accesorio a where a.consola.idConsola = 'xbox_s_xs'")
	public List<Accesorio> findAccesoriosXbox();
	
	
}
