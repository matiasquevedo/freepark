package com.freepark.controller.backend;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.freepark.service.impl.PlayaServiceImpl;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping("backend/")
public class HomeController {

	private static final String URL_INDEX = "backend/default/index";
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		return URL_INDEX;
	}
	
}
