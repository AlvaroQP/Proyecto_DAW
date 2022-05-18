package com.jasgaming.pruebas.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jasgaming.pruebas.model.entities.Producto;
import com.jasgaming.pruebas.model.repository.ProductoRepository;

@Service
public class ProductoServiceImpl implements ProductoService {

	@Autowired
	private ProductoRepository productoRepo;
	
	@Override
	public int insertarProducto(Producto producto) {
		int filasInsertadas = 0;
		
		try {
			productoRepo.save(producto);
			filasInsertadas = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasInsertadas;
	}

	
	
}
