package com.sparkplacement.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.mysql.cj.Session;
import com.sparkplacement.model.JobDetails;
import com.sparkplacement.model.StudentLoginInfo;
import com.sparkplacement.service.impl.JobDetailsServiceImpl;
import com.sparkplacement.service.impl.StudentLoginInfoServiceImpl;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/jobdetail")
public class JobDetailsController {

	@Autowired
	private JobDetailsServiceImpl jobDetailsServiceImpl;
	
	@Autowired
	private StudentLoginInfoServiceImpl studentLoginInfoServiceImpl;
	
//	get all job posts
	@GetMapping
	public String getAllJobDetails(Model model, HttpSession session) throws Exception {
		StudentLoginInfo student = (StudentLoginInfo) session.getAttribute("loginStudent");
		if(student.getStudentData() == null){
			throw new Exception("Jobs cannot be shown. First complete your profile.");
		};

		List<JobDetails> allJobs = jobDetailsServiceImpl.getAllJobDetails();
		List<JobDetails> studJob = student.getStudentData().getJobsApplied();
		
		allJobs.removeAll(studJob);	
		
		model.addAttribute("jobDetails", allJobs);
		model.addAttribute("userRequest", "jobs");
		model.addAttribute("heading", "All Jobs");
		return "studentSideProfile";
	}
	
//	add new job post
	@PostMapping(consumes = "application/x-www-form-urlencoded")
	public String saveJobDetails(JobDetails jobDetails) {
//		System.out.println("jobDetails"+jobDetails);		
		jobDetailsServiceImpl.saveJobDetails(jobDetails);
		return "redirect:/jobdetail";
	}
	
//	update job post
	@GetMapping("/edit/{id}")
	public String editJobDetails(@PathVariable int id, Model model) {
//		System.out.println("id : "+ id);
		model.addAttribute("jobDetail", jobDetailsServiceImpl.getJobDetailsById(id));
		return "editJobPost";
	}
	
	@PostMapping(value = "{id}", consumes = "application/x-www-form-urlencoded")
	public String updateJobDetails(@PathVariable int id, JobDetails jobDetails) {
//		System.out.println("update : "+ studentLoginInfo);
		jobDetailsServiceImpl.updateJobDetails(jobDetails);
		return "redirect:/jobdetail";
	}
	
//	delete job post
	@GetMapping("{id}")
	public String deleteJobDetails(@PathVariable int id) {
//		System.out.println("delete : "+id);
		jobDetailsServiceImpl.deleteJobDetailsById(id);;
		return "redirect:/jobdetail";
	}


	//	display single job details
	@GetMapping("/details/{id}")
	public String getJobDetails(@PathVariable int id, Model model) {
    JobDetails singleJob = jobDetailsServiceImpl.getJobDetailsById(id);
		model.addAttribute("singleJob",singleJob);
		return "singleJobDetail";
	}

	// search job by fields
	@PostMapping(value = "/fields", consumes = "application/x-www-form-urlencoded")
	public String searchJobByField(String technology, String location, String experience, Model model){
//		System.out.println(technology + location + experience);
		if(technology.length() == 0) {
			technology = "zzz";
		}
		if(location.length() == 0) {
			location = "zzz";
		};
		if(experience.length() == 0) {
			experience = "zzz";
		};
		model.addAttribute("jobDetails", jobDetailsServiceImpl.findJobByFields(technology, location, experience));
		model.addAttribute("userRequest", "jobs");
		model.addAttribute("heading", "All Jobs");
		return "studentSideProfile";
	}
	
//	search job by technology
	@GetMapping("/tech/{tech}")
	public String searchByTech(@PathVariable String tech, Model model) {
		model.addAttribute("jobDetails", jobDetailsServiceImpl.findJobByTechnology(tech));
		model.addAttribute("userRequest", "jobs");
		model.addAttribute("heading", "All Jobs");
		return "studentSideProfile";
	}
	
//	search job by location
	@GetMapping("/location/{location}")
	public String searchByLocation(@PathVariable String location, Model model) {
		model.addAttribute("jobDetails", jobDetailsServiceImpl.findJobByLocation(location));
		model.addAttribute("userRequest", "jobs");
		model.addAttribute("heading", "All Jobs");
		return "studentSideProfile";
	}
	
//	apply for job
	@GetMapping("/apply/{jobId}")
	public String applyForJob(@PathVariable int jobId, Model model, HttpSession session) {		
		StudentLoginInfo student = (StudentLoginInfo) session.getAttribute("loginStudent");
		JobDetails job = jobDetailsServiceImpl.getJobDetailsById(jobId);
		
		if(!(student.getStudentData().getJobsApplied().contains(job))) {
			student.getStudentData().getJobsApplied().add(job);					
			studentLoginInfoServiceImpl.saveStudentLoginInfo(student);
		}
		
		model.addAttribute("singleJob",job);
		model.addAttribute("notificationMsg","Successfully applied!!");
		return "singleJobDetail";
	}
	
	
//	show applied jobs of student
	@GetMapping("/applied/{id}")
	public String showAppliedJobs(@PathVariable int id, Model model) throws Exception {
		
		StudentLoginInfo student = studentLoginInfoServiceImpl.getStudentLoginInfoById(id);
		if(student.getStudentData() == null){
			throw new Exception("Complete your profile to see applied job.");
		};
		List<JobDetails> appliedJobs = student.getStudentData().getJobsApplied();
		
		model.addAttribute("jobDetails", appliedJobs);
		model.addAttribute("userRequest", "jobs");
		model.addAttribute("appliedJobs", true);
		model.addAttribute("heading", "Applied Jobs");
		return "studentSideProfile";
	}

	
//	display my job details
	@GetMapping("/myjobs/{id}")
	public String getMyJobDetails(@PathVariable int id, Model model) {
    JobDetails singleJob = jobDetailsServiceImpl.getJobDetailsById(id);
		model.addAttribute("singleJob",singleJob);
		model.addAttribute("jobType","Applied Jobs");
		
		return "singleJobDetail";
	}

//	save student jobs
	@GetMapping("/jobsave/{jobId}")
	public String saveStudentLikeJobs(@PathVariable int jobId, @RequestParam boolean saved, Model model, HttpSession session) {
		StudentLoginInfo student = (StudentLoginInfo) session.getAttribute("loginStudent");
		JobDetails job = jobDetailsServiceImpl.getJobDetailsById(jobId);
		if(saved) {
			student.getStudentData().getJobsSaved().remove(job);
			model.addAttribute("notificationMsg", "job removed from favorite.");
		}else {
			student.getStudentData().getJobsSaved().add(job);
			model.addAttribute("notificationMsg", "job added into favorite.");
		}	
		studentLoginInfoServiceImpl.saveStudentLoginInfo(student);
		
		model.addAttribute("jobDetails", student.getStudentData().getJobsSaved());
		model.addAttribute("userRequest", "jobs");
		model.addAttribute("heading", "Saved Jobs");
		return "studentSideProfile";
	}
	
//	show saved jobs
	@GetMapping("/saved/{id}")
	public String showSavedJobs(@PathVariable int id, Model model) throws Exception {
		StudentLoginInfo student = studentLoginInfoServiceImpl.getStudentLoginInfoById(id);
		if(student.getStudentData() == null){
			throw new Exception("Complete your profile to see saved job.");
		};
		model.addAttribute("jobDetails", student.getStudentData().getJobsSaved());
		model.addAttribute("userRequest", "jobs");
		model.addAttribute("heading", "Saved Jobs");
		return "studentSideProfile";
	}
}
