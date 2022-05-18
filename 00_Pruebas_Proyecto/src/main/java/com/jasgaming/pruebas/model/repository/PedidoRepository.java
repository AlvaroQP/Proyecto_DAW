package com.jasgaming.pruebas.model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.jasgaming.pruebas.model.entities.Pedido;

public interface PedidoRepository extends JpaRepository<Pedido, Integer> {

	@Query("select p from Pedido p where p.usuario.username = ?1")
	public List<Pedido> pedidosCliente(String username);
	
	
}
