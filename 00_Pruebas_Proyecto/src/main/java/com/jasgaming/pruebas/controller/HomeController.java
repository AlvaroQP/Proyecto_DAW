package com.jasgaming.pruebas.controller;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jasgaming.pruebas.model.entities.Perfile;
import com.jasgaming.pruebas.model.entities.Usuario;
import com.jasgaming.pruebas.model.service.UsuarioService;
import com.jasgaming.pruebas.model.service.VideojuegoEnConsolaService;


@Controller
public class HomeController {

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private VideojuegoEnConsolaService vecService;
		
	@Autowired
	private UsuarioService usuarioService;
	

	@GetMapping("/")
	public String inicio(Authentication auth, HttpSession session, Model model) {
		
		if(auth != null) {
			session.setAttribute("usuario", usuarioService.findById(auth.getName()));
			model.addAttribute("perfiles", auth.getAuthorities());
		}
		
		model.addAttribute("novedadPs5", vecService.findNovedadPs5());
		model.addAttribute("novedadSwitch", vecService.findNovedadSwitch());
		model.addAttribute("novedadXbox", vecService.findNovedadXbox());
		
		return "index";
	}
	
	@GetMapping("/registro")
	public String registro() {
		return "registroUsuario";
	}
	
	@PostMapping("/registro")
	public String procesarRegistro(Usuario usuario, RedirectAttributes attr) {
		usuario.setEnabled(1);
		usuario.setFechaRegistro(new Date());
		usuario.setPerfile(new Perfile(2, "cliente"));
		usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
		
		// Comprobamos si el username ya está seleccionado por otro usuario
		for(Usuario usu : usuarioService.findAll()) {
			if(usu.getUsername().equalsIgnoreCase(usuario.getUsername())) {
				attr.addFlashAttribute("mensaje", "Username en uso. Por favor, selecciona otro.");
				return "redirect:/";
			}
		}
		
		if(usuarioService.insertarUsuario(usuario) == 1) {
			attr.addFlashAttribute("mensaje", "Usuario dado de alta");
		} else {
			attr.addFlashAttribute("mensaje", "Usuario no dado de alta");
		}		
		return "redirect:/";
	}
	
	
	@GetMapping("/perfil")
	public String verPerfil() {
		return "perfil";
	}
		
	// Método para generar contraseñas encriptadas de prueba
	@GetMapping("/pwd")
	@ResponseBody
	public String encriptar() {
		String encriptado = passwordEncoder.encode("carlos123");
		System.out.println(encriptado);
		return encriptado;
	}
	

	
}
