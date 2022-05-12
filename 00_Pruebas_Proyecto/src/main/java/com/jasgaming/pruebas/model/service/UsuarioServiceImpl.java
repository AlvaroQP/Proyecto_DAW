package com.jasgaming.pruebas.model.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasgaming.pruebas.model.entities.Usuario;
import com.jasgaming.pruebas.model.repository.UsuarioRepository;

@Service
public class UsuarioServiceImpl implements UsuarioService {

	
	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@Override
	public List<Usuario> findAll() {
		return usuarioRepository.findAll();
	}

	@Override
	public Usuario findById(String username) {
		return usuarioRepository.findById(username).orElse(null);
	}

	@Override
	public int insertarUsuario(Usuario usuario) {
		int filasInsertadas = 0;
		
		try {
			usuarioRepository.save(usuario);
			filasInsertadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasInsertadas;
	}

	@Override
	public int editarUsuario(Usuario usuario) {
		int filasModificadas = 0;
		
		try {
			usuarioRepository.save(usuario);
			filasModificadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasModificadas;
	}

	@Override
	public int eliminarUsuario(String username) {
		int filasEliminadas = 0;
		
		try {
			usuarioRepository.deleteById(username);
			filasEliminadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasEliminadas;
	}

	@Override
	public List<Usuario> findUsuariosAdmin() {
		return usuarioRepository.findUsuariosAdmin();
	}

	@Override
	public List<Usuario> findUsuariosCliente() {
		return usuarioRepository.findUsuariosCliente();
	}

}
