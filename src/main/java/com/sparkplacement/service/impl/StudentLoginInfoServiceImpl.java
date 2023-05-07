package com.sparkplacement.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sparkplacement.model.StudentLoginInfo;
import com.sparkplacement.repository.StudentLoginInfoRepository;
import com.sparkplacement.service.StudentLoginInfoService;

@Service
public class StudentLoginInfoServiceImpl implements StudentLoginInfoService {

	@Autowired
	private StudentLoginInfoRepository studentLoginInfoRepository;

	@Override
	public StudentLoginInfo saveStudentLoginInfo(StudentLoginInfo studentLoginInfo) {
		return studentLoginInfoRepository.save(studentLoginInfo);
	}

	@Override
	public List<StudentLoginInfo> getAllStudentLoginInfo() {
		return studentLoginInfoRepository.findAll();
	}

	@Override
	public StudentLoginInfo getStudentLoginInfoById(int id) {
		return studentLoginInfoRepository.findById(id).get();
	}

	@Override
	public StudentLoginInfo updateStudentLoginInfoById(StudentLoginInfo studentLoginInfo) {
		return studentLoginInfoRepository.save(studentLoginInfo);
	}

	@Override
	public void deleteStudentLoginInfoById(int id) {
		studentLoginInfoRepository.deleteById(id);
	}

}
