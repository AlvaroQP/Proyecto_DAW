package com.jasgaming.pruebas.model.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.jasgaming.pruebas.model.entities.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, String> {

}
