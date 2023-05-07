<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.sparkplacement.model.StudentLoginInfo"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	all data

	<h1>
		<a href="addNewStudent.html">Add new</a>
	</h1>

	<%
	List<StudentLoginInfo> students = (List<StudentLoginInfo>) request.getAttribute("students");

	for (StudentLoginInfo stud : students) {
	%>

	<h1><%=stud.getId()%>
		<%=stud.getEmail()%>
		<%=stud.getPassword()%></h1>
	<a href="/student/edit/<%=stud.getId()%>">update</a>
	<a href="/student/<%=stud.getId()%>">delete</a>

	<%
	}
	;
	%>

</body>
</html>