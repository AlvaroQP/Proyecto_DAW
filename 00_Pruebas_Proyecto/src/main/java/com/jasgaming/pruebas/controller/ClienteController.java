package com.jasgaming.pruebas.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jasgaming.pruebas.model.entities.Usuario;
import com.jasgaming.pruebas.model.entities.Accesorio;
import com.jasgaming.pruebas.model.entities.Consola;
import com.jasgaming.pruebas.model.entities.Pedido;
import com.jasgaming.pruebas.model.entities.Videojuego;
import com.jasgaming.pruebas.model.service.AccesorioService;
import com.jasgaming.pruebas.model.service.ConsolaService;
import com.jasgaming.pruebas.model.service.VideojuegoService;

@Controller
@RequestMapping("/cliente")
public class ClienteController {
	
	@Autowired
	private AccesorioService accesorioser;
	
	@Autowired
	private ConsolaService consolaser;
	
	@Autowired
	private VideojuegoService videojuegoser;
	

	@GetMapping("/verCarrito")
	public String verCarrito(Model model, HttpSession session) {
		List<Accesorio> listaAccesorio = (List<Accesorio>) session.getAttribute("listaAccesorio");
		List<Consola> listaConsola = (List<Consola>) session.getAttribute("listaConsola");
		List<Videojuego> listaVideojuego = (List<Videojuego>) session.getAttribute("listaVideojuego");
		
		if(listaAccesorio == null) {
			listaAccesorio = new ArrayList<Accesorio>();
			session.setAttribute("listaAccesorio", listaAccesorio);
	}else {
			model.addAttribute("listaAccesorio", listaAccesorio);

	}		
		if(listaConsola == null) {
			listaConsola = new ArrayList<Consola>();
			session.setAttribute("listaConsola", listaConsola);
	}else {
			model.addAttribute("listaConsola", listaConsola);
	
	}
		if(listaVideojuego == null) {
			listaVideojuego = new ArrayList<Videojuego>();
			session.setAttribute("listaVideojuego", listaVideojuego);
	}else {
			model.addAttribute("listaVideojuego", listaVideojuego);
	
	}
		return "listaCarrito";
	
	}

	
	@GetMapping("/anadirCarrito/{idAccesorio}")
	public String anadirCarritoAccesorio(@PathVariable("idAccesorio")int idAccesorio ,Model model, HttpSession session) {
		List<Accesorio> carrito = (List<Accesorio>) session.getAttribute("lista");
		Accesorio accesorio = accesorioser.findById(idAccesorio);
		if (carrito == null) {
			carrito = new ArrayList<Accesorio>();
			session.setAttribute("lista", carrito);
		}
		int pos = carrito.indexOf(accesorio);
		if (pos == -1) {
			carrito.add(accesorio);
		}

		session.setAttribute("lista", carrito);
		return "forward:/cliente/verCarrito";
	}
	
	@GetMapping("/anadirCarrito/{idConsola}")
	public String anadirCarritoConsola(@PathVariable("idConsola")String idConsola ,Model model, HttpSession session) {
		List<Consola> carrito = (List<Consola>) session.getAttribute("lista");
		Consola consola = consolaser.findById(idConsola);
		if (carrito == null) {
			carrito = new ArrayList<Consola>();
			session.setAttribute("lista", carrito);
		}
		int pos = carrito.indexOf(consola);
		if (pos == -1) {
			carrito.add(consola);
		}

		session.setAttribute("lista", carrito);
		return "forward:/cliente/verCarrito";
	}
	
	@GetMapping("/anadirCarrito/{idVideojuego}")
	public String anadirCarritoVideojuego(@PathVariable("idVideojuego")int idVideojuego ,Model model, HttpSession session) {
		List<Videojuego> carrito = (List<Videojuego>) session.getAttribute("lista");
		Videojuego videojuego = videojuegoser.findById(idVideojuego);
		if (carrito == null) {
			carrito = new ArrayList<Videojuego>();
			session.setAttribute("lista", carrito);
		}
		int pos = carrito.indexOf(videojuego);
		if (pos == -1) {
			carrito.add(videojuego);
		}

		session.setAttribute("lista", carrito);
		return "forward:/cliente/verCarrito";
	}
	
	@GetMapping("/comprar")
	public String comprarLibro(HttpSession session, Model model) {
		List<Accesorio> listaAccesorio = (List<Accesorio>) session.getAttribute("listaAccesorio");
		List<Consola> listaConsola = (List<Consola>) session.getAttribute("listaConsola");
		List<Videojuego> listaVideojuego = (List<Videojuego>) session.getAttribute("listaVideojuego");
		
		Usuario usuario = (Usuario) session.getAttribute("usuario");

		if (listaAccesorio != null) {
			Pedido pedido = new Pedido();
			pedido.setUsername("");
			pedido.setDireccionEntrega(usuario.getDireccion());
			pedido.setEstado("Terminado");
			pedido.setFechaAlta(new Date());
			//List<LineasPedido> lineas = new ArrayList<LineasPedido>();

		}
		return "";
	}

}

