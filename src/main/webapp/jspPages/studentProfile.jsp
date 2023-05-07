<%@page import="java.util.ArrayList"%>
<%@page import="com.sparkplacement.model.Education"%>
<%@page import="java.util.List"%>
<%@page import="com.sparkplacement.model.StudentLoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
      crossorigin="anonymous"
    />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <link rel="stylesheet" href="/public/css/studentProfile.css" />
    <link rel="stylesheet" href="/public/css/style.css" />

    <title>Insert title here</title>
  </head>
  <body>
    <%@ include file="./navbar.jsp" %>

    <!-- ${loginStudent} -->
    	<% StudentLoginInfo loginStudent = (StudentLoginInfo) session.getAttribute("loginStudent") ;%>
    

    <div class="profileContainer">      
      <div class="infoAndThought">
        <div class="infoDiv">
        <div class="subMainDiv">
        
	        <%	if(loginStudent.getStudentData() != null && loginStudent.getStudentData().getPhoto() != null){  %>
				
	 		     <img src="${loginStudent.getStudentData().getPhoto()}" alt="" class="profilePhoto" />
				
			<%	}else{ %>
				
	   		   <img src="/public/images/userProfile.png" alt="" class="profilePhoto" />
				
			<% }; %>	
        
		    <i class="fa-solid fa-user-pen editProfile " data-bs-toggle="modal" data-bs-target="#saveStudentProfile"></i>
		    
		    <i class="fa-solid fa-pen-to-square changeProfilePhoto" data-bs-toggle="modal" data-bs-target="#changeProfilePhotoModal"></i>
		        
		   	<i class="fa-solid fa-pen-to-square changeBackPhoto" data-bs-toggle="modal" data-bs-target="#changeBackPhotoModal"></i>
		          
          <%	if(loginStudent.getStudentData() != null && loginStudent.getStudentData().getBackPhoto() != null){  %>
			
          <img src="${loginStudent.getStudentData().getBackPhoto()}" alt="" class="backImage" />
			
		<%	}else{ %>
			
          <img src="/public/images/back.jpg" alt="" class="backImage" />
	
		<% }; %>	
          
          
          <div class="personalInfo">
            <div class="personalInfoDiv">
              <h3>${loginStudent.getStudentData().getFirstName()} ${loginStudent.getStudentData().getLastName()}</h3>
              <p>${loginStudent.getStudentData().getCourse()}</p>
              <p>${loginStudent.getEmail()}</p>
              <p>${loginStudent.getStudentData().getMobile()}</p>
              <p>student Id : ${loginStudent.getId()}</p>
              <p>${loginStudent.getStudentData().getAddress()}</p>
            </div>
            <div class="sideTabs">
              <!-- <h4>My Posts</h4>
              <h4>Applied Jobs</h4>
              <h4>Saved Jobs</h4> -->
              
                <p> <i class="fa-solid fa-heart"></i> <a href="/jobdetail/saved/${loginStudent.getId()}">Saved Jobs</a> </p><div class="count countSaved">${loginStudent.getStudentData().getJobsSaved().size()}</div>
                <p> <i class="fa-solid fa-square-plus"></i><a href="/jobdetail/applied/${loginStudent.getId()}"> Applied Jobs</a></p><div class="count countApplied">${loginStudent.getStudentData().getJobsApplied().size()}</div>
                <p> <i class="fa-solid fa-cannabis"></i> <a href="/post/mypost/${loginStudent.getId()}">My Posts</a></p><div class="count countPost">${loginStudent.getStudentData().getMyPost().size()}</div>
              
            </div>
          </div>
        </div>
        <div class="subMainDiv sidePadding">
          <h3>About</h3>
          <p>
            ${loginStudent.getStudentData().getAbout()}
          </p>
        </div>
        
        	<%
        		StudentLoginInfo studInfo = (StudentLoginInfo) request.getAttribute("loginStudent");
        		
            List<Education> studEducation = new ArrayList<>();
              List<String> studSkills = new ArrayList<>();

            if(studInfo.getStudentData() != null){
              studEducation = studInfo.getStudentData().getEducation();
              
              studSkills = studInfo.getStudentData().getSkills();
            }

        		
        	
        	%> 
       	
        	
        	
        <div class="subMainDiv sidePadding removeMargin">
        	<h3>Education</h3>
        	
			<%

        	for (Education education : studEducation) { %> 
        	        		        		
	        	<h6><%= education.getCollege() %></h6>
	        	<p><%= education.getDegree() %> <%= education.getField() %></p>
	            <p><%= education.getPassout() %></p>
	            <p><%= education.getMark() %></p>
	            <hr />    
	              		        		
      		<%	}; %>

        </div>
        <div class="subMainDiv sidePadding removeMargin">
          <h3>Skills</h3>
          
			<% for (String skill : studSkills) { %>
			    <p><%= skill %></p>
			    <hr>
			<% } %>

<!--           <p>java</p> -->
<!--           <hr /> -->
          
        </div>
      </div>
<!--       <div class="thought"> -->
<!--         <h3>Today's Thought</h3> -->
<!--         'Good thoughts make a happy person'. 'If you have a dream, never let go of it, chase it till the end'. 'Make yourself your own competition, strive to be better than yesterday, and you'll find the true essence of life!' 'You are smarter, braver, and much stronger than you think'. -->
<!--       </div> -->
      </div>
    </div>




<!-- Scrollable modal for save student info-->

