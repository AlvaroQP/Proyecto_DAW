package com.jasgaming.pruebas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jasgaming.pruebas.model.service.ModelosConsolaService;

@Controller
@RequestMapping("/consola")
public class ConsolaController {

	@Autowired
	private ModelosConsolaService mcService;
	
	@GetMapping("/switch")
	public String mostrarConsolasSwitch(Model model) {
		model.addAttribute("consolasSwitch", mcService.findConsolasSwitch());
		return "consolasSwitch";
	}
	
}
