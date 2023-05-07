package com.sparkplacement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sparkplacement.model.Enquiry;
import com.sparkplacement.service.impl.EnquiryServiceImpl;

@Controller
@RequestMapping("/enquiry")
public class EnquiryController {

	@Autowired
	private EnquiryServiceImpl enquiryServiceImpl;
	
//	get all enquiry
	@GetMapping
	public String getAllEnquiry(Model model) {
		model.addAttribute("enquiries", enquiryServiceImpl.getAllEnquiry());
		return "allEnquiry";
	}
	
//	add new enquiry
	@PostMapping(consumes = "application/x-www-form-urlencoded")
	public String saveEnquiry(Enquiry enquiry) {
		enquiryServiceImpl.saveEnquiry(enquiry);
		return "redirect:/enquiry";
	}
	
//	delete enquiry by id
	@GetMapping("{id}")
	public String deleteEnquiry(@PathVariable long id) {
		enquiryServiceImpl.deleteEnquiry(id);
		return "redirect:/enquiry";
	}
	
}
