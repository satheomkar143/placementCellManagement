package com.sparkplacement.exception;

import java.util.NoSuchElementException;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
public class AllExceptionHandler {


	@ExceptionHandler(value = NoSuchElementException.class)
	public String NoSuchElementException(Exception ex, Model model) {		
		model.addAttribute("exception", ex);
		model.addAttribute("msg", "No such data found for that id");
		return "allError";
	}
	
	@ExceptionHandler(value = MethodArgumentNotValidException.class)
	public String MethodArgumentNotValidException(Exception ex, Model model) {		
		model.addAttribute("exception", ex);
		model.addAttribute("msg", "Please Enter valid ID");
		return "allError";
	}
	
	
	@ExceptionHandler
	public String exceptionHandler(Exception ex, Model model) {
		model.addAttribute("exception", ex);
		model.addAttribute("msg", ex.getMessage());
		
//		String referer = request.getHeader("Referer");
//	    session.setAttribute("previousUrl", referer);
	    
		return "allError";
	}
	
}
