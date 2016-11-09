package com.freepark.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;

import com.freepark.service.Service;

public abstract class ServiceImpl<T, ID extends Serializable> implements Service<T, ID> {

	@Autowired
	protected JpaRepository<T, ID> dao;

	@Override
	public void create(T entity) {
		dao.saveAndFlush(entity);
	}

	@Override
	public void remove(T entity) {
		dao.delete(entity);
		dao.flush();
	}

	@Override
	public void update(T entity) {
		dao.saveAndFlush(entity);
	}

	@Override
	public T findById(ID id) {
		return dao.findOne(id);
	}

	@Override
	public List<T> findAll() {
		return dao.findAll();
	}
	
	public void removeById(Long id) {
		dao.delete((ID) id);
	}
}