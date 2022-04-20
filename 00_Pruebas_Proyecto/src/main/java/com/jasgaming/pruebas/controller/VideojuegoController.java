package com.jasgaming.pruebas.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jasgaming.pruebas.model.entities.Videojuego;
import com.jasgaming.pruebas.model.service.VideojuegoEnConsolaService;
import com.jasgaming.pruebas.model.service.VideojuegoService;
import com.jasgaming.pruebas.model.service.VideojuegoYGeneroService;

@Controller
@RequestMapping("/videojuego")
public class VideojuegoController {

	@Autowired
	private VideojuegoService videojuegoService;
	
	@Autowired
	private VideojuegoEnConsolaService vecService;
	
	@Autowired
	private VideojuegoYGeneroService vygService;
	
	@GetMapping("/todos")
	public String mostrarTodos(Model model) {
		model.addAttribute("listaVec", vecService.findAll());
		return "videojuegos";
	}
	
	@GetMapping("/ps5")
	public String mostrarVideojuegosPs5(Model model) {
		model.addAttribute("videojuegosPs5", vecService.findVideojuegosPs5());
		return "videojuegosPs5";
	}
	
	@GetMapping("/switch")
	public String mostrarVideojuegosSwitch(Model model) {
		model.addAttribute("videojuegosSwitch", vecService.findVideojuegosSwitch());
		return "videojuegosSwitch";
	}
	
	@GetMapping("/detalle/{idVec}")
	public String verDetalle(@PathVariable("idVec") int idVec, Model model) {
		int idVideojuego = vecService.findById(idVec).getVideojuego().getIdVideojuego();
		
		model.addAttribute("vec", vecService.findById(idVec));
		model.addAttribute("listaVyg", vygService.findGenerosIdVideojuego(idVideojuego));
		return "detalleVideojuego";
	}
	
	
	
	
}
