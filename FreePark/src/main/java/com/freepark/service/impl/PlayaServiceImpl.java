package com.freepark.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freepark.domain.Playa;
import com.freepark.repository.PlayaRepository;

@Service
public class PlayaServiceImpl extends ServiceImpl<Playa, Long> {
	
	@Autowired
	private PlayaRepository dao;

	@Override
	public void create(Playa entity) {
		super.create(entity);
	}

	@Override
	public void remove(Playa entity) {
		super.remove(entity);
	}

	@Override
	public void update(Playa entity) {
		super.update(entity);
	}

	@Override
	public Playa findById(Long id) {
		return super.findById(id);
	}

	@Override
	public List<Playa> findAll() {
		return super.findAll();
	}
	
}