<!-- Modal add student data-->
<div class="modal fade" id="saveStudentProfile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Profile</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="/student/${loginStudent.getId()}" method="post" id="profileForm">


        <h4>Basic Info</h4>
        <div class="idAndEmail profileFlexDiv">
          <div>
            <p class="editDataTagP">Student Id</p>
            <input class="editDataInput" type="text" name="id" readonly value="${loginStudent.getId()}">
          </div>
          <div>
            <p class="editDataTagP">Email</p>
            <input class="editDataInput" type="text" name="email" value="${loginStudent.getEmail()}">
          </div>
        </div>
        <div class="nameDiv profileFlexDiv">
          <div>
            <p class="editDataTagP">First Name</p>
            <input class="editDataInput" type="text" name="studentData.firstName" value="${loginStudent.getStudentData().getFirstName()}">
          </div>
          <div>
            <p class="editDataTagP">Last Name</p>
            <input class="editDataInput" type="text" name="studentData.lastName" value="${loginStudent.getStudentData().getLastName()}">
          </div>
        </div>
        <div class="mobileAndCourse profileFlexDiv">
          <div>
            <p class="editDataTagP">Mobile</p>
            <input class="editDataInput" type="text" name="studentData.mobile" value="${loginStudent.getStudentData().getMobile()}">
          </div>
          <div>
            <p class="editDataTagP">Course</p>
            <input class="editDataInput" type="text" name="studentData.course" value="${loginStudent.getStudentData().getCourse()}">
          </div>
        </div>
        <hr>
        <h4>Address</h4>
        <input class="editDataInputLong" type="text" name="studentData.address" value="${loginStudent.getStudentData().getAddress()}">
        <hr>
        <h4>About yourself</h4>
        <textarea name="studentData.about">${loginStudent.getStudentData().getAbout()}</textarea>
        <hr>
        <div class="educationDiv">
          <h4>Education</h4>
          <i class="fa-solid fa-circle-plus" onclick="addEducation()"></i>
        </div>
        <div id="allEducationDiv">


          <%

          int index = 0;  
        	for (Education education : studEducation) { 
          %> 
          <div class="addMultiEducation">
<!--           <a href="/dfsdf" class=" deleteEducation"><i class="fa-solid fa-trash-can"></i></a> -->
            <input type="hidden" name="studentData.education[<%=index %>].id" value="<%= education.getId() %>">
            <div>
              <p class="editDataTagP">College name</p>
              <input class="editDataInputLong" type="text" name="studentData.education[<%=index %>].college" value="<%= education.getCollege() %>">
            </div>
            <div class="DegreeAndField profileFlexDiv">
              <div>
                <p class="editDataTagP">Degree</p>
                <input class="editDataInput" type="text" name="studentData.education[<%=index %>].degree" value="<%= education.getDegree() %>">
              </div>
              <div>
                <p class="editDataTagP">Field</p>
                <input class="editDataInput" type="text" name="studentData.education[<%=index %>].field" value="<%= education.getField() %>">
              </div>
            </div>
            <div class="passoutAndMark profileFlexDiv">
              <div>
                <p class="editDataTagP">Passout Year</p>
                <input class="editDataInput" type="text" name="studentData.education[<%=index %>].passout" value="<%= education.getPassout() %>">
              </div>
              <div>
                <p class="editDataTagP">Marks</p>
                <input class="editDataInput" type="text" name="studentData.education[<%=index %>].mark" value="<%= education.getMark() %>">
              </div>
            </div>
            <hr>
          </div>

          <%	index++;
          }; %>
        </div>

        <div class="educationDiv skillDiv">
          <h4>Skills</h4>
          <i class="fa-solid fa-circle-plus" onclick="addSkills()"></i>
        </div>
        <div id="allSkills">
          <%

        	for (String skill : studSkills) { 
          %> 
          <div class="addMultiSkill">
            <input class="editDataInputLong" type="text" name="studentData.skills" value="<%= skill %>">
            <hr>
          </div>
          <%	
        }; %>
        </div>

      </form>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary" onclick="submitForm()">Save Profile</button>
      </div>
    </div>
  </div>
</div>



<!-- model change profile photo -->

<!-- Modal -->
<div class="modal fade" id="changeProfilePhotoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Change Profile Photo</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form action="/file/profilePhoto/${loginStudent.getId()}" method="post" id="changeProfilePhoto" enctype="multipart/form-data">
        <div class="mb-3">
          <label for="formFile" class="form-label">select image</label>
          <input class="form-control" type="file" id="formFile" name="profilePhoto">
        </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="changeProfilePhoto()">Change</button>
      </div>
    </div>
  </div>
</div>

<!-- model change background photo -->

<!-- Modal -->
<div class="modal fade" id="changeBackPhotoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Change Background Photo</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form action="/file/backPhoto/${loginStudent.getId()}" method="post" id="changeBackPhoto" enctype="multipart/form-data">
        <div class="mb-3">
          <label for="formFile" class="form-label">select image</label>
          <input class="form-control" type="file" id="formFile" name="profilePhotoBack">
        </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="changeBackPhoto()">Change</button>
      </div>
    </div>
  </div>
</div>




    

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
      crossorigin="anonymous"
    ></script>

    <script src="/public/js/addEducationMutliDiv.js"></script>
    
    
    <script>
		//change profile photo
		
		changeProfilePhoto = ()=>{
		  document.getElementById("changeProfilePhoto").submit();
		}
		
		//change background photo
		
		changeBackPhoto = ()=>{
		  document.getElementById("changeBackPhoto").submit();
		}
	</script>
  </body>
</html>


