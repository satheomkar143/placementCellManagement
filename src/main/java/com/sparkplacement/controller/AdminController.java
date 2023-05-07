package com.sparkplacement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sparkplacement.model.Admin;
import com.sparkplacement.service.impl.AdminServiceImpl;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminServiceImpl adminServiceImpl;

//	get all admin
	@GetMapping
	public String getAllAdmin(Model model) {
		model.addAttribute("admins", adminServiceImpl.getAllAdmin());
		return "allAdmin";
	}

//	delete admin
	@GetMapping("{id}")
	public String deleteAdmin(@PathVariable int id) {
		adminServiceImpl.deleteAdmin(id);
		return "redirect:/admin";
	}

//	add new admin
	@PostMapping(consumes = "application/x-www-form-urlencoded")
	public String saveAdmin(Admin admin, String confPass) throws Exception {
		if (!admin.getEmail().equals("") && admin.getPassword().equals(confPass)) {
			adminServiceImpl.saveAdmin(admin);
			return "redirect:/adminLogin.html";
		} else {
			throw new Exception("please provide correct info");
		}
	}

//	update admin
	@GetMapping("/edit/{id}")
	public String editAdmin(@PathVariable int id, Model model) {
		model.addAttribute("admin", adminServiceImpl.getAdmin(id));
		return "editAdmin";
	}

	@PostMapping(value = "{id}", consumes = "application/x-www-form-urlencoded")
	public String updateAdmin(@PathVariable int id, Admin admin) {
		adminServiceImpl.updateAdmin(admin);
		return "redirect:/admin";
	}

//	login admin
	@PostMapping("/login")
	public String adminLogin(Admin admin) {
		Admin student = adminServiceImpl.getAdmin(admin.getId());
		if (admin.getEmail().equals(student.getEmail()) && admin.getPassword().equals(student.getPassword())) {
			return "redirect:/admin";
		} else {
			return "redirect:/adminLogin.html";
		}

	}

}
