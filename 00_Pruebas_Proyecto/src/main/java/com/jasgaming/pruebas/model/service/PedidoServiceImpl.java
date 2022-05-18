package com.jasgaming.pruebas.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasgaming.pruebas.model.entities.Pedido;
import com.jasgaming.pruebas.model.repository.PedidoRepository;

@Service
public class PedidoServiceImpl implements PedidoService {

	@Autowired
	private PedidoRepository pedidoRepo;

	@Override
	public List<Pedido> findAll() {
		return pedidoRepo.findAll();
	}

	@Override
	public Pedido findById(int idPedido) {
		return pedidoRepo.findById(idPedido).orElse(null);
	}

	@Override
	public int altaPedido(Pedido pedido) {
		int filasInsertadas = 0;
		
		try {
			pedidoRepo.save(pedido);
			filasInsertadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasInsertadas;
	}
	
	
	
}
