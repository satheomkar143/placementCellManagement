<%@page import="com.sparkplacement.model.StudentLoginInfo"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.sparkplacement.model.JobDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

	<link rel="stylesheet" href="/public/css/studentSideProfile.css">
  <link rel="stylesheet" href="/public/css/style.css">
  <link rel="stylesheet" href="/public/css/singleJobDetail.css">


<title>Insert title here</title>
</head>
<body>

  <%@ include file="./navbar.jsp" %>

  <div id="mainSingleJObDiv">
    <div id="jobs">
      
      
        <%
      List<JobDetails> jobDetails = (List<JobDetails>) session.getAttribute("jobDetails");
        StudentLoginInfo loginStudent = (StudentLoginInfo) session.getAttribute("loginStudent");
        JobDetails singleJob =(JobDetails) request.getAttribute("singleJob");

        String jobType = (String) request.getAttribute("jobType"); %>
        
      <div id="jobSearchHead">
     	 <% if(jobType == null){ %>     
        	<h4>Jobs based on your search</h4>
        <%}else{ %>
       		<h4>${jobType}</h4>
        <%}; %>
      </div>

    <%  if(jobDetails != null) {
    	for (JobDetails job : jobDetails) {
 	   %>

    <div class="endividualJob">
      <div class="companyLogo">
        <%	if(job.getImage() != null){  %>	
  	  	  <img src="<%= job.getImage()%>" alt="company image" >
		<%	}else{ %>
        <img src="/public/images/job.jpeg" alt="company image" />			
		<% }; %>
      </div>
      <div class="jobInfo">
        <h3><%=job.getPosition()%></h3>
        <h4><%=job.getCompany()%></h4>
        <h5><%=job.getLocation()%></h5>
        <h6><%=job.getDate()%></h6>
        
        <% if(loginStudent.getStudentData().getJobsApplied().contains(job)){ %>     
        	<a href="/jobdetail/myjobs/<%=job.getId()%>">View Details</a>
        <%}else{ %>
        	<a href="/jobdetail/details/<%=job.getId()%>">Apply Now</a>
        <%}; %>
        
      </div>
	 <% if((loginStudent.getStudentData().getJobsSaved()).contains(job)){  %>
      	<a class="likeDiv"  href="/jobdetail/jobsave/<%=job.getId()%>?saved=true"><i class="fa-solid fa-heart"></i></a>
      <% }else{ %>
      	<a class="likeDiv" href="/jobdetail/jobsave/<%=job.getId()%>?saved=false"><i class="fa-solid fa-heart" style="color: gray;"></i> </a>   
      <%}; %>    
    </div>

    <% };
      }; %>
     
    </div>
    <div id="singleJobDescription">

      <div class="jobHeading">
        <h4>${singleJob.getPosition()}</h4>
        <h5>${singleJob.getCompany()}</h5>
        <p>${singleJob.getLocation()}</p>
        <p>₹${singleJob.getSalary()}</p>
        <p>${singleJob.getDate()}</p>
          <%	if(singleJob.getImage() != null){  %>	
  	  	  <img src="<%= singleJob.getImage()%>" alt="company image" id="imgInHeader">
		<%	}else{ %>
        <img src="/public/images/job.jpeg" alt="company image" id="imgInHeader"/>			
		<% }; %>
     </div>
      
      <%
      if(!loginStudent.getStudentData().getJobsApplied().contains(singleJob)){ %>       
	      <div class="applyNow">
	        <button><a href="/jobdetail/apply/${singleJob.getId()}">Apply Now</a></button>
	        <!-- <i class="fa-solid fa-bookmark"></i> -->
	      </div>
      <%}; %>
      
      <div class="jobDetails">
        <h5>Job Details</h5>
        <p class="subHeading">Salary</p>
        <p>₹${singleJob.getSalary()}</p>
        <p class="subHeading">Job Type</p>
        <p>${singleJob.getJobType()}</p>
        <p class="subHeading">Vacancies</p>
        <p>${singleJob.getVacancies()}</p>
        <h5>Education</h5>
        <p>${singleJob.getEducation()}</p>
        <h5>Full Job Description</h5>
        <p>${singleJob.getJobSummery()}</p>

        <%
        	List<String> skills = singleJob.getKeySkills();
        	List<String> respnosibility = singleJob.getResponsibility();
        %>
        
        
        <h5>Skills</h5>
        
        <ul>
        <% for(String skill : skills){  %>    
          <li><%= skill %></li>
        <%}; %>
        </ul>
        
          <h5>responsibility</h5>
          <ul>
        <%  for(String resp : respnosibility){  %>    
          <li><%= resp %></li>
        <%}; %>
          </ul>
      </div>
    </div>
  </div>






	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>



</body>
</html>