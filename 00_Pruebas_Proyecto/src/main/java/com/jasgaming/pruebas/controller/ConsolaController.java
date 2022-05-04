package com.jasgaming.pruebas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@GetMapping("/ps5")
	public String mostrarConsolasPs5(Model model) {
		model.addAttribute("consolasPs5", mcService.findConsolasPs5());
		return "consolasPs5";
	}
	
	@GetMapping("/xbox")
	public String mostrarConsolasXbox(Model model) {
		model.addAttribute("consolasXbox", mcService.findConsolasXbox());
		return "consolasXbox";
	}
	
	@GetMapping("/detalle/{idModeloConsola}")
	public String detalleConsola(@PathVariable("idModeloConsola") String idModeloConsola, Model model) {
		model.addAttribute("modeloConsola", mcService.findById(idModeloConsola));
		return "detalleConsola";
	}
	
}
