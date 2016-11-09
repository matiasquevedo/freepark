package com.freepark.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.freepark.domain.Rol;
import com.freepark.domain.Usuario;
import com.freepark.form.RolEditor;
import com.freepark.form.SeguridadForm;
import com.freepark.service.impl.RolServiceImpl;
import com.freepark.service.impl.UsuarioServiceImpl;

@Controller
@RequestMapping("/seguridad")
public class SeguridadController {

	private static final String URL_EDITAR = "usuarios/seguridad";
	private static final String URL_REDIRECT = "redirect:/usuarios/";
	
	private static final Logger logger = LoggerFactory.getLogger(SeguridadController.class);
	
	@Autowired
	private UsuarioServiceImpl serviceImpl;
	
	@Autowired
	private RolServiceImpl rolServiceImpl;
	
	
	@RequestMapping(value = "/{id}/editar", method = RequestMethod.GET)
	public String editar(@PathVariable("id") Long id, Model model) {
		SeguridadForm  seguridadForm = new SeguridadForm(serviceImpl.findById(id));
		model.addAttribute("seguridadForm", seguridadForm);
		model.addAttribute("roles", rolServiceImpl.findAll());
		return URL_EDITAR;
	}
	
	@RequestMapping(value = "/{id}/editar", method = RequestMethod.POST)
	public String formEditar(@PathVariable("id") Long id,
			@Valid @ModelAttribute("seguridadForm") SeguridadForm seguridadForm, BindingResult result, Model model,
			final RedirectAttributes redirectAttributes) {
		
		if (!result.hasErrors()) {
			Usuario usuario = serviceImpl.findById(seguridadForm.getId());
			usuario.setPassword(seguridadForm.getPassword());
			serviceImpl.update(usuario);
			redirectAttributes.addFlashAttribute("message", "Usuario actualizado.");
			redirectAttributes.addFlashAttribute("cssmessage", "alert-success");
			return URL_REDIRECT;
		  } else {
			for (ObjectError error : result.getAllErrors()) {
				logger.info("Validation error: " + error.getDefaultMessage());
			}
		}
		
		return URL_EDITAR;
	}
	
	@InitBinder
	protected void initRolBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Rol.class, new RolEditor(this.rolServiceImpl));
	}
	
}