package com.jasgaming.pruebas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jasgaming.pruebas.model.service.VideojuegoEnConsolaService;
import com.jasgaming.pruebas.model.service.VideojuegoYGeneroService;

@Controller
public class HomeController {

	@Autowired
	private VideojuegoEnConsolaService vecService;
	
	@Autowired
	private VideojuegoYGeneroService vygService;
	
	
	@GetMapping("/registro")
	public String registro() {
		return "registroUsuario";
	}
	
	@PostMapping("/registro")
	public String procesarRegistro() {
		
		return "";
	}
	
	@GetMapping("/index")
	public String inicio(Model model) {
		model.addAttribute("novedadPs5", vecService.findNovedadPs5());
		model.addAttribute("novedadSwitch", vecService.findNovedadSwitch());
		model.addAttribute("novedadXbox", vecService.findNovedadXbox());
		return "index";
	}
	
	
	
}
