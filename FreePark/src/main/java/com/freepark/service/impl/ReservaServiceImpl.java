package com.freepark.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freepark.domain.Reserva;
import com.freepark.repository.ReservaRepository;

@Service
public class ReservaServiceImpl extends ServiceImpl<Reserva, Long> {
	
	@Autowired
	private ReservaRepository dao;

	@Override
	public void create(Reserva entity) {
		super.create(entity);
	}

	@Override
	public void remove(Reserva entity) {
		super.remove(entity);
	}

	@Override
	public void update(Reserva entity) {
		super.update(entity);
	}

	@Override
	public Reserva findById(Long id) {
		return super.findById(id);
	}

	@Override
	public List<Reserva> findAll() {
		return super.findAll();
	}
	
	@Override
	public void removeById(Long id) {
		super.removeById(id);
	}
	
}
