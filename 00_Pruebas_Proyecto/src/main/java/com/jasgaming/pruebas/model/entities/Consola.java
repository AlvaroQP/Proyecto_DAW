package com.jasgaming.pruebas.model.entities;
import java.io.Serializable;
import javax.persistence.*;


@Entity
@Table(name="consolas")
@NamedQuery(name="Consola.findAll", query="SELECT c FROM Consola c")
public class Consola implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_consola")
	private String idConsola;

	private String fabricante;
	
	@Column(name="logo_consola")
	private String logoConsola;

	private String nombre;


	public Consola() {
	}

	public String getIdConsola() {
		return this.idConsola;
	}

	public void setIdConsola(String idConsola) {
		this.idConsola = idConsola;
	}

	public String getFabricante() {
		return this.fabricante;
	}
	
	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}

	public String getLogoConsola() {
		return this.logoConsola;
	}

	public void setLogoConsola(String logoConsola) {
		this.logoConsola = logoConsola;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


}