package com.jasgaming.pruebas.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jasgaming.pruebas.model.entities.Producto;

public interface ProductoRepository extends JpaRepository<Producto, Integer> {

}
