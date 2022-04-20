package com.jasgaming.pruebas.model.entities;
import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


@Entity
@Table(name="videojuego_en_consola")
@NamedQuery(name="VideojuegoEnConsola.findAll", query="SELECT v FROM VideojuegoEnConsola v")
public class VideojuegoEnConsola implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_vec")
	private int idVec;

	@Column(name="imagen_caja")
	private String imagenCaja;

	private BigDecimal precio;

	//uni-directional many-to-one association to Consola
	@ManyToOne
	@JoinColumn(name="id_consola")
	private Consola consola;

	//uni-directional many-to-one association to Videojuego
	@ManyToOne
	@JoinColumn(name="id_videojuego")
	private Videojuego videojuego;

	public VideojuegoEnConsola() {
	}

	public int getIdVec() {
		return this.idVec;
	}

	public void setIdVec(int idVec) {
		this.idVec = idVec;
	}

	public String getImagenCaja() {
		return this.imagenCaja;
	}

	public void setImagenCaja(String imagenCaja) {
		this.imagenCaja = imagenCaja;
	}

	public BigDecimal getPrecio() {
		return this.precio;
	}

	public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}

	public Consola getConsola() {
		return this.consola;
	}

	public void setConsola(Consola consola) {
		this.consola = consola;
	}

	public Videojuego getVideojuego() {
		return this.videojuego;
	}

	public void setVideojuego(Videojuego videojuego) {
		this.videojuego = videojuego;
	}

}