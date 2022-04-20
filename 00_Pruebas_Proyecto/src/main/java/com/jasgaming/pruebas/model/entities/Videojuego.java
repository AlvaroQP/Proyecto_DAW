package com.jasgaming.pruebas.model.entities;
import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


@Entity
@Table(name="videojuegos")
@NamedQuery(name="Videojuego.findAll", query="SELECT v FROM Videojuego v")
public class Videojuego implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_videojuego")
	private int idVideojuego;

	@Column(name="clasificacion_edad")
	private String clasificacionEdad;

	private String descripcion;

	private String estudio;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_lanzamiento")
	private Date fechaLanzamiento;

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

	@Column(name="imagen_pegi")
	private String imagenPegi;
	
	private String novedad;

	@Column(name="numero_jugadores")
	private String numeroJugadores;

	private int puntuacion;

	private int stock;

	private String titulo;

	public Videojuego() {
	}

	public int getIdVideojuego() {
		return this.idVideojuego;
	}

	public void setIdVideojuego(int idVideojuego) {
		this.idVideojuego = idVideojuego;
	}

	public String getClasificacionEdad() {
		return this.clasificacionEdad;
	}

	public void setClasificacionEdad(String clasificacionEdad) {
		this.clasificacionEdad = clasificacionEdad;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getEstudio() {
		return this.estudio;
	}

	public void setEstudio(String estudio) {
		this.estudio = estudio;
	}

	public Date getFechaLanzamiento() {
		return this.fechaLanzamiento;
	}

	public void setFechaLanzamiento(Date fechaLanzamiento) {
		this.fechaLanzamiento = fechaLanzamiento;
	}

	public String getImagen1() {
		return this.imagen1;
	}

	public void setImagen1(String imagen1) {
		this.imagen1 = imagen1;
	}

	public String getImagen2() {
		return this.imagen2;
	}

	public void setImagen2(String imagen2) {
		this.imagen2 = imagen2;
	}

	public String getImagen3() {
		return this.imagen3;
	}

	public void setImagen3(String imagen3) {
		this.imagen3 = imagen3;
	}

	public String getImagen4() {
		return this.imagen4;
	}

	public void setImagen4(String imagen4) {
		this.imagen4 = imagen4;
	}

	public String getImagen5() {
		return this.imagen5;
	}

	public void setImagen5(String imagen5) {
		this.imagen5 = imagen5;
	}
	
	public String getImagenPegi() {
		return this.imagenPegi;
	}
	
	public void setImagenPegi(String imagenPegi) {
		this.imagenPegi = imagenPegi;
	}

	public String getImagenCuadrada() {
		return this.imagenCuadrada;
	}

	public void setImagenCuadrada(String imagenCuadrada) {
		this.imagenCuadrada = imagenCuadrada;
	}

	public String getImagenRectangular() {
		return this.imagenRectangular;
	}

	public void setImagenRectangular(String imagenRectangular) {
		this.imagenRectangular = imagenRectangular;
	}

	public String getNovedad() {
		return this.novedad;
	}

	public void setNovedad(String novedad) {
		this.novedad = novedad;
	}

	public String getNumeroJugadores() {
		return this.numeroJugadores;
	}

	public void setNumeroJugadores(String numeroJugadores) {
		this.numeroJugadores = numeroJugadores;
	}

	public int getPuntuacion() {
		return this.puntuacion;
	}

	public void setPuntuacion(int puntuacion) {
		this.puntuacion = puntuacion;
	}

	public int getStock() {
		return this.stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getTitulo() {
		return this.titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

}