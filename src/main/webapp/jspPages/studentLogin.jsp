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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="/public/css/studentSideProfile.css">
<link rel="stylesheet" href="/public/css/studentLogin.css">
<!-- <link rel="stylesheet" href="../public/css/style.css"> -->


<title>Insert title here</title>
</head>
<body>

	<%
	boolean active = false;
	String msg = (String) request.getAttribute("msg");
	try {
		active = (boolean) request.getAttribute("active");
	} catch (Exception e) {
	}
	%>

	  <% if(!active && msg != null){ %>
	  	<div class="showMsg">
			<h5>${msg} <span id="closeMsg"><i class="fa-solid fa-circle-xmark"></i></span> </h5>	  	
	  	</div>
	  	
	  <% };%>


	student login
	<form action="/student/login" method="post">
		id<input type="text" name="id"><br> email<input
			type="text" name="email"><br> password<input type="text"
			name="password"><br> <input type="submit">
	</form>






	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
		
		
	<script>
		const msgDiv = document.querySelector(".showMsg");
		const closeDiv = document.getElementById("closeMsg");
		
		closeDiv.addEventListener("click",()=>{
			msgDiv.style.display = "none";
		})
	</script>	



</body>
</html>