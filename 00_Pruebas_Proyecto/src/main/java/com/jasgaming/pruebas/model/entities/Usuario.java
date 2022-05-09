package com.jasgaming.pruebas.model.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

import javax.persistence.*;

@Entity
@Table(name="usuarios")
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String username;
	
	private String password;
	
	private int enabled;
	
	private String nombre;
	
	private String apellidos;
	
	private String direccion;
	
	private String email;
	
	@Column(name="fecha_registro")
	private Date fechaRegistro;
	
	@Column(name="avatar_usuario")
	private String avatarUsuario;
	
	private String genero;
	
	private String newsletter;
	
	@ManyToOne
	@JoinColumn(name="id_perfil")
	private Perfile perfile;
	
	public Usuario() {
		
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getFechaRegistro() {
		return fechaRegistro;
	}

	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}

	public String getAvatarUsuario() {
		return avatarUsuario;
	}

	public void setAvatarUsuario(String avatarUsuario) {
		this.avatarUsuario = avatarUsuario;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getNewsletter() {
		return newsletter;
	}

	public void setNewsletter(String newsletter) {
		this.newsletter = newsletter;
	}

	public Perfile getPerfile() {
		return perfile;
	}

	public void setPerfile(Perfile perfile) {
		this.perfile = perfile;
	}

	@Override
	public int hashCode() {
		return Objects.hash(username);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof Usuario))
			return false;
		Usuario other = (Usuario) obj;
		return Objects.equals(username, other.username);
	}
	
	
	
	
}
