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

import com.freepark.domain.Playa;
import com.freepark.service.impl.PlayaServiceImpl;

@Controller
@RequestMapping("/playas")
public class PlayaController {

	private static final String URL_INDEX = "playas/index";
	private static final String URL_NUEVO = "playas/nuevo";
	private static final String URL_REDIRECT = "redirect:/playas/";
	private static final Logger logger = LoggerFactory.getLogger(PlayaController.class);
	
	@Autowired
	private PlayaServiceImpl service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("playas", service.findAll());
		return URL_INDEX;
	}
	
	@RequestMapping(value = "/nuevo", method = RequestMethod.GET)
	public String nuevo(Model model) {
		Playa playa = new Playa();
		model.addAttribute("playa", playa);
		return URL_NUEVO;
	}
	
	@RequestMapping(value = "/nuevo", method = RequestMethod.POST)
	public String guardar(@Valid @ModelAttribute("playa") Playa playa, BindingResult result, Model model) {
		if (!result.hasErrors()) {
			service.create(playa);
			return URL_REDIRECT;
		} else {
			for (ObjectError error : result.getAllErrors()) {
				logger.info("Validation error: " + error.getDefaultMessage());
			}
		}
		return URL_NUEVO;
	}
	
}
