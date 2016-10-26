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

import com.freepark.domain.Reserva;
import com.freepark.service.impl.ReservaServiceImpl;

@Controller
@RequestMapping("/reservas")
public class ReservaController {

	private static final String URL_INDEX = "reservas/index";
	private static final String URL_NUEVO = "reservas/nuevo";
	private static final String URL_REDIRECT = "redirect:/reservas/";
	private static final Logger logger = LoggerFactory.getLogger(ReservaController.class);
	
	@Autowired
	private ReservaServiceImpl service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("reservas", service.findAll());
		return URL_INDEX;
	}
	
	@RequestMapping(value = "/nuevo", method = RequestMethod.GET)
	public String nuevo(Model model) {
		Reserva reserva = new Reserva();
		model.addAttribute("reserva", reserva);
		return URL_NUEVO;
	}
	
	@RequestMapping(value = "/nuevo", method = RequestMethod.POST)
	public String guardar(@Valid @ModelAttribute("reserva") Reserva reserva, BindingResult result, Model model) {
		if (!result.hasErrors()) {
			service.create(reserva);
			return URL_REDIRECT;
		} else {
			for (ObjectError error : result.getAllErrors()) {
				logger.info("Validation error: " + error.getDefaultMessage());
			}
		}
		return URL_NUEVO;
	}
	
}