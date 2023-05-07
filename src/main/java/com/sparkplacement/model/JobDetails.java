package com.sparkplacement.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "job_details")
public class JobDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	private String jobType;
	private String salary;
	private String education;
	private String vacancies;
	private String location;
	private String company;
	private String position;
	private Date date = new Date();
	
	@Column(length = 500)
	private String image;

	@Column(length = 1000)
	private String jobSummery;

	@ElementCollection
	private List<String> keySkills = new ArrayList<>();

	@ElementCollection
	private List<String> responsibility = new ArrayList<>();

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getJobSummery() {
		return jobSummery;
	}

	public void setJobSummery(String jobSummery) {
		this.jobSummery = jobSummery;
	}

	public List<String> getKeySkills() {
		return keySkills;
	}

	public void setKeySkills(List<String> keySkills) {
		this.keySkills = keySkills;
	}

	public String getVacancies() {
		return vacancies;
	}

	public void setVacancies(String vacancies) {
		this.vacancies = vacancies;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public List<String> getResponsibility() {
		return responsibility;
	}

	public void setResponsibility(List<String> responsibility) {
		this.responsibility = responsibility;
	}

	public Date getDate() {
		return date;
	}

	

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "JobDetails [id=" + id + ", jobType=" + jobType + ", salary=" + salary + ", education=" + education
				+ ", vacancies=" + vacancies + ", location=" + location + ", company=" + company + ", position=" + position
				+ ", date=" + date + ", jobSummery=" + jobSummery + ", keySkills=" + keySkills + ", responsibility="
				+ responsibility + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(company, date, education, id, jobSummery, jobType, keySkills, location, position,
				responsibility, salary, vacancies);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		JobDetails other = (JobDetails) obj;
		return id == other.id;
				
	}
	
	

}
