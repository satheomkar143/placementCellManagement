<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sparkplacement.model.JobDetails"%>
<%@page import="java.util.List"%>
<link rel="stylesheet" href="/public/css/displayJobs.css" />

<div id="displayJobsDiv">
  <div id="jobs">
    <div id="jobSearchHead">
      <h4>${heading}</h4>
    </div>


    <%
      List<JobDetails> jobDetails = (List<JobDetails>) request.getAttribute("jobDetails");
  		Collections.reverse(jobDetails);
		session.setAttribute("jobDetails", jobDetails);
    	
      if(jobDetails != null) {
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
        
        <% if(loginStudent.getStudentData() != null && (loginStudent.getStudentData().getJobsApplied()).contains(job)){ %>
    		<a href="/jobdetail/myjobs/<%=job.getId()%>">View Details</a> 
    	<% }else{ %>	
    		<a href="/jobdetail/details/<%=job.getId()%>">Apply Now</a>    	
    	<% }; %>
      </div>
      
      <% if(loginStudent.getStudentData() != null && (loginStudent.getStudentData().getJobsSaved()).contains(job)){  %>
      	<a href="/jobdetail/jobsave/<%=job.getId()%>?saved=true"><i class="fa-solid fa-heart"></i></a>
      <% }else{ %>
      	<a href="/jobdetail/jobsave/<%=job.getId()%>?saved=false"><i class="fa-solid fa-heart" style="color: gray;"></i> </a>   
      <%}; %>
      
    </div>
    	
    <%};
	//session.setAttribute("jobDetails", jobs);
      }; %>


    
  </div>
  <div class="filters text-center">
    <h4>Quick Search</h4>
    <hr>
    <h5>technologies</h5>
    <p><a href="/jobdetail/tech/angular">Angular</a></p>
    <p><a href="/jobdetail/tech/react">React</a></p>
    <p><a href="/jobdetail/tech/node">Node JS</a></p>
    <p><a href="/jobdetail/tech/html">HTML CSS</a></p>
    <p><a href="/jobdetail/tech/testing">Testing</a></p>
    <p><a href="/jobdetail/tech/java">Java Developer</a></p>
    <p><a href="/jobdetail/tech/python">Python </a></p>
    <p><a href="/jobdetail/tech/c">c, c++</a></p>
    <p><a href="/jobdetail/tech/android">Android</a></p>
    <hr>
    <h5>Location</h5>
	<p><a href="/jobdetail/location/pune">Pune</a></p>
    <p><a href="/jobdetail/location/mumbai">Mumbai</a></p>
    <p><a href="/jobdetail/location/bangalore">Bangalore</a></p>
  </div>
</div>
