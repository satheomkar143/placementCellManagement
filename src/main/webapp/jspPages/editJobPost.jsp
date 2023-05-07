<%@page import="com.sparkplacement.model.JobDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

update post

<form action="/jobdetail/${jobDetail.getId()}" method="post">
		jobPosition<input type="text" name="position" value="${jobDetail.getPosition()}"><br>
		jobType<input type="text" name="jobType" value="${jobDetail.getJobType()}"><br>
		salary<input type="text" name="salary" value="${jobDetail.getSalary()}"><br>
		education<input type="text" name="education" value="${jobDetail.getEducation()}"><br>
		company<input type="text" name="company" value="${jobDetail.getCompany()}"><br>
		location<input type="text" name="location" value="${jobDetail.getLocation()}"><br>
		vacancies<input type="text" name="vacancies" value="${jobDetail.getVacancies()}"><br>
		jobSummery<textarea rows="10" cols="10" name="jobSummery">${jobDetail.getJobSummery()}</textarea>
		
		
		keySkills
		<div id="skills">
			<a onclick="addSkills()">add new skill</a>
			
			<%
				JobDetails jobDetail = (JobDetails) request.getAttribute("jobDetail");
						
			for (String skills : jobDetail.getKeySkills()) {
			%>
			
			<input type="text" name="keySkills" value="<%= skills%>"><br>			
				
		<% }; %>
		</div>
		
		
		responsibility
		<div id="resp">
			<a onclick="addResp()">add new responsibility</a>
			
			
			<%						
			for (String resp : jobDetail.getResponsibility()) {
			%>
			
			<input type="text" name="responsibility" value="<%= resp%>"><br>			
				
		<% }; %>

		</div>
		<input type="submit">
	</form>


<script type="text/javascript">
		
		let skillDiv = document.getElementById("skills");
		let skillResp = document.getElementById("resp");

		addSkills = ()=>{
			let newInput = document.createElement("input");
			newInput.type = "text";
			newInput.name = "keySkills";
			
			skillDiv.appendChild(newInput);

		}
		
		addResp = ()=>{
			let newInput = document.createElement("input");
			newInput.type = "text";
			newInput.name = "responsibility";
			
			skillResp.appendChild(newInput);
		}
	
	</script>

</body>
</html>