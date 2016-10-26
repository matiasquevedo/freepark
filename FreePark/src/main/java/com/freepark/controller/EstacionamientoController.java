package com.freepark.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.freepark.domain.Estacionamiento;
import com.freepark.domain.Playa;
import com.freepark.service.impl.EstacionamientoServiceImpl;
import com.freepark.service.impl.PlayaServiceImpl;

@Controller
@RequestMapping("/estacionamientos")
public class EstacionamientoController {

	private static final String URL_REDIRECT = "redirect:/estacionamientos/";
	private static final Logger logger = LoggerFactory.getLogger(EstacionamientoController.class);
	
	@Autowired
	private EstacionamientoServiceImpl service;
	
	@Autowired
	private PlayaServiceImpl playaservice;
	
	@RequestMapping(value = "/nuevo.json", method = RequestMethod.POST)
	@ResponseBody
	public boolean nuevo(@RequestBody Estacionamiento estacionamiento) {
		service.create(estacionamiento);
		return true;
	}

	@RequestMapping(value = "/listbyplaya.json/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<Estacionamiento> buscar(@PathVariable Long id) {
		return playaservice.findById((long) id).getEstacionamientos();	
		}
	
	@RequestMapping(value = "/eliminar.json", method = RequestMethod.POST)
	@ResponseBody
	public boolean eliminar(@RequestBody Estacionamiento estacionamiento) {
		service.remove(estacionamiento);
		return true;
		}
}