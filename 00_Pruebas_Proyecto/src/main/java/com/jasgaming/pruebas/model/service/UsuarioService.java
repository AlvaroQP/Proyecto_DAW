package com.jasgaming.pruebas.model.service;
import java.util.List;

import com.jasgaming.pruebas.model.entities.Usuario;

public interface UsuarioService {

	List<Usuario> findAll();
	Usuario findById(String username);
	int insertarUsuario(Usuario usuario);
	int editarUsuario(Usuario usuario);
	int eliminarUsuario(String username);
	
}
