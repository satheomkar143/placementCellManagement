package com.sparkplacement.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sparkplacement.helper.Authentication;
import com.sparkplacement.model.Education;
import com.sparkplacement.model.StudentLoginInfo;
import com.sparkplacement.service.impl.PostServiceImpl;
import com.sparkplacement.service.impl.StudentLoginInfoServiceImpl;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/student")
public class StudentLoginInfoController {

	@Autowired
	private StudentLoginInfoServiceImpl studentLoginInfoServiceImpl;
	
	@Autowired
	private Authentication auth;
	
	@Autowired
	private PostServiceImpl postServiceImpl;

//	 get all students login info
	@GetMapping
	public String getAllStudentLoginInfo(Model model) {

		if(!auth.isLoggedIn()) {
			return "redirect:/";
		}
		
		model.addAttribute("students", studentLoginInfoServiceImpl.getAllStudentLoginInfo());
		return "allStudentsLoginInfo";
	}

//	add new student login info
	@PostMapping(consumes = "application/x-www-form-urlencoded")
	public String saveStudentLoginInfo(StudentLoginInfo studentLoginInfo, String confPass, Model model)
			throws Exception {
		if (!studentLoginInfo.getEmail().equals("") && studentLoginInfo.getPassword().equals(confPass)) {
			studentLoginInfoServiceImpl.saveStudentLoginInfo(studentLoginInfo);
			model.addAttribute("msg", "Account Created Successfully!!");
			return "studentLogin";
		} else {
			throw new Exception("please provide correct info");
		}
	}

//	update student login info
	@GetMapping("/edit/{id}")
	public String editStudentLoginInfo(@PathVariable int id, Model model) {
//		System.out.println("id : "+ id);
		model.addAttribute("student", studentLoginInfoServiceImpl.getStudentLoginInfoById(id));
		return "editStudent";
	}

	@PostMapping(value = "{id}", consumes = "application/x-www-form-urlencoded")
	public String updateStudentLoginInfo(@PathVariable int id, StudentLoginInfo studentLoginInfo, HttpSession session, Model model) {
//		System.out.println("update : "+ studentLoginInfo);
		StudentLoginInfo student = studentLoginInfoServiceImpl.getStudentLoginInfoById(id);

		studentLoginInfo.setPassword(student.getPassword());
		studentLoginInfo.setActive(student.isActive());

		if(student.getStudentData() != null && student.getStudentData().getPhoto() != null){
			studentLoginInfo.getStudentData().setPhoto(student.getStudentData().getPhoto());
		}
		if(student.getStudentData() != null && student.getStudentData().getBackPhoto() != null){
			studentLoginInfo.getStudentData().setBackPhoto(student.getStudentData().getBackPhoto());
		}
		if(student.getStudentData() != null && student.getStudentData().getJobsApplied() != null) {
			studentLoginInfo.getStudentData().setJobsApplied(student.getStudentData().getJobsApplied());
		}
		if(student.getStudentData() != null && student.getStudentData().getJobsSaved() != null) {
			studentLoginInfo.getStudentData().setJobsSaved(student.getStudentData().getJobsSaved());
		}
		if(student.getStudentData() != null && student.getStudentData().getMyPost() != null) {
			studentLoginInfo.getStudentData().setMyPost(student.getStudentData().getMyPost());
		}


//		System.out.println(student.getStudentData());
		
		if(student.getStudentData() != null){
			studentLoginInfo.getStudentData().setId(student.getStudentData().getId());
		}


		studentLoginInfoServiceImpl.updateStudentLoginInfoById(studentLoginInfo);
		// session.setAttribute("loginStudent", studentLoginInfo);
// -------------------------------------------------
		model.addAttribute("notificationMsg","profile updated successfully.");
		return "redirect:/student/profile/"+id;
	}

//	delete student login info
	@GetMapping("{id}")
	public String deleteStudentLoginInfo(@PathVariable int id) {
//		System.out.println("delete : "+id);
		studentLoginInfoServiceImpl.deleteStudentLoginInfoById(id);
		return "redirect:/student";
	}

//	login student
	@PostMapping("/login")
	public String studentLogin(StudentLoginInfo studentLoginInfo, Model model, HttpSession session) {
//		System.out.println("in login"+ studentLoginInfo);

		StudentLoginInfo student = studentLoginInfoServiceImpl.getStudentLoginInfoById(studentLoginInfo.getId());
		// System.out.println("student"+ student);
		if (student.isActive()) {
			if (studentLoginInfo.getEmail().equals(student.getEmail())
					&& studentLoginInfo.getPassword().equals(student.getPassword())) {
				session.setAttribute("loginStudent", student);
				model.addAttribute("allPost" , postServiceImpl.getAllPost() );
				model.addAttribute("userRequest", "posts");
				return "studentSideProfile";
			} else {
				model.addAttribute("msg", "Please enter a valid email and password");
				return "studentLogin";
			}
		} else {
			model.addAttribute("active", student.isActive());
			model.addAttribute("msg", "Account is not activated. please try again later.");
			return "studentLogin";
		}

	}
	
//	go to home page
	@GetMapping("/home/{id}")
	public String goToHome(@PathVariable int id, Model model, HttpSession session) {
		
//		if(!auth.isLoggedIn()) {
//			return "redirect:/";
//		}
		StudentLoginInfo student = studentLoginInfoServiceImpl.getStudentLoginInfoById(id);
		session.setAttribute("loginStudent", student);
		model.addAttribute("allPost" , postServiceImpl.getAllPost() );
		model.addAttribute("userRequest", "posts");
		return "studentSideProfile";
		
	}

	
//	go to student profile page
	@GetMapping("/profile/{id}")
	public String goToProfile(@PathVariable int id, Model model) {
		StudentLoginInfo student = studentLoginInfoServiceImpl.getStudentLoginInfoById(id);
		model.addAttribute("loginStudent", student);
		return "studentProfile";
	}
	
//	logout student
	@GetMapping("/logout")
	public String logoutStudent(HttpSession session) {
		  session.invalidate();
		  return "redirect:/";

	}


		
}
	
	
	
	
	
	
	
