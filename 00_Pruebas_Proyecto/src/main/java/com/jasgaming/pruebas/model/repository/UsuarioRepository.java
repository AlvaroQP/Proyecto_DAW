package com.jasgaming.pruebas.model.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.jasgaming.pruebas.model.entities.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, String> {

	@Query("select u from Usuario u where u.perfile.idPerfil = '1'")
	public List<Usuario> findUsuariosAdmin();
	
	@Query("select u from Usuario u where u.perfile.idPerfil = '2'")
	public List<Usuario> findUsuariosCliente();
	
}
