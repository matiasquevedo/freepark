package com.freepark.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.freepark.domain.Usuario;
import com.freepark.repository.UsuarioRepository;

@Service
public class UsuarioServiceImpl extends ServiceImpl<Usuario, Long> implements UserDetailsService{
	
	@Autowired
	private UsuarioRepository dao;
	
	private Usuario findUsername(String username) {
		List<Usuario> usuarioList = new ArrayList<Usuario>();

		usuarioList = dao.findUsername(username);
		if (usuarioList.size() > 0) {
			return usuarioList.get(0);
		} else {
			return null;
		}
	}

	@Override
	public void create(Usuario entity) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(entity.getPassword());
		entity.setPassword(hashedPassword);
		super.create(entity);
	}
	
	@Override
	public void update(Usuario entity) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(entity.getPassword());
		entity.setPassword(hashedPassword);
		super.update(entity);
	}

	@Override
	public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
		Usuario usuario = findUsername(login);
		if (usuario != null){
			return usuario;	
		}else{
			return null;
		}
		
	}

	@Override
	public void removeById(Long id) {
		super.removeById(id);
	}
	
}
