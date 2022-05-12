package com.jasgaming.pruebas.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jasgaming.pruebas.model.repository.ModelosConsolaRepository;
import com.jasgaming.pruebas.model.service.AccesorioService;
import com.jasgaming.pruebas.model.service.UsuarioService;
import com.jasgaming.pruebas.model.service.VideojuegoEnConsolaService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private VideojuegoEnConsolaService vecService;
	
	@Autowired
	private ModelosConsolaRepository mcService;
	
	@Autowired
	private AccesorioService accService;
	
	@Autowired
	private UsuarioService usuService;
	
	@GetMapping("/videojuego")
	public String mostrarVideojuegos(Model model) {
		model.addAttribute("videojuegosPs5", vecService.findVideojuegosPs5());
		model.addAttribute("videojuegosSwitch", vecService.findVideojuegosSwitch());
		model.addAttribute("videojuegosXbox", vecService.findVideojuegosXbox());
		
		return "adminVideojuegos";
	}
	
	@GetMapping("/consola")
	public String mostrarConsolas(Model model) {
		model.addAttribute("consolasPs5", mcService.findConsolasPs5());
		model.addAttribute("consolasSwitch", mcService.findConsolasSwitch());
		model.addAttribute("consolasXbox", mcService.findConsolasXbox());
		
		return "adminConsolas";
	}
	
	@GetMapping("/accesorio")
	public String mostrarAccesorios(Model model) {
		model.addAttribute("accesoriosPs5", accService.findAccesoriosPs5());
		model.addAttribute("accesoriosSwitch", accService.findAccesoriosSwitch());
		model.addAttribute("accesoriosXbox", accService.findAccesoriosXbox());
		
		return "adminAccesorios";
	}
	
	@GetMapping("/cliente")
	public String mostrarUsuarios(Model model) {
		model.addAttribute("usuariosAdmin", usuService.findUsuariosAdmin());
		model.addAttribute("usuariosCliente", usuService.findUsuariosCliente());
		
		return "adminUsuarios";
	}
	
	
	
	
}
