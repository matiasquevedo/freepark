package com.freepark.form.validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.freepark.domain.Usuario;


@Component
public class PasswordValidator implements Validator {
	private String atributo;
	private static final Logger logger = LoggerFactory.getLogger(PasswordValidator.class);
	@Override
	public boolean supports(Class<?> arg0) {
		return Usuario.class.equals(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Usuario usuario= (Usuario) target;
		if (!usuario.getPassword().equals(usuario.getConfirmPassword())) {
			errors.rejectValue(this.atributo, "password.invalido");
		}
	}

	public String getAtributo() {
		return atributo;
	}

	public void setAtributo(String atributo) {
		this.atributo = atributo;
	}

}
