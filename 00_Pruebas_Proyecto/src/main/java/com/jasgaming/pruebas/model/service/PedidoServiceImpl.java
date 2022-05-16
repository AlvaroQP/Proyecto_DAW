package com.jasgaming.pruebas.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasgaming.pruebas.model.entities.Pedido;
import com.jasgaming.pruebas.model.repository.PedidoRepository;

@Service
public class PedidoServiceImpl implements PedidoService {

	@Autowired
	private PedidoRepository pedidorepo;

	@Override
	public List<Pedido> findAll() {
		return pedidorepo.findAll();
	}

	@Override
	public Pedido findById(int idPedido) {
		return pedidorepo.findById(idPedido).orElse(null);
	}
	
	
	
}
