package com.freepark.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.freepark.domain.Estacionamiento;
import com.freepark.service.impl.EstacionamientoServiceImpl;

@Controller
@RequestMapping("/estacionamientos")
public class EstacionamientoController {

	private static final String URL_INDEX = "estacionamientos/index";
	private static final String URL_NUEVO = "estacionamientos/nuevo";
	private static final String URL_REDIRECT = "redirect:/estacionamientos/";
	private static final Logger logger = LoggerFactory.getLogger(PlayaController.class);
	
	@Autowired
	private EstacionamientoServiceImpl service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("estacionamientos", service.findAll());
		return URL_INDEX;
	}
	
	@RequestMapping(value = "/nuevo", method = RequestMethod.GET)
	public String nuevo(Model model) {
		Estacionamiento estacionamiento = new Estacionamiento();
		model.addAttribute("estacionamiento", estacionamiento);
		return URL_NUEVO;
	}
	
	@RequestMapping(value = "/nuevo", method = RequestMethod.POST)
	public String guardar(@Valid @ModelAttribute("estacionamiento") Estacionamiento estacionamiento, BindingResult result, Model model) {
		if (!result.hasErrors()) {
			service.create(estacionamiento);
			return URL_REDIRECT;
		} else {
			for (ObjectError error : result.getAllErrors()) {
				logger.info("Validation error: " + error.getDefaultMessage());
			}
		}
		return URL_NUEVO;
	}
	
}