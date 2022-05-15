package com.jasgaming.pruebas.controller;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jasgaming.pruebas.model.entities.Videojuego;
import com.jasgaming.pruebas.model.entities.VideojuegoEnConsola;
import com.jasgaming.pruebas.model.entities.VideojuegoYGenero;
import com.jasgaming.pruebas.model.repository.ModelosConsolaRepository;
import com.jasgaming.pruebas.model.service.AccesorioService;
import com.jasgaming.pruebas.model.service.ConsolaService;
import com.jasgaming.pruebas.model.service.GeneroService;
import com.jasgaming.pruebas.model.service.UsuarioService;
import com.jasgaming.pruebas.model.service.VideojuegoEnConsolaService;
import com.jasgaming.pruebas.model.service.VideojuegoService;
import com.jasgaming.pruebas.model.service.VideojuegoYGeneroService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private VideojuegoService vidService;
	
	@Autowired
	private VideojuegoYGeneroService vygService;
	
	@Autowired
	private VideojuegoEnConsolaService vecService;
	
	@Autowired
	private ModelosConsolaRepository mcService;
	
	@Autowired
	private AccesorioService accService;
	
	@Autowired
	private UsuarioService usuService;
	
	@Autowired
	private GeneroService genService;
	
	@Autowired
	private ConsolaService conService;
	
	@InitBinder
	public void initBinder(WebDataBinder webdatabinder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		webdatabinder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, false));
	}

	
	
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
	
	@GetMapping("/altaVideojuego")
	public String altaVideojuegoSwitch(Model model) {
		model.addAttribute("listadoGeneros", genService.findAll());
		return "formAltaVideojuego";
	}
	
	@PostMapping("/altaVideojuego")
	public String procesarAltaVideojuegoSwitch(Videojuego videojuego, RedirectAttributes attr,
																	  @RequestParam("consolaSwitch") String consolaSwitch,
																	  @RequestParam("imagenCaja") String imagenCaja,
																	  @RequestParam("precio") BigDecimal precio,
																	  @RequestParam("genero") int[] generoArray) {
		
		if(videojuego.getClasificacionEdad().equals("PEGI 3")) {
			videojuego.setImagenPegi("pegi-3.png");
		} else if(videojuego.getClasificacionEdad().equals("PEGI 7")) {
			videojuego.setImagenPegi("pegi-7.png");
		} else if(videojuego.getClasificacionEdad().equals("PEGI 12")) {
			videojuego.setImagenPegi("pegi-12.png");
		} else if(videojuego.getClasificacionEdad().equals("PEGI 16")) {
			videojuego.setImagenPegi("pegi-16.png");
		} else if(videojuego.getClasificacionEdad().equals("PEGI 18")) {
			videojuego.setImagenPegi("pegi-18.png");
		}
		
		vidService.insertarVideojuego(videojuego);
		
		VideojuegoEnConsola vec = new VideojuegoEnConsola();
		vec.setVideojuego(videojuego);
		vec.setConsola(conService.findById(consolaSwitch));
		vec.setImagenCaja(imagenCaja);
		vec.setPrecio(precio);
		vecService.insertarVec(vec);
		
		// Necesitamos recorrer un array de géneros
		// Por cada género, se crea un nuevo videojuegoygenero
		for(int genero : generoArray) {
			VideojuegoYGenero vyg = new VideojuegoYGenero();
			vyg.setGenero(genService.findById(genero));
			vyg.setVideojuego(videojuego);
			vygService.insertarVideojuegoYGenero(vyg);
		}
				
		return "redirect:/";
	}
	
	@GetMapping("/altaVideojuegoXbox")
	public String altaVideojuegoXbox(Model model) {
		model.addAttribute("listadoGeneros", genService.findAll());	
		return "formAltaVideojuegoXbox";
	}
	
	@GetMapping("/altaVideojuegoPs5")
	public String altaVideojuegoPs5(Model model) {
		model.addAttribute("listadoGeneros", genService.findAll());
		return "formAltaVideojuegoPs5";
	}
	
	
}
