package com.jasgaming.pruebas.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jasgaming.pruebas.model.service.AccesorioService;

@Controller
@RequestMapping("/accesorio")
public class AccesorioController {

	@Autowired
	private AccesorioService accesorioService;
	
	@GetMapping("/ps5")
	public String mostrarAccesoriosPs5(Model model) {
		model.addAttribute("accesoriosPs5", accesorioService.findAccesoriosPs5());
		return "accesoriosPs5";
	}
	
	@GetMapping("/switch")
	public String mostrarAccesoriosSwitch(Model model) {
		model.addAttribute("accesoriosSwitch", accesorioService.findAccesoriosSwitch());
		return "accesoriosSwitch";
	}
	
	@GetMapping("/xbox")
	public String mostrarAccesoriosXbox(Model model) {
		model.addAttribute("accesoriosXbox", accesorioService.findAccesoriosXbox());
		return "accesoriosXbox";
	}
	
	@GetMapping("/detalle/{idAccesorio}")
	public String detalleAccesorio(@PathVariable("idAccesorio") int idAccesorio, Model model) {
		model.addAttribute("accesorio", accesorioService.findById(idAccesorio));
		return "detalleAccesorio";
	}
	
}
