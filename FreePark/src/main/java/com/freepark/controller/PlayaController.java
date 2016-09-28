package com.freepark.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.freepark.service.impl.PlayasServiceImpl;

@Controller
@RequestMapping("/playas")
public class PlayaController {

	private static final String URL_INDEX = "playas/index";
	private static final String URL_NUEVO = "playas/nuevo";
	private static final Logger logger = LoggerFactory.getLogger(PlayaController.class);
	
	@Autowired
	private PlayasServiceImpl service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		return URL_INDEX;
	}
	
	@RequestMapping(value = "/nuevo", method = RequestMethod.GET)
	public String nuevo(Model model) {	
		return URL_NUEVO;
	}
}
