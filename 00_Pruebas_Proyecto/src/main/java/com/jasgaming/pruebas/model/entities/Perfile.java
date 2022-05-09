package com.jasgaming.pruebas.model.entities;
import java.io.Serializable;
import java.util.Objects;

import javax.persistence.*;

@Entity
@Table(name="perfiles")
public class Perfile implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_perfil")
	private int idPerfil;
	
	private String nombre;
	
	public Perfile() {
		
	}
	
	public Perfile(int idPerfil, String nombre) {
		this.idPerfil = idPerfil;
		this.nombre = nombre;
	}

	public int getIdPerfil() {
		return idPerfil;
	}

	public void setIdPerfil(int idPerfil) {
		this.idPerfil = idPerfil;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Override
	public int hashCode() {
		return Objects.hash(idPerfil);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof Perfile))
			return false;
		Perfile other = (Perfile) obj;
		return idPerfil == other.idPerfil;
	}
	
}
