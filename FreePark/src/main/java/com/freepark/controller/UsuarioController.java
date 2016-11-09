package com.freepark.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.freepark.domain.Rol;
import com.freepark.domain.UsuarioDatos;
import com.freepark.service.impl.UsuarioDatosServiceImpl;
import com.freepark.form.RolEditor;
import com.freepark.service.impl.RolServiceImpl;
import com.freepark.service.impl.UsuarioServiceImpl;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

	private static final String URL_INDEX = "usuarios/index";
	private static final String URL_EDITAR = "usuarios/editar";
	private static final String URL_REDIRECT = "redirect:/usuarios/";
	
	private static final Logger logger = LoggerFactory.getLogger(UsuarioController.class);
	
	@Autowired
	private UsuarioDatosServiceImpl serviceImpl;
	
	@Autowired
	private UsuarioServiceImpl usuarioServiceImpl;
	
	@Autowired
	private RolServiceImpl rolServiceImpl;
	
	@Autowired
	private Validator passwordValidator;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("usuariosDatos", serviceImpl.findAll());
		return URL_INDEX;
	}
	
	@RequestMapping(value = "/nuevo", method = RequestMethod.GET)
	public String nuevo(Model model){
		model.addAttribute("usuarioDatos", new UsuarioDatos());
		model.addAttribute("roles", rolServiceImpl.findAll());
		return "usuarios/nuevo";
	}
	
	@RequestMapping(value="/nuevo", method= RequestMethod.POST)
	public String form(@Valid UsuarioDatos usuarioDatos, BindingResult result,
			Model model, final RedirectAttributes redirectAttributes){
		passwordValidator.validate(usuarioDatos.getUsuario(), result);
		if (!result.hasErrors()) {
			usuarioServiceImpl.create(usuarioDatos.getUsuario());
			serviceImpl.create(usuarioDatos);
			redirectAttributes.addFlashAttribute("message", "Usuario creado.");
			redirectAttributes.addFlashAttribute("cssmessage", "alert-success");
			return "redirect:/usuarios/";
		} else {
			for (ObjectError error : result.getAllErrors()) {
				logger.info("Validation error: " + error.getDefaultMessage());
			}
		}
		model.addAttribute("roles", rolServiceImpl.findAll());
		return "usuarios/nuevo";
	}
	
	@RequestMapping(value = "/{id}/editar", method = RequestMethod.GET)
	public String editar(@PathVariable("id") Long id, Model model) {
		model.addAttribute("usuarioDatos", serviceImpl.findById(id));
		return URL_EDITAR;
		}
	
	@RequestMapping(value = "/{id}/editar", method = RequestMethod.POST)
	public String formEditar(@PathVariable("id") Long id,
			@Valid @ModelAttribute("usuarioDatos") UsuarioDatos usuarioDatos, BindingResult result, Model model,
			final RedirectAttributes redirectAttributes) {
		
		if (!result.hasErrors()) {
			usuarioDatos.setUsuario(serviceImpl.findById(usuarioDatos.getId()).getUsuario());
			serviceImpl.update(usuarioDatos);
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
	
	@RequestMapping(value = "/{id}/borrar", method = RequestMethod.GET)
	public String borrar(@PathVariable("id") Long id, Model model, final RedirectAttributes redirectAttributes) {
		UsuarioDatos usuarioDatos = serviceImpl.findById(id);
		if(usuarioDatos != null){
			serviceImpl.remove(usuarioDatos);
			redirectAttributes.addFlashAttribute("message", "Usuario borrado.");
			redirectAttributes.addFlashAttribute("cssmessage", "alert-warning");
		}
		return URL_REDIRECT;
	}
	
	@InitBinder
	protected void initRolBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Rol.class, new RolEditor(this.rolServiceImpl));
	}

}
