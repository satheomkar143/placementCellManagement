package com.sparkplacement.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "student_login")
public class StudentLoginInfo {

	@Id
	private int id;

	@Column(nullable = false)
	private String email;

	@Column(nullable = false)
	private String password;

	private boolean active = false;

	@OneToOne(cascade = CascadeType.ALL)
	private StudentData studentData;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public StudentData getStudentData() {
		return studentData;
	}

	public void setStudentData(StudentData studentData) {
		this.studentData = studentData;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	@Override
	public String toString() {
		return "StudentLoginInfo [id=" + id + ", email=" + email + ", password=" + password + ", active=" + active
				+ ", studentData=" + studentData + "]";
	}



}
