package com.freepark.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freepark.domain.Vehiculo;
import com.freepark.repository.VehiculoRepository;

@Service
public class VehiculoServiceImpl extends ServiceImpl<Vehiculo, Long> {
	
	@Autowired
	private VehiculoRepository dao;

	@Override
	public void create(Vehiculo entity) {
		super.create(entity);
	}

	@Override
	public void remove(Vehiculo entity) {
		// TODO Auto-generated method stub
		super.remove(entity);
	}

	@Override
	public void update(Vehiculo entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public Vehiculo findById(Long id) {
		// TODO Auto-generated method stub
		return super.findById(id);
	}

	@Override
	public List<Vehiculo> findAll() {
		// TODO Auto-generated method stub
		return super.findAll();
	}
	
	@Override
	public void removeById(Long id) {
		super.removeById(id);
	}
	
}
