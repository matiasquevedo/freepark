package com.freepark.form;

import java.beans.PropertyEditorSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.freepark.domain.Rol;
import com.freepark.service.impl.RolServiceImpl;


public class RolEditor extends PropertyEditorSupport {
	@Autowired
	private RolServiceImpl service;
	private static final Logger logger = LoggerFactory.getLogger(RolEditor.class);

	public RolEditor(RolServiceImpl service) {
		this.service = service;
	}

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		Rol rol = service.findById(Long.parseLong(text));
		setValue(rol);
	}
}