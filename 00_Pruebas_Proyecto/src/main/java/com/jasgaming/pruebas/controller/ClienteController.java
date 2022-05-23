package com.jasgaming.pruebas.controller;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jasgaming.pruebas.model.entities.Accesorio;
import com.jasgaming.pruebas.model.entities.ModelosConsola;
import com.jasgaming.pruebas.model.entities.Pedido;
import com.jasgaming.pruebas.model.entities.Producto;
import com.jasgaming.pruebas.model.entities.ProductoEnPedido;
import com.jasgaming.pruebas.model.entities.Usuario;
import com.jasgaming.pruebas.model.entities.VideojuegoEnConsola;
import com.jasgaming.pruebas.model.service.AccesorioService;

import com.jasgaming.pruebas.model.service.ModelosConsolaService;
import com.jasgaming.pruebas.model.service.PedidoService;

import com.jasgaming.pruebas.model.service.UsuarioService;
import com.jasgaming.pruebas.model.service.VideojuegoEnConsolaService;


@Controller
@RequestMapping("/cliente")
public class ClienteController {
	
	@Autowired
	private AccesorioService accService;
	
	@Autowired
	private PedidoService pedService;
	
	@Autowired
	private VideojuegoEnConsolaService vecService;
	
	@Autowired
	private ModelosConsolaService mcService;
		
	@Autowired
	private UsuarioService usuService;
	
	private int contadorIdProducto = 0;
	
	@SuppressWarnings("unchecked")
	@GetMapping("/anadir/videojuego/{idVec}")
	public String anadirVideojuegoCarrito(@PathVariable("idVec") int idVec, HttpSession session) {
		
		VideojuegoEnConsola vec = vecService.findById(idVec);
		Producto producto = new Producto();
		producto.setIdProducto(++contadorIdProducto);
		producto.setTipoProducto("Videojuego");
		producto.setNombre(vec.getVideojuego().getTitulo());
		producto.setPrecio(vec.getPrecio());
		producto.setImagenProducto(vec.getImagenCaja());
		
		ArrayList<Producto> productosCarrito = (ArrayList<Producto>) session.getAttribute("productosCarrito"); 
		
		if(productosCarrito == null) {
			productosCarrito = new ArrayList<Producto>();
		}
		
		productosCarrito.add(producto);
		session.setAttribute("productosCarrito", productosCarrito);
		
		return "forward:/cliente/verCarrito";
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/anadir/consola/{idModeloConsola}")
	public String anadirConsolaCarrito(@PathVariable("idModeloConsola") String idModeloConsola, HttpSession session) {
		
		ModelosConsola mc = mcService.findById(idModeloConsola);
		
		Producto producto = new Producto();
		producto.setIdProducto(++contadorIdProducto);
		producto.setTipoProducto("Consola");
		producto.setNombre(mc.getNombre());
		producto.setPrecio(mc.getPrecio());
		producto.setImagenProducto(mc.getImagenCuadrada());
		
		ArrayList<Producto> productosCarrito = (ArrayList<Producto>) session.getAttribute("productosCarrito"); 
		
		if(productosCarrito == null) {
			productosCarrito = new ArrayList<Producto>();
		}
		
		productosCarrito.add(producto);
		session.setAttribute("productosCarrito", productosCarrito);
		
		return "forward:/cliente/verCarrito";
	}	

	@SuppressWarnings("unchecked")
	@GetMapping("/anadir/accesorio/{idAccesorio}")
	public String anadirConsolaCarrito(@PathVariable("idAccesorio") int idAccesorio, HttpSession session) {
		
		Accesorio acc = accService.findById(idAccesorio);
		
		Producto producto = new Producto();
		producto.setIdProducto(++contadorIdProducto);
		producto.setTipoProducto("Accesorio");
		producto.setNombre(acc.getNombre());
		producto.setPrecio(acc.getPrecio());
		producto.setImagenProducto(acc.getImagenCuadrada());
		
		ArrayList<Producto> productosCarrito = (ArrayList<Producto>) session.getAttribute("productosCarrito"); 
		
		if(productosCarrito == null) {
			productosCarrito = new ArrayList<Producto>();
		}
		
		productosCarrito.add(producto);
		session.setAttribute("productosCarrito", productosCarrito);
		
		return "forward:/cliente/verCarrito";
	}	
		
	@SuppressWarnings("unchecked")
	@GetMapping("/verCarrito")
	public String verCarrito(HttpSession session, Model model) {
		ArrayList<Producto> productosCarrito = (ArrayList<Producto>) session.getAttribute("productosCarrito"); 
		
		if(productosCarrito == null) {
			productosCarrito = new ArrayList<Producto>();
		}
		
		BigDecimal total = new BigDecimal(0);
		
		for(Producto producto : productosCarrito) {
			total = total.add(producto.getPrecio());
		}
			
		model.addAttribute("total", total);
		
		return "carrito";		
	}

	
	@SuppressWarnings("unchecked")
	@GetMapping("/vaciarCarrito")
	public String vaciarCarrito(HttpSession session) {
		ArrayList<Producto> productosCarrito = (ArrayList<Producto>) session.getAttribute("productosCarrito"); 
		productosCarrito.clear();
		
		return "forward:/cliente/verCarrito";
	}	
	
	
	@SuppressWarnings("unchecked")
	@GetMapping("/comprar")
	public String comprar(HttpSession session, Authentication auth) {
		
		ArrayList<Producto> productosCarrito = (ArrayList<Producto>) session.getAttribute("productosCarrito");
		Usuario usuario = usuService.findById(auth.getName());
		
		Pedido pedido = new Pedido();
		pedido.setUsuario(usuario);
		pedido.setFechaAlta(new Date());
		pedido.setEstado("terminado");
		pedido.setDireccionEntrega(usuario.getDireccion());
		
		ArrayList<ProductoEnPedido> productosEnPedido = new ArrayList<ProductoEnPedido>();
		
		// Por cada Producto en la lista de productosCarrito -> generamos un nuevo ProductoEnPedido
		for(Producto producto : productosCarrito) {
			ProductoEnPedido pp = new ProductoEnPedido();
			pp.setPedido(pedido);
			pp.setNombreProducto(producto.getNombre());
			pp.setTipoProducto(producto.getTipoProducto());
			pp.setCantidad(1);
			pp.setFechaAlta(new Date());
			pp.setPrecio(producto.getPrecio());

			// Añadimos el ProductoEnPedido al ArrayList productosEnPedido
			productosEnPedido.add(pp);	
		}

		// Asignamos los productosEnPedido al pedido creado
		pedido.setProductosEnPedido(productosEnPedido);
		
		// Damos de alta el pedido
		pedService.altaPedido(pedido);
		
		// Una vez insertado, eliminamos los productos de la lista en sesión
		productosCarrito.clear();
			
		return "forward:/cliente/mensajeCompra";
	}
	
	@GetMapping("/mensajeCompra")
	public String mostrarMensajeCompra(Authentication auth, Model model) {
		model.addAttribute("fecha", new Date());
		
		return "compraRealizada";
	}
	
	
	@GetMapping("/pedidos")
	public String verPedidos(Model model, Authentication auth) {
		model.addAttribute("pedidosCliente", pedService.pedidosCliente(auth.getName()));
		return "pedidosCliente";
	}
	
}


