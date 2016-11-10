package com.freepark.controller.backend;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.freepark.domain.Vehiculo;
import com.freepark.service.impl.VehiculoServiceImpl;

@Controller
@RequestMapping("backend/vehiculos/")
public class VehiculoController {

	private static final String URL_INDEX = "backend/vehiculos/index";
	private static final String URL_NUEVO = "backend/vehiculos/nuevo";
	private static final String URL_REDIRECT = "redirect:/backend/vehiculos/";
	private static final Logger logger = LoggerFactory.getLogger(VehiculoController.class);
	
	@Autowired
	private VehiculoServiceImpl service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("vehiculos", service.findAll());
		return URL_INDEX;
	}
	
	@RequestMapping(value = "/eliminar/{id_vehiculo}", method = RequestMethod.GET)
	public String eliminar(@Valid @PathVariable("id_vehiculo") long id_vehiculo) {
		service.removeById(id_vehiculo);
		return URL_REDIRECT;
	}
	
}