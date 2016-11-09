package com.freepark.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freepark.domain.UsuarioDatos;
import com.freepark.repository.UsuarioDatosRepository;

@Service
public class UsuarioDatosServiceImpl extends ServiceImpl<UsuarioDatos, Long> {
	
	@Autowired
	private UsuarioDatosRepository dao;
	

	@Override
	public void create(UsuarioDatos entity) {
		super.create(entity);
	}
	
	@Override
	public void update(UsuarioDatos entity) {
		super.update(entity);
	}

}