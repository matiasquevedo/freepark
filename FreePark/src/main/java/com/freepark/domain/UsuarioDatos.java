package com.freepark.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

@Entity
@Table(name="usuarios_datos")
public class UsuarioDatos implements java.io.Serializable {
	private static final long serialVersionUID = -332841417825309948L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@NotNull
	@Size(min=2, max=30)
	@Column(name = "apellido")
	private String apellido;
	
	@NotNull
	@Size(min=2, max=30)
	@Column(name = "nombre")
	private String nombre;
	
	@NotNull
	@Email
	@Size(min=2, max=120)
	@Column(name = "email")
	private String email;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="usuarios_id")
	private Usuario usuario;
	
	public UsuarioDatos() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
