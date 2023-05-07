package com.sparkplacement.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sparkplacement.helper.FileUploadHelper;
import com.sparkplacement.model.Post;
import com.sparkplacement.model.StudentLoginInfo;
import com.sparkplacement.repository.PostRepository;
import com.sparkplacement.service.impl.PostServiceImpl;
import com.sparkplacement.service.impl.StudentLoginInfoServiceImpl;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private StudentLoginInfoServiceImpl studentLoginInfoServiceImpl;
	
	@Autowired
	private FileUploadHelper fileUploadHelper;
	
	@Autowired
	private PostServiceImpl postServiceImpl;
		
	@PostMapping("/new/{studId}")
	public String saveNewPost(@RequestParam MultipartFile postImage, Post post , @PathVariable int studId, Model model, HttpSession session) throws Exception {		
		StudentLoginInfo student = studentLoginInfoServiceImpl.getStudentLoginInfoById(studId);		
		if(student.getStudentData() == null){
			throw new Exception("Post cannot be added. First complete your profile.");
		};
		
		String subFolder = "post";
		String imageName = fileUploadHelper.uploadImage(subFolder, studId, postImage);
		String savePostImage = fileUploadHelper.getResource(subFolder, imageName);
		
		post.setImage(savePostImage);
		
		student.getStudentData().getMyPost().add(post);
		
//		System.out.println(student);
//		System.out.println(post);
		
		
		studentLoginInfoServiceImpl.saveStudentLoginInfo(student);
		
		Post updatePost = postServiceImpl.findByImageName(savePostImage);
		
		updatePost.setStudentInfo(student);
		
		postServiceImpl.savePost(updatePost);
		
		session.setAttribute("loginStudent", student);
		model.addAttribute("allPost" , postServiceImpl.getAllPost() );
		model.addAttribute("userRequest", "posts");
		model.addAttribute("notificationMsg", "Post created successfully.");
		return "studentSideProfile";
	}
	
	
	@GetMapping("/mypost/{id}")
	public String showMyPost(@PathVariable int id, Model model) throws Exception {
		StudentLoginInfo student = studentLoginInfoServiceImpl.getStudentLoginInfoById(id);
		if(student.getStudentData() == null){
			throw new Exception("Complete your profile to see your post.");
		};
		List<Post> allPost = student.getStudentData().getMyPost();
		model.addAttribute("allPost" , allPost );
		model.addAttribute("userRequest", "posts");
		return "studentSideProfile";
	}
	
}
