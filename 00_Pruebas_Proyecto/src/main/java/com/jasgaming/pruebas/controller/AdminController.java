package com.jasgaming.pruebas.controller;
import java.io.File;

import java.io.IOException;

import java.math.BigDecimal;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

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

import com.jasgaming.pruebas.model.entities.Accesorio;
import com.jasgaming.pruebas.model.entities.Consola;
import com.jasgaming.pruebas.model.entities.ModelosConsola;
import com.jasgaming.pruebas.model.entities.Videojuego;
import com.jasgaming.pruebas.model.entities.VideojuegoEnConsola;
import com.jasgaming.pruebas.model.entities.VideojuegoYGenero;

import com.jasgaming.pruebas.model.service.AccesorioService;
import com.jasgaming.pruebas.model.service.ConsolaService;
import com.jasgaming.pruebas.model.service.GeneroService;
import com.jasgaming.pruebas.model.service.ModelosConsolaService;
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
	private ModelosConsolaService mcService;
	
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
	public String altaVideojuego(Model model) {
		model.addAttribute("listadoGeneros", genService.findAll());
		return "formAltaVideojuego";
	}
	
	@PostMapping("/altaVideojuego")
	public String procesarAltaVideojuego(Videojuego videojuego, RedirectAttributes attr,
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
	
	@GetMapping("/videojuego/eliminar/{idVec}")
	public String eliminarVideojuego(@PathVariable("idVec") int idVec, Model model) {
		model.addAttribute("vec", vecService.findById(idVec));
		return "confirmarEliminarVideojuego";
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
	
	@GetMapping("/altaConsola")
	public String altaConsola(Model model) {
		// model.addAttribute("listadoConsolas", conService.findAll());
		return "formAltaConsola";
	}
	
	@PostMapping("/altaConsola")
	public String procesarAltaConsola(ModelosConsola modelosConsola, RedirectAttributes attr,
									  @RequestParam("idConsola") String idConsola,
									  @RequestParam("nombreCarpeta") String nombreCarpeta,									  
									  @RequestParam("imagenCua") MultipartFile imagenCua,
									  @RequestParam("imagenRec") MultipartFile imagenRec,	   
									  @RequestParam("imag1") MultipartFile imag1,
									  @RequestParam("imag2") MultipartFile imag2,
									  @RequestParam("imag3") MultipartFile imag3) {
		
		modelosConsola.setConsola(conService.findById(idConsola));

		// Creamos el directorio donde irán las imágenes de la consola	
		if(idConsola.equals("switch")) {
			nombreCarpeta = "/nin_switch/" + nombreCarpeta;
			new File("src//main//resources//static//images//consolas" + nombreCarpeta).mkdir();
		} else if(idConsola.equals("ps5")) {
			nombreCarpeta = "/consolas-ps5/" + nombreCarpeta;
			new File("src//main//resources//static//images//consolas" + nombreCarpeta).mkdir();
		} else {
			nombreCarpeta = "/Xbox/" + nombreCarpeta;
			new File("src//main//resources//static//images//consolas" + nombreCarpeta).mkdir();
		}
		
		mcService.subirImagen(modelosConsola, imagenCua, nombreCarpeta, 1);
		mcService.subirImagen(modelosConsola, imagenRec, nombreCarpeta, 2);
		mcService.subirImagen(modelosConsola, imag1, nombreCarpeta, 3);
		mcService.subirImagen(modelosConsola, imag2, nombreCarpeta, 4);
		mcService.subirImagen(modelosConsola, imag3, nombreCarpeta, 5);
		
		if(mcService.insertarModeloConsola(modelosConsola) == 1) {
			attr.addFlashAttribute("mensaje", "Consola dada de alta");
		} else {
			attr.addFlashAttribute("mensaje", "Consola no dada de alta");
		}
		
		return "redirect:/admin/consola";
	}
	
	@GetMapping("/consola/eliminar/{idModeloConsola}")
	public String eliminarConsola(@PathVariable("idModeloConsola") String idModeloConsola, Model model) {
		model.addAttribute("mc", mcService.findById(idModeloConsola));
		model.addAttribute("imagen", new File(mcService.findById(idModeloConsola).getImagenCuadrada()).getPath());
		return "confirmarEliminarConsola";
	}
	
	
	@GetMapping("/confirmarEliminarConsola/{idModeloConsola}")
	public String confirmarEliminarConsola(@PathVariable("idModeloConsola") String idModeloConsola, Model model) {
		String nombre = mcService.findById(idModeloConsola).getNombre();
		if(mcService.eliminarModeloConsola(idModeloConsola) == 1) {
			model.addAttribute("mensaje", nombre + " eliminado correctamente.");
		} else {
			model.addAttribute("mensaje", nombre + "no se ha podido eliminar.");
		}
		return "forward:/admin/consola";
	}	
	
	
	@GetMapping("/altaAccesorio")
	public String altaAccesorio(Model model) {
		return "formAltaAccesorio";
	}
	
	@PostMapping("/altaAccesorio")
	public String procesarAltaAccesorio(Accesorio accesorio, RedirectAttributes attr,
										@RequestParam("idConsola") String idConsola,	
										@RequestParam("imagenCua") MultipartFile imagenCua,
										@RequestParam("imagenRec") MultipartFile imagenRec,	   
										@RequestParam("imag1") MultipartFile imag1,
										@RequestParam("imag2") MultipartFile imag2,
										@RequestParam("imag3") MultipartFile imag3,
										@RequestParam("nombreCarpeta") String nombreCarpeta) {
		
		accesorio.setConsola(conService.findById(idConsola));
		
		// Creamos el directorio donde irán las imágenes de la consola	
		if(idConsola.equals("switch")) {
			nombreCarpeta = "/nin_switch/" + nombreCarpeta;
			new File("src//main//resources//static//images//accesorios" + nombreCarpeta).mkdir();
		} else if(idConsola.equals("ps5")) {
			nombreCarpeta = "/accesorios-ps5/" + nombreCarpeta;
			new File("src//main//resources//static//images//accesorios" + nombreCarpeta).mkdir();
		} else {
			nombreCarpeta = "/xbox_series_xs/" + nombreCarpeta;
			new File("src//main//resources//static//images//accesorios" + nombreCarpeta).mkdir();
		}
		
		accService.subirImagen(accesorio, imagenCua, nombreCarpeta, 1);
		accService.subirImagen(accesorio, imagenRec, nombreCarpeta, 2);
		accService.subirImagen(accesorio, imag1, nombreCarpeta, 3);
		accService.subirImagen(accesorio, imag2, nombreCarpeta, 4);
		accService.subirImagen(accesorio, imag3, nombreCarpeta, 5);
		
		if(accService.insertarAccesorio(accesorio) == 1) {
			attr.addFlashAttribute("mensaje", "Accesorio dado de alta");
		} else {
			attr.addFlashAttribute("mensaje", "Accesorio no dado de alta");
		}
				
		return "redirect:/admin/accesorio";
	}
	
	
	@GetMapping("/accesorio/eliminar/{idAccesorio}")
	public String eliminarAccesorio(@PathVariable("idAccesorio") int idAccesorio, Model model) {
		model.addAttribute("acc", accService.findById(idAccesorio));
		model.addAttribute("imagen", new File(accService.findById(idAccesorio).getImagenCuadrada()).getPath());
		return "confirmarEliminarAccesorio";
	}
	
	
	@GetMapping("/confirmarEliminarAccesorio/{idAccesorio}")
	public String confirmarEliminarAccesorio(@PathVariable("idAccesorio") int idAccesorio, Model model) {
		String nombre = accService.findById(idAccesorio).getNombre();

		if(accService.eliminarAccesorio(idAccesorio) == 1) {
			model.addAttribute("mensaje", nombre + " eliminado correctamente.");
		} else {
			model.addAttribute("mensaje", nombre + "no se ha podido eliminar.");
		}
		
		return "forward:/admin/accesorio";
	}	
	
	@GetMapping("/videojuego/detalle/{idVec}")
	public String verDetalle(@PathVariable("idVec") int idVec, Model model) {
		int idVideojuego = vecService.findById(idVec).getVideojuego().getIdVideojuego();
		
		model.addAttribute("vec", vecService.findById(idVec));
		model.addAttribute("listaVyg", vygService.findGenerosIdVideojuego(idVideojuego));
		return "detalleVideojuego";
	}
	
	@GetMapping("/consola/detalle/{idModeloConsola}")
	public String detalleConsola(@PathVariable("idModeloConsola") String idModeloConsola, Model model) {
		model.addAttribute("modeloConsola", mcService.findById(idModeloConsola));
		return "detalleConsola";
	}
	
	@GetMapping("/accesorio/detalle/{idAccesorio}")
	public String detalleAccesorio(@PathVariable("idAccesorio") int idAccesorio, Model model) {
		model.addAttribute("accesorio", accService.findById(idAccesorio));
		return "detalleAccesorio";
	}
	
	
	@GetMapping("/videojuego/editar/{idVec}")
	public String editarVideojuego(@PathVariable("idVec") int idVec, Model model) {
		model.addAttribute("idVec", idVec);
		model.addAttribute("videojuego", vecService.findById(idVec).getVideojuego().getTitulo());
		model.addAttribute("listadoGeneros", genService.findAll());	
		return "editarVideojuego";
	}
	
	@PostMapping("/videojuego/editar")
	public String procesarEditarVideojuego(Videojuego videojuego, RedirectAttributes attr,
										   @RequestParam("idVec") int idVec,								  
										   @RequestParam("precio") BigDecimal precio,
										   @RequestParam("genero") int[] generoArray) {
		
		VideojuegoEnConsola vecAntiguo = vecService.findById(idVec);
		Videojuego vidAntiguo = vecAntiguo.getVideojuego();

		
		VideojuegoEnConsola videojuegoEnConsola = new VideojuegoEnConsola();
		videojuegoEnConsola.setIdVec(idVec);
		videojuegoEnConsola.setPrecio(precio);
		videojuegoEnConsola.setConsola(vecAntiguo.getConsola());
		
		videojuego.setIdVideojuego(vidAntiguo.getIdVideojuego());
		
		// Las imágenes permanecen las que estaban
		videojuegoEnConsola.setImagenCaja(vecAntiguo.getImagenCaja());
		videojuego.setImagenCuadrada(vecAntiguo.getVideojuego().getImagenCuadrada());
		videojuego.setImagenRectangular(vecAntiguo.getVideojuego().getImagenRectangular());		
		videojuego.setImagen1(vecAntiguo.getVideojuego().getImagen1());		
		videojuego.setImagen2(vecAntiguo.getVideojuego().getImagen2());	
		videojuego.setImagen3(vecAntiguo.getVideojuego().getImagen3());	
		videojuego.setImagen4(vecAntiguo.getVideojuego().getImagen4());	
		videojuego.setImagen5(vecAntiguo.getVideojuego().getImagen5());	
		
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
		
		// Necesitamos borrar los antiguos videojuegoygenero antes de crear los nuevos
		// Recorremos la lista de todos los videojuegoYGenero (vyg)
		// Si el vyg tiene un videojuego cuyo id coincide con el del videojuego que estamos editando => lo eliminamos
		List<VideojuegoYGenero> listaVyg = vygService.findAll();
		for(VideojuegoYGenero vyg : listaVyg) {
			if(vyg.getVideojuego().getIdVideojuego() == videojuego.getIdVideojuego()) {
				vygService.eliminarVideojuegoYGenero(vyg.getIdVyg());		
			}
		}
			
		// Necesitamos recorrer el array de géneros recibido por RequestParam
		// Por cada género, se crea un nuevo videojuegoygenero
		for(int genero : generoArray) {
			VideojuegoYGenero vyg = new VideojuegoYGenero();
			vyg.setGenero(genService.findById(genero));
			vyg.setVideojuego(videojuego);
			vygService.editarVideojuegoYGenero(vyg);
		}
		
		videojuegoEnConsola.setVideojuego(videojuego);
		
		if(vidService.editarVideojuego(videojuego) == 1
		   && vecService.editarVec(videojuegoEnConsola) == 1) {
			attr.addFlashAttribute("mensaje", "Videojuego modificado");
		} else {
			attr.addFlashAttribute("mensaje", "Videojuego no modificado");
		}
		
		return "redirect:/admin/videojuego";
	}
	
	
	
	@GetMapping("/consola/editar/{idModeloConsola}")
	public String editarConsola(@PathVariable("idModeloConsola") String idModeloConsola, Model model) {
		model.addAttribute("idModeloConsola", idModeloConsola);
		model.addAttribute("nombreConsola", mcService.findById(idModeloConsola).getNombre());

		return "editarConsola";
	}
	
	@PostMapping("/consola/editar")
	public String procesarEditarConsola(ModelosConsola modelosConsola, RedirectAttributes attr,
										@RequestParam("idModeloConsola") String idModeloConsola) {
		
		ModelosConsola mcAntiguo = mcService.findById(idModeloConsola);		
		modelosConsola.setIdModeloConsola(idModeloConsola);
		modelosConsola.setConsola(mcAntiguo.getConsola());
		
		// Las imágenes permanecen sin cambiar
		modelosConsola.setImagenCuadrada(mcAntiguo.getImagenCuadrada());
		modelosConsola.setImagenRectangular(mcAntiguo.getImagenRectangular());
		modelosConsola.setImagen1(mcAntiguo.getImagen1());
		modelosConsola.setImagen2(mcAntiguo.getImagen2());
		modelosConsola.setImagen3(mcAntiguo.getImagen3());
		
		if(mcService.modificarModeloConsola(modelosConsola) == 1) {
			attr.addFlashAttribute("mensaje", "Consola modificada");
		} else {
			attr.addFlashAttribute("mensaje", "Consola no modificada");
		}
	
		return "redirect:/admin/consola";
	}
	
	
	
	@GetMapping("/accesorio/editar/{idAccesorio}")
	public String editarAccesorio(@PathVariable("idAccesorio") int idAccesorio, Model model) {
		model.addAttribute("idAccesorio", idAccesorio);
		model.addAttribute("nombreAccesorio", accService.findById(idAccesorio).getNombre());

		return "editarAccesorio";
	}
	
	@PostMapping("/accesorio/editar")
	public String procesarEditarAccesorio(Accesorio accesorio, RedirectAttributes attr,
										  @RequestParam("idAccesorio") int idAccesorio) {
		
		Accesorio accAntiguo = accService.findById(idAccesorio);
		accesorio.setIdAccesorio(idAccesorio);
		accesorio.setConsola(accAntiguo.getConsola());
		
		// Las imágenes permanecen sin cambiar
		accesorio.setImagenCuadrada(accAntiguo.getImagenCuadrada());
		accesorio.setImagenRectangular(accAntiguo.getImagenRectangular());
		accesorio.setImagen1(accAntiguo.getImagen1());
		accesorio.setImagen2(accAntiguo.getImagen2());		
		accesorio.setImagen3(accAntiguo.getImagen3());
		
		if(accService.modificarAccesorio(accesorio) == 1) {
			attr.addFlashAttribute("mensaje", "Accesorio modificado");
		} else {
			attr.addFlashAttribute("mensaje", "Accesorio no modificado");
		}
		
		return "redirect:/admin/accesorio";
	}
	
}
