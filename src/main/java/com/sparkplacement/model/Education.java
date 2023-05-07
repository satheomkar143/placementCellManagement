package com.sparkplacement.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Education {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String college;
	private String degree;
	private String field;
	private int passout;
	private float mark;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public int getPassout() {
		return passout;
	}

	public void setPassout(int passout) {
		this.passout = passout;
	}

	public float getMark() {
		return mark;
	}

	public void setMark(float mark) {
		this.mark = mark;
	}

	@Override
	public String toString() {
		return "Education [id=" + id + ", college=" + college + ", degree=" + degree + ", field=" + field + ", passout="
				+ passout + ", mark=" + mark + "]";
	}

}
