package com.jasgaming.pruebas.model.entities;

import java.io.Serializable;
import javax.persistence.*;


@Entity
@Table(name="generos")
@NamedQuery(name="Genero.findAll", query="SELECT g FROM Genero g")
public class Genero implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_genero")
	private int idGenero;

	private String nombre;

	public Genero() {
	}

	public int getIdGenero() {
		return this.idGenero;
	}

	public void setIdGenero(int idGenero) {
		this.idGenero = idGenero;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

}