package com.jasgaming.pruebas.model.service;

import java.util.List;

import com.jasgaming.pruebas.model.entities.Pedido;

public interface PedidoService {
	
	List<Pedido> findAll();
	Pedido findById(int idPedido);
	int altaPedido(Pedido pedido);
	List<Pedido> pedidosCliente(String username);
	
}
