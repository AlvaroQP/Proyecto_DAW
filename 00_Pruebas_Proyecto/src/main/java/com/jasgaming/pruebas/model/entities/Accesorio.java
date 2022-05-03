package com.jasgaming.pruebas.model.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;

import javax.persistence.*;

@Entity
@Table(name="accesorios")
public class Accesorio implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="id_accesorio")
	private int idAccesorio;
	
	private String nombre;
	
	@Column(name="fecha_lanzamiento")
	private Date fechaLanzamiento;
	
	private String descripcion;
	
	private BigDecimal precio;
	
	private String tamano;
	
	private String peso;
	
	private String conectividad;
	
	@Column(name="imagen_cuadrada")
	private String imagenCuadrada;

	@Column(name="imagen_rectangular")
	private String imagenRectangular;
	
	@Column(name="imagen_1")
	private String imagen1;

	@Column(name="imagen_2")
	private String imagen2;

	@Column(name="imagen_3")
	private String imagen3;

	@ManyToOne
	@JoinColumn(name="id_consola")
	private Consola consola;

	public Accesorio() {
		
	}

	public int getIdAccesorio() {
		return idAccesorio;
	}

	public void setIdAccesorio(int idAccesorio) {
		this.idAccesorio = idAccesorio;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Date getFechaLanzamiento() {
		return fechaLanzamiento;
	}

	public void setFechaLanzamiento(Date fechaLanzamiento) {
		this.fechaLanzamiento = fechaLanzamiento;
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

	public String getTamano() {
		return tamano;
	}

	public void setTamano(String tamano) {
		this.tamano = tamano;
	}

	public String getPeso() {
		return peso;
	}

	public void setPeso(String peso) {
		this.peso = peso;
	}

	public String getConectividad() {
		return conectividad;
	}

	public void setConectividad(String conectividad) {
		this.conectividad = conectividad;
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

	public Consola getConsola() {
		return consola;
	}

	public void setConsola(Consola consola) {
		this.consola = consola;
	}

	@Override
	public int hashCode() {
		return Objects.hash(idAccesorio);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof Accesorio))
			return false;
		Accesorio other = (Accesorio) obj;
		return idAccesorio == other.idAccesorio;
	}
		
}
