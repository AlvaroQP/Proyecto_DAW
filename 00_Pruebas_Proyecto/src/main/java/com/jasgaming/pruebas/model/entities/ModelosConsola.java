package com.jasgaming.pruebas.model.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Objects;

import javax.persistence.*;


@Entity
@Table(name="modelos_consolas")
public class ModelosConsola implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_modelo_consola")
	private String idModeloConsola;
	
	private String nombre;
	
	private String descripcion;
	
	private BigDecimal precio;
	
	@Column(name="imagen_1")
	private String imagen1;

	@Column(name="imagen_2")
	private String imagen2;

	@Column(name="imagen_3")
	private String imagen3;

	@Column(name="imagen_4")
	private String imagen4;

	@Column(name="imagen_5")
	private String imagen5;

	@Column(name="imagen_cuadrada")
	private String imagenCuadrada;

	@Column(name="imagen_rectangular")
	private String imagenRectangular;

	@ManyToOne
	@JoinColumn(name="id_consola")
	private Consola consola;
	
	public ModelosConsola() {
		
	}

	public String getIdModeloConsola() {
		return idModeloConsola;
	}

	public void setIdModeloConsola(String idModeloConsola) {
		this.idModeloConsola = idModeloConsola;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public BigDecimal getPrecio() {
		return precio;
	}

	public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}

	public String getImagen1() {
		return imagen1;
	}

	public void setImagen1(String imagen1) {
		this.imagen1 = imagen1;
	}

	public String getImagen2() {
		return imagen2;
	}

	public void setImagen2(String imagen2) {
		this.imagen2 = imagen2;
	}

	public String getImagen3() {
		return imagen3;
	}

	public void setImagen3(String imagen3) {
		this.imagen3 = imagen3;
	}

	public String getImagen4() {
		return imagen4;
	}

	public void setImagen4(String imagen4) {
		this.imagen4 = imagen4;
	}

	public String getImagen5() {
		return imagen5;
	}

	public void setImagen5(String imagen5) {
		this.imagen5 = imagen5;
	}

	public String getImagenCuadrada() {
		return imagenCuadrada;
	}

	public void setImagenCuadrada(String imagenCuadrada) {
		this.imagenCuadrada = imagenCuadrada;
	}

	public String getImagenRectangular() {
		return imagenRectangular;
	}

	public void setImagenRectangular(String imagenRectangular) {
		this.imagenRectangular = imagenRectangular;
	}

	public Consola getConsola() {
		return consola;
	}

	public void setConsola(Consola consola) {
		this.consola = consola;
	}

	@Override
	public int hashCode() {
		return Objects.hash(idModeloConsola);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof ModelosConsola))
			return false;
		ModelosConsola other = (ModelosConsola) obj;
		return Objects.equals(idModeloConsola, other.idModeloConsola);
	}
	
	
	
}
