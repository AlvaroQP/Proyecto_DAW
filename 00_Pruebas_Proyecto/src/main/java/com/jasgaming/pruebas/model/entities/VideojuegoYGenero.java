package com.jasgaming.pruebas.model.entities;
import java.io.Serializable;
import javax.persistence.*;


@Entity
@Table(name="videojuego_y_genero")
@NamedQuery(name="VideojuegoYGenero.findAll", query="SELECT v FROM VideojuegoYGenero v")
public class VideojuegoYGenero implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_vyg")
	private int idVyg;

	//uni-directional many-to-one association to Genero
	@ManyToOne
	@JoinColumn(name="id_genero")
	private Genero genero;

	//uni-directional many-to-one association to Videojuego
	@ManyToOne
	@JoinColumn(name="id_videojuego")
	private Videojuego videojuego;

	public VideojuegoYGenero() {
	}

	public int getIdVyg() {
		return this.idVyg;
	}

	public void setIdVyg(int idVyg) {
		this.idVyg = idVyg;
	}

	public Genero getGenero() {
		return this.genero;
	}

	public void setGenero(Genero genero) {
		this.genero = genero;
	}

	public Videojuego getVideojuego() {
		return this.videojuego;
	}

	public void setVideojuego(Videojuego videojuego) {
		this.videojuego = videojuego;
	}

}