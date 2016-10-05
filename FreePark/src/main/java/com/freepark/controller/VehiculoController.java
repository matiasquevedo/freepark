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

import com.freepark.domain.Vehiculo;
import com.freepark.service.impl.VehiculoServiceImpl;

@Controller
@RequestMapping("/vehiculos")
public class VehiculoController {

	private static final String URL_INDEX = "vehiculos/index";
	private static final String URL_NUEVO = "vehiculos/nuevo";
	private static final String URL_REDIRECT = "redirect:/vehiculos/";
	private static final Logger logger = LoggerFactory.getLogger(VehiculoController.class);
	
	@Autowired
	private VehiculoServiceImpl service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("vehiculos", service.findAll());
		return URL_INDEX;
	}
	
	@RequestMapping(value = "/nuevo", method = RequestMethod.GET)
	public String nuevo(Model model) {
		Vehiculo vehiculo = new Vehiculo();
		model.addAttribute("vehiculo", vehiculo);
		return URL_NUEVO;
	}
	
	@RequestMapping(value = "/nuevo", method = RequestMethod.POST)
	public String guardar(@Valid @ModelAttribute("vehiculo") Vehiculo vehiculo, BindingResult result, Model model) {
		if (!result.hasErrors()) {
			service.create(vehiculo);
			return URL_REDIRECT;
		} else {
			for (ObjectError error : result.getAllErrors()) {
				logger.info("Validation error: " + error.getDefaultMessage());
			}
		}
		return URL_NUEVO;
	}
	
}