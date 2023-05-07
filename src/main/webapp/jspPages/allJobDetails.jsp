<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@page import="java.util.List"%>
	<%@page import="com.sparkplacement.model.JobDetails"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	all job details

	<h1>
		<a href="/addNewJob.html">Add new job</a>
	</h1>


	<%
	List<JobDetails> jobDetails = (List<JobDetails>) request.getAttribute("jobDetails");

	if(jobDetails != null) {
	for (JobDetails job : jobDetails) {
	%>

	<h1>	
		<%=job.getId()%>
		<%=job.getCompany()%>
		<%=job.getEducation()%>
	
		<%=job.getJobType()%>
		<%=job.getLocation()%>
		<%=job.getSalary()%>
		<%=job.getVacancies()%>	
		<%=job.getResponsibility()%>	
	</h1>
	<h2>	<%=job.getJobSummery()%></h2>
	
	<h3>
			<%
			for (String skills : job.getKeySkills()) {
			%>
			
			<%=skills + "-----"%>
			
		<% }; %>
	
	</h3>
	
	
	<%=job.getDate()%>
	
	
	<a href="/jobdetail/edit/<%=job.getId()%>">update</a>
	<a href="/jobdetail/<%=job.getId()%>">delete</a>

<% };
 }; %>


</body>
</html>