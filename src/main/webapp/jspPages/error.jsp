<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500;600&family=Ubuntu:ital,wght@0,400;0,500;0,700;1,500&display=swap');
  *{
    margin: 0;
    padding: 0;
    font-family: 'Ubuntu', sans-serif; 
  }
.errDiv{
  width: 100vw;
  height: 100vh;
  background-image: url("/public/images/pagenotfound.png");
  background-position: center;
}

button{
  font-size: 30px;
  font-weight: bolder;
  padding: 5px 10px;
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  bottom: 10%;
  cursor: pointer;
  background-color: blanchedalmond;
  border: none;
  border-radius: 10px;
}
</style>
</head>
<body>
<div class="errDiv">
  <button onclick="goBack()">Go Back</button>
</div>










<!-- 
<% String errorMessage = (String)request.getAttribute("javax.servlet.error"); %>
<% if (errorMessage != null) { %>
  <p>An error occurred: <%= errorMessage %></p>
<% } %> -->

<script>
  function goBack() {
      window.history.back();
  }
  </script>	
</body>
</html>