package com.jasgaming.pruebas.model.entities;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;

import javax.persistence.*;


@Entity
@Table(name="producto_en_pedido")
public class ProductoEnPedido implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="num_orden")
	private int numOrden;
	
	@ManyToOne
	@JoinColumn(name="id_pedido")
	private Pedido pedido;
		
	@Column(name="nombre_producto")
	private String nombreProducto;
	
	@Column(name="tipo_producto")
	private String tipoProducto;
	
	
	@Temporal(TemporalType.DATE)
	@Column(name="fecha_alta")
	private Date fechaAlta;
	
	private int cantidad;
	
	private BigDecimal precio;
	
	
	public ProductoEnPedido() {
		
	}
	
	
	
	public String getNombreProducto() {
		return nombreProducto;
	}


	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}


	public String getTipoProducto() {
		return tipoProducto;
	}


	public void setTipoProducto(String tipoProducto) {
		this.tipoProducto = tipoProducto;
	}


	public BigDecimal getPrecio() {
		return precio;
	}


	public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}

	
	public int getNumOrden() {
		return numOrden;
	}


	public void setNumOrden(int numOrden) {
		this.numOrden = numOrden;
	}


	public Pedido getPedido() {
		return pedido;
	}


	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

	public Date getFechaAlta() {
		return fechaAlta;
	}


	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}


	public int getCantidad() {
		return cantidad;
	}


	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}


	@Override
	public int hashCode() {
		return Objects.hash(numOrden);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof ProductoEnPedido))
			return false;
		ProductoEnPedido other = (ProductoEnPedido) obj;
		return numOrden == other.numOrden;
	}

	
}
