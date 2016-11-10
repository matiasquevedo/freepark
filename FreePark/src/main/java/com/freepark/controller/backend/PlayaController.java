package com.freepark.controller.backend;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.freepark.domain.Estacionamiento;
import com.freepark.domain.Playa;
import com.freepark.service.impl.EstacionamientoServiceImpl;
import com.freepark.service.impl.PlayaServiceImpl;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping("backend/playas/")
public class PlayaController {

	private static final String URL_INDEX = "backend/playas/index";
	private static final String URL_EDITAR = "backend/playas/editar";
	private static final String URL_NUEVO = "backend/playas/nuevo";
	private static final String URL_ESTACIONAMIENTO = "backend/playas/estacionamientos";
	private static final String URL_REDIRECT = "redirect:/backend/playas/";
	private static final Logger logger = LoggerFactory.getLogger(PlayaController.class);
	
	@Autowired
	private PlayaServiceImpl service;

	@Autowired
	private EstacionamientoServiceImpl serviceEst;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("playas", service.findAll());
		return URL_INDEX;
	}

	@RequestMapping(value = "/nuevo", method = RequestMethod.GET)
	public String nuevo(Model model){
		model.addAttribute("playa", new Playa());
		return URL_NUEVO;
	}
	
	@RequestMapping(value="/nuevo", method= RequestMethod.POST)
	public String form(@Valid Playa playa, BindingResult result,
			Model model){
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
	
	@RequestMapping(value = "/{id}/editar", method = RequestMethod.GET)
	public String editar(@PathVariable("id") Long id, Model model) {
		model.addAttribute("playa", service.findById(id));
		return URL_EDITAR;
		}
	
	@RequestMapping(value = "/{id}/editar", method = RequestMethod.POST)
	public String formEditar(@PathVariable("id") Long id,
			@Valid @ModelAttribute("playa") Playa playa, BindingResult result, Model model,
			final RedirectAttributes redirectAttributes) {
		
		if (!result.hasErrors()) {
			service.update(playa);
			redirectAttributes.addFlashAttribute("message", "Playa actualizada.");
			redirectAttributes.addFlashAttribute("cssmessage", "alert-success");
			return URL_REDIRECT;
		  } else {
			for (ObjectError error : result.getAllErrors()) {
				logger.info("Validation error: " + error.getDefaultMessage());
			}
		}
		
		return URL_EDITAR;
	}
	
	
	@RequestMapping(value = "/{id}/borrar", method = RequestMethod.GET)
	public String borrar(@PathVariable("id") Long id, Model model) {
		service.removeById(id);
		return URL_REDIRECT;
	}
	

	@RequestMapping(value = "/{id}/estacionamientos", method = RequestMethod.GET)
	public String estacionamiento(@PathVariable("id") Long id, Model model) {
		model.addAttribute("playa", service.findById(id));
		model.addAttribute("estacionamiento", new Estacionamiento());
		return URL_ESTACIONAMIENTO;
		}
	
	@RequestMapping(value="/{id}/estacionamientos", method= RequestMethod.POST)
	public String nuevoEstacionamiento(@PathVariable("id") Long id,
			@Valid @ModelAttribute("estacionamiento") Estacionamiento estacionamiento, BindingResult result,
			Model model){
		
		if (!result.hasErrors()) {
			estacionamiento.setPlaya(service.findById(id));
			serviceEst.create(estacionamiento);
			return "redirect:/backend/playas/{id}/estacionamientos";
		} else {
			for (ObjectError error : result.getAllErrors()) {
				logger.info("Validation error: " + error.getDefaultMessage());
			}
		}
	
		return "redirect:/backend/playas/{id}/estacionamientos";
	}

}
