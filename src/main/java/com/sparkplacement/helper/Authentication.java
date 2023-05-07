package com.sparkplacement.helper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sparkplacement.model.StudentLoginInfo;

import jakarta.servlet.http.HttpSession;

@Component
public class Authentication {
	
	@Autowired
	private HttpSession httpSession;
	
	public boolean isLoggedIn() {
		StudentLoginInfo student =  (StudentLoginInfo) httpSession.getAttribute("loginStudent");
		
		if (student != null) {
			return true;
		}else {
			return false;
		}
	}
}
