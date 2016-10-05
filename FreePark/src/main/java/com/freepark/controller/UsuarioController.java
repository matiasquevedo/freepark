package com.freepark.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.freepark.domain.Usuario;
import com.freepark.service.impl.UsuarioServiceImpl;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

	private static final String URL_INDEX = "usuarios/index";
	private static final String URL_NUEVO = "usuarios/nuevo";
	private static final String URL_TODOS = "usuarios/todos";
	private static final Logger logger = LoggerFactory.getLogger(UsuarioController.class);
	
	@Autowired
	private UsuarioServiceImpl service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		return URL_INDEX;
	}
	
	@RequestMapping(value = "/nuevo", method = RequestMethod.GET)
	public String nuevo(Model model){
		model.addAttribute("usuario", new Usuario());
		return URL_NUEVO;
	}
	
	@RequestMapping(value="/nuevo", method= RequestMethod.POST)
	public String form(Usuario usuario, Model model){
		service.create(usuario);
		return URL_INDEX;
	}
	
	@RequestMapping(value = "/todos", method = RequestMethod.GET)
	public String todos(Model model) {
		String usuario = service.loadUserByUsername("pepito").getUsername();
		model.addAttribute("usuario", usuario);
		return URL_TODOS;
	}
	
}
