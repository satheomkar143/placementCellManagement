package com.sparkplacement.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController implements ErrorController {

//	to handle any error
	@RequestMapping("/error")
	public String showErrorPage() {
		return "error";
	}

}
