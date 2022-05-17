package com.jasgaming.pruebas.controller;
import java.io.File;

import java.io.IOException;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
											   @RequestParam("idConsola") String idConsola,
											   @RequestParam("precio") BigDecimal precio,
											   @RequestParam("genero") int[] generoArray,
											   @RequestParam("nombreCarpeta") String nombreCarpeta,
											   @RequestParam("imagenCua") MultipartFile imagenCua,
											   @RequestParam("imagenRec") MultipartFile imagenRec,	   
											   @RequestParam("imag1") MultipartFile imag1,
											   @RequestParam("imag2") MultipartFile imag2,
											   @RequestParam("imag3") MultipartFile imag3,
											   @RequestParam("imag4") MultipartFile imag4,
											   @RequestParam("imag5") MultipartFile imag5,
											   @RequestParam("imagCaja") MultipartFile imagCaja) throws IOException {
		
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
	
		
		// Creamos el directorio donde irán las imágenes del videojuego		
		new File("src//main//resources//static//images//videojuegos//" + nombreCarpeta).mkdir();
		vidService.subirImagen(videojuego, imagenCua, nombreCarpeta, 1);
		vidService.subirImagen(videojuego, imagenRec, nombreCarpeta, 2);
		vidService.subirImagen(videojuego, imag1, nombreCarpeta, 3);
		vidService.subirImagen(videojuego, imag2, nombreCarpeta, 4);
		vidService.subirImagen(videojuego, imag3, nombreCarpeta, 5);
		vidService.subirImagen(videojuego, imag4, nombreCarpeta, 6);
		vidService.subirImagen(videojuego, imag5, nombreCarpeta, 7);				
		vidService.insertarVideojuego(videojuego);
			
		VideojuegoEnConsola vec = new VideojuegoEnConsola();
		vec.setVideojuego(videojuego);
		vec.setConsola(conService.findById(idConsola));
		vec.setPrecio(precio);
		vecService.subirImagenCaja(vec, imagCaja, nombreCarpeta);
		vecService.insertarVec(vec);
			
		// Necesitamos recorrer un array de géneros
		// Por cada género, se crea un nuevo videojuegoygenero
		for(int genero : generoArray) {
			VideojuegoYGenero vyg = new VideojuegoYGenero();
			vyg.setGenero(genService.findById(genero));
			vyg.setVideojuego(videojuego);
			vygService.insertarVideojuegoYGenero(vyg);
		}
		
		return "redirect:/admin/videojuego";
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
	
	
	
	@GetMapping("/videojuego/eliminar/{idVec}")
	public String eliminarVideojuego(@PathVariable("idVec") int idVec, Model model) {
		model.addAttribute("vec", vecService.findById(idVec));
		return "confirmarEliminar";
	}
	
	
	@GetMapping("/confirmarEliminarJuego/{idVec}")
	public String confirmarEliminarJuego(@PathVariable("idVec") int idVec, Model model) {
		String titulo = vecService.findById(idVec).getVideojuego().getTitulo();
		if(vecService.eliminarVec(idVec) == 1) {
			model.addAttribute("mensaje", titulo + " eliminado correctamente.");
		} else {
			model.addAttribute("mensaje", titulo + "no se ha podido eliminar.");
		}
		return "forward:/admin/videojuego";
	}
	
	
}
