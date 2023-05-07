package com.sparkplacement.service;

import java.util.List;

import com.sparkplacement.model.StudentLoginInfo;

public interface StudentLoginInfoService {

//	get all student login info
	List<StudentLoginInfo> getAllStudentLoginInfo();

//	save new student login info
	StudentLoginInfo saveStudentLoginInfo(StudentLoginInfo studentLoginInfo);

//	get student login info by id
	StudentLoginInfo getStudentLoginInfoById(int id);

//	update student login info
	StudentLoginInfo updateStudentLoginInfoById(StudentLoginInfo studentLoginInfo);

//	delete student login info
	void deleteStudentLoginInfoById(int id);

}
