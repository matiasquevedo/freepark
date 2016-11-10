package com.freepark.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.freepark.domain.Rol;
import com.freepark.domain.Usuario;

public class SeguridadForm {

	private static final Logger logger = LoggerFactory.getLogger(SeguridadForm.class);
	
	@NotNull
	private Long id;

	@NotNull
	@Size(min = 5)
	private String password;

	@NotNull(groups = SeguridadForm.class)
	@Size(min = 5)
	private String confirmPassword;

	@NotNull
	@Size(min = 5, max = 30)
	private String username;
	
	@NotNull
	private Rol rol;
	
	public SeguridadForm() {
		
	}

	public SeguridadForm(Usuario usuario) {
		this.username = usuario.getUsername();
		this.id = usuario.getId();
		this.rol = usuario.getRoles();
		logger.info("Rol Asociado: {}", this.rol);
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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
	
	public void setRol(Rol rol) {
		this.rol = rol;
	}

	public Rol getRol() {
		return this.rol;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

}
