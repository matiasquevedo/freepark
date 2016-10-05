package com.freepark.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freepark.domain.Estacionamiento;
import com.freepark.repository.EstacionamientoRepository;

@Service
public class EstacionamientoServiceImpl extends ServiceImpl<Estacionamiento, Long> {
	
	@Autowired
	private EstacionamientoRepository dao;

	@Override
	public void create(Estacionamiento entity) {
		super.create(entity);
	}

	@Override
	public void remove(Estacionamiento entity) {
		super.remove(entity);
	}

	@Override
	public void update(Estacionamiento entity) {
		super.update(entity);
	}

	@Override
	public Estacionamiento findById(Long id) {
		return super.findById(id);
	}

	@Override
	public List<Estacionamiento> findAll() {
		return super.findAll();
	}
	
}
