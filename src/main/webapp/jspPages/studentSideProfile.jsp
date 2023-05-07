<%@page import="com.sparkplacement.model.StudentLoginInfo"%>
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

<title>Spark placement management</title>
</head>
<body>

	

	<%@ include file="navbar.jsp" %>
	
	<main id="mainSideProfile">
 	<!-- student data : ${loginStudent}  -->
	
	<% StudentLoginInfo loginStudent = (StudentLoginInfo) session.getAttribute("loginStudent") ;%>
<%-- 	<%= loginStudent %> --%>



	<div class="card"  id="sideProfileDiv">
			
		<%	if(loginStudent.getStudentData() != null && loginStudent.getStudentData().getBackPhoto() != null){  %>
			
			<img src="${loginStudent.getStudentData().getBackPhoto()}" class="card-img-top"
				alt="background image" height="120px">
			
		<%	}else{ %>
			
			<img src="/public/images/back.jpg" class="card-img-top"
			alt="background image" height="120px">
			
		<% }; %>	
			
			
		<div class="card-body text-center mt-5 " style="padding-bottom: 0px">
			<h5 class="card-title ">${loginStudent.getStudentData().getFirstName()} ${loginStudent.getStudentData().getLastName()}</h5>
			<p style="margin-bottom: 0px;">${loginStudent.getStudentData().getCourse()}</p>
		</div>
		<hr>
		<div class="ps-3">
			<p> <i class="fa-solid fa-envelope"></i> ${loginStudent.getEmail()}</p>
			<p> <i class="fa-solid fa-phone"></i> ${loginStudent.getStudentData().getMobile()}</p>
			<p style="margin-bottom: 0px;"> <i class="fa-solid fa-location-dot"></i> ${loginStudent.getStudentData().getAddress()}</p>
		</div>
		<hr>
		<div class="ps-3">
			<p> <i class="fa-solid fa-heart"></i> <a href="/jobdetail/saved/${loginStudent.getId()}">Saved Jobs</a> </p><div class="count countSaved">${loginStudent.getStudentData().getJobsSaved().size()}</div>
			<p> <i class="fa-solid fa-square-plus"></i><a href="/jobdetail/applied/${loginStudent.getId()}"> Applied Jobs</a></p><div class="count countApplied">${loginStudent.getStudentData().getJobsApplied().size()}</div>
			<p> <i class="fa-solid fa-cannabis"></i> <a href="/post/mypost/${loginStudent.getId()}">My Posts</a></p><div class="count countPost">${loginStudent.getStudentData().getMyPost().size()}</div>
		</div>
		
		<%	if(loginStudent.getStudentData() != null && loginStudent.getStudentData().getPhoto() != null){  %>
			
			<img src="${loginStudent.getStudentData().getPhoto()}" alt="id image" id="sideProfileImg">
			
		<%	}else{ %>
			
			<img src="/public/images/userProfile.png" alt="id image" id="sideProfileImg">
			
		<% }; %>	
		
	</div>


	<%
		String userRequest = (String) request.getAttribute("userRequest");
		if(userRequest != null){
		if(userRequest.equals("posts")){		
 	%> 
		
		 <%@ include file="displayPosts.jsp" %> 		
	
 	<%				  
		}; };
	%> 
	
	
	<%
		if(userRequest != null){

		if(userRequest.equals("jobs")){		
 	%> 
<%-- 		${jobDetails} --%>
		<%@ include file="displayJobs.jsp" %>
	
	<%				
		};};
 	%>
	
	


</main>











	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>



</body>
</html>
