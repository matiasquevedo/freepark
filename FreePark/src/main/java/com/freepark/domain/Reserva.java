package com.freepark.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "reservas")
public class Reserva implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@NotNull
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="usuarios_id")
	private Usuario usuario;
	
	@NotNull
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="vehiculos_id")
	private Vehiculo vehiculo;
	
	@NotNull
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "fecha_ingreso")
	private Date fechaIngreso;
	
	@NotNull
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "fecha_salida")
	private Date fechaSalida;
	
	@NotNull
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="estacionamientos_id")
	private Estacionamiento estacionamiento;
	
	public Reserva() {
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Vehiculo getVehiculo() {
		return vehiculo;
	}

	public void setVehiculo(Vehiculo vehiculo) {
		this.vehiculo = vehiculo;
	}

	public Date getFechaIngreso() {
		return fechaIngreso;
	}

	public void setFechaIngreso(Date fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}

	public Date getFechaSalida() {
		return fechaSalida;
	}

	public void setFechaSalida(Date fechaSalida) {
		this.fechaSalida = fechaSalida;
	}

	public Estacionamiento getEstacionamiento() {
		return estacionamiento;
	}

	public void setEstacionamiento(Estacionamiento estacionamiento) {
		this.estacionamiento = estacionamiento;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((estacionamiento == null) ? 0 : estacionamiento.hashCode());
		result = prime * result
				+ ((fechaIngreso == null) ? 0 : fechaIngreso.hashCode());
		result = prime * result
				+ ((fechaSalida == null) ? 0 : fechaSalida.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((usuario == null) ? 0 : usuario.hashCode());
		result = prime * result
				+ ((vehiculo == null) ? 0 : vehiculo.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Reserva other = (Reserva) obj;
		if (estacionamiento == null) {
			if (other.estacionamiento != null)
				return false;
		} else if (!estacionamiento.equals(other.estacionamiento))
			return false;
		if (fechaIngreso == null) {
			if (other.fechaIngreso != null)
				return false;
		} else if (!fechaIngreso.equals(other.fechaIngreso))
			return false;
		if (fechaSalida == null) {
			if (other.fechaSalida != null)
				return false;
		} else if (!fechaSalida.equals(other.fechaSalida))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (usuario == null) {
			if (other.usuario != null)
				return false;
		} else if (!usuario.equals(other.usuario))
			return false;
		if (vehiculo == null) {
			if (other.vehiculo != null)
				return false;
		} else if (!vehiculo.equals(other.vehiculo))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Reserva [id=" + id + ", usuario=" + usuario + ", vehiculo="
				+ vehiculo + ", fechaIngreso=" + fechaIngreso
				+ ", fechaSalida=" + fechaSalida + ", estacionamiento="
				+ estacionamiento + "]";
	}
	
}
