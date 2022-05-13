package com.jasgaming.pruebas.model.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.jasgaming.pruebas.model.entities.Consola;

public interface ConsolaRepository extends JpaRepository<Consola, String> {

}
