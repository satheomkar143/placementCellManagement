package com.sparkplacement.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "students_data")
public class StudentData {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String firstName;
	private String lastName;
	private String mobile;
	private String course;
	private String address;

	@Column(length = 500)
	private String about;

	@Column(length = 500)
	private String photo;

	@Column(length = 500)
	private String backPhoto;

	@OneToMany(cascade = CascadeType.ALL)
	private List<Education> education = new ArrayList<>();

	@ElementCollection
	private List<String> skills = new ArrayList<>();

	@OneToMany 
	private List<JobDetails> jobsApplied = new ArrayList<>();

	@OneToMany
	private List<JobDetails> jobsSaved = new ArrayList<>();

	@OneToMany(cascade = CascadeType.ALL)
	private List<Post> myPost = new ArrayList<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public List<Education> getEducation() {
		return education;
	}

	public void setEducation(List<Education> education) {
		this.education = education;
	}

	public List<String> getSkills() {
		return skills;
	}

	public void setSkills(List<String> skills) {
		this.skills = skills;
	}

	public List<JobDetails> getJobsApplied() {
		return jobsApplied;
	}

	public void setJobsApplied(List<JobDetails> jobsApplied) {
		this.jobsApplied = jobsApplied;
	}



	public List<JobDetails> getJobsSaved() {
		return jobsSaved;
	}

	public void setJobsSaved(List<JobDetails> jobsSaved) {
		this.jobsSaved = jobsSaved;
	}

	public List<Post> getMyPost() {
		return myPost;
	}

	public void setMyPost(List<Post> myPost) {
		this.myPost = myPost;
	}

	public String getBackPhoto() {
		return backPhoto;
	}

	public void setBackPhoto(String backPhoto) {
		this.backPhoto = backPhoto;
	}

	@Override
	public String toString() {
		return "StudentData [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", mobile=" + mobile
				+ ", course=" + course + ", address=" + address + ", about=" + about + ", photo=" + photo
				+ ", backPhoto=" + backPhoto + ", education=" + education + ", skills=" + skills + ", jobsApplied="
				+ jobsApplied + ", jobsSaved=" + jobsSaved + "]";
	}

	

}
