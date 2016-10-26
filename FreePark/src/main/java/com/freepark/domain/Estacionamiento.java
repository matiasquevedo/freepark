package com.freepark.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
@Table(name = "estacionamientos")
public class Estacionamiento {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@NotNull
	@Column(name="estado")
	private Boolean estado;
	
	@NotNull
	@Column(name="referencia")
	private String referencia;

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinTable(
			name="playas_estacionamientos", joinColumns={@JoinColumn(name="estacionamientos_id", referencedColumnName="id")}, 
			inverseJoinColumns={@JoinColumn(name="playas_id", referencedColumnName="id")}
	)
	private Playa playas_id;
	
	@NotNull
	@Column(name="techo")
	private Boolean techo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Boolean getEstado() {
		return estado;
	}

	public void setEstado(Boolean estado) {
		this.estado = estado;
	}

	public Playa getPlayas_id() {
		return playas_id;
	}

	public void setPlayas_id(Playa playas_id) {
		this.playas_id = playas_id;
	}

	public Boolean getTecho() {
		return techo;
	}

	public void setTecho(Boolean techo) {
		this.techo = techo;
	}
	
	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	@Override
	public String toString() {
		return "Estacionamieto [id=" + id + ", estado=" + estado
				+ ", playas_id=" + playas_id + ", techo=" + techo + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((playas_id == null) ? 0 : playas_id.hashCode());
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
		Estacionamiento other = (Estacionamiento) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (playas_id == null) {
			if (other.playas_id != null)
				return false;
		} else if (!playas_id.equals(other.playas_id))
			return false;
		return true;
	}
	
}
