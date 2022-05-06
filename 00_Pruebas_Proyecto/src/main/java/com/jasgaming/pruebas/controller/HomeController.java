package com.jasgaming.pruebas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {

	
	
	@GetMapping("/registro")
	public String registro() {
		return "registroUsuario";
	}
	
	@PostMapping("/registro")
	public String procesarRegistro() {
		
		return "";
	}
	
}
