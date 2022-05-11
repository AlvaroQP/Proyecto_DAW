package com.jasgaming.pruebas.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jasgaming.pruebas.model.service.VideojuegoEnConsolaService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private VideojuegoEnConsolaService vecService;
	
	@GetMapping("/videojuego")
	public String mostrarVideojuegos(Model model) {
		model.addAttribute("videojuegosPs5", vecService.findVideojuegosPs5());
		model.addAttribute("videojuegosSwitch", vecService.findVideojuegosSwitch());
		model.addAttribute("videojuegosXbox", vecService.findVideojuegosXbox());
		
		return "adminVideojuegos";
	}
	
	
	
}
