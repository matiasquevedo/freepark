package com.freepark.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freepark.domain.Rol;
import com.freepark.repository.RolRepository;

@Service
public class RolServiceImpl extends ServiceImpl<Rol, Long>{
		
	@Autowired
	private RolRepository dao;	

}