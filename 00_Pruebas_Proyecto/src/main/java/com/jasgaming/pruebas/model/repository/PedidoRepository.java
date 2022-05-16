package com.jasgaming.pruebas.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jasgaming.pruebas.model.entities.Pedido;

public interface PedidoRepository extends JpaRepository<Pedido, Integer> {

}
