package com.freepark.controller.backend;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.freepark.service.impl.EstacionamientoServiceImpl;

@Controller
@RequestMapping("backend/estacionamientos/")
public class EstacionamientoController {

	private static final String URL_ESTACIONAMIENTO = "/backend/playas/estacionamientos";
	private static final String URL_REDIRECT = "redirect:/playas/{id}/estacionamientos/";
	private static final Logger logger = LoggerFactory.getLogger(EstacionamientoController.class);
	
	@Autowired
	private EstacionamientoServiceImpl service;
	
	@RequestMapping(value="/{id}/borrar", method=RequestMethod.GET)
	public String borrar(@PathVariable("id") Long id, HttpServletRequest request){
		service.removeById(id);
		return "redirect:" + request.getHeader("referer");
	}
	
}