package com.sparkplacement.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "all_post")
public class Post {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;
	private boolean active=false;

	@Column(length = 500)
	private String description;

	@Column(length = 500)
	private String image;
	
	private Date date = new Date();
	
	@ManyToOne
	private StudentLoginInfo studentInfo;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Date getDate() {
		return date;
	}

	

	public StudentLoginInfo getStudentInfo() {
		return studentInfo;
	}

	public void setStudentInfo(StudentLoginInfo studentInfo) {
		this.studentInfo = studentInfo;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", title=" + title + ", active=" + active + ", description=" + description
				+ ", image=" + image + ", date=" + date + ", studentInfo=" + studentInfo + "]";
	}

}
