package com.freepark.service;

import java.io.Serializable;
import java.util.List;

public interface Service<T, ID extends Serializable> {
	
	void create(final T entity);
	void remove(final T entity);
	void update(final T entity);
	void removeById(final ID id);
	T findById(final ID id);

	List<T> findAll();
}
