package com.sparkplacement.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sparkplacement.helper.FileUploadHelper;
import com.sparkplacement.model.StudentLoginInfo;
import com.sparkplacement.service.impl.StudentLoginInfoServiceImpl;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/file")
public class FileUploadController {
	
	@Autowired
	private FileUploadHelper fileUploadHelper;
	
	@Autowired
	private StudentLoginInfoServiceImpl studentLoginInfoServiceImpl;
	
  @PostMapping("/upload/{subfolder}/{id}")
  public String uploadFile( MultipartFile file, @PathVariable String subfolder, @PathVariable int id) throws IOException{
//    System.out.println("in upload");
//    System.out.println(file.getName());
//    System.out.println(file.getOriginalFilename());
//    System.out.println(file.getSize());
//    System.out.println(file.getContentType());
//    System.out.println(file.isEmpty());
	  
	  
	  String imageName = fileUploadHelper.uploadImage(subfolder, id, file);
	  
	 System.out.println("imggg: "+imageName);
	 fileUploadHelper.getResource(subfolder, imageName);
	  
	  return null;
  }
  
  @PostMapping("/profilePhoto/{id}")
  public String changeProfile( MultipartFile profilePhoto, @PathVariable int id, Model model, HttpSession session) throws Exception {
	  StudentLoginInfo student = studentLoginInfoServiceImpl.getStudentLoginInfoById(id);
		if(student.getStudentData() == null){
			throw new Exception("Complete your profile first.");
		};

	  String imageName = fileUploadHelper.uploadImage("profile", id, profilePhoto);
	  String imagePath = fileUploadHelper.getResource("profile", imageName);
	  
	  
	  student.getStudentData().setPhoto(imagePath);
	  
//	  System.out.println(student);
	  
	  studentLoginInfoServiceImpl.saveStudentLoginInfo(student);
		model.addAttribute("loginStudent", student);
		session.setAttribute("loginStudent", student);
		model.addAttribute("notificationMsg","profile photo updated successfully.");

	  return "studentProfile";
  }
  
  @PostMapping("/backPhoto/{id}")
  public String changeProfileBack( MultipartFile profilePhotoBack, @PathVariable int id, Model model, HttpSession session) throws Exception {
	  StudentLoginInfo student = studentLoginInfoServiceImpl.getStudentLoginInfoById(id);
		if(student.getStudentData() == null){
			throw new Exception("Complete your profile first.");
		};
		
	  String imageName = fileUploadHelper.uploadImage("profileBack", id, profilePhotoBack);
	  String imagePath = fileUploadHelper.getResource("profileBack", imageName);
	  
	  
	  student.getStudentData().setBackPhoto(imagePath);
	  
	  System.out.println(student);
	  
	  studentLoginInfoServiceImpl.saveStudentLoginInfo(student);
	  model.addAttribute("loginStudent", student);
	  session.setAttribute("loginStudent", student);
	  model.addAttribute("notificationMsg","Background photo updated successfully.");
	  return "studentProfile";
  }
  
  
}
