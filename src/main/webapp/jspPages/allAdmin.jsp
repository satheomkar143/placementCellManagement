<%@page import="com.sparkplacement.model.Admin"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	all admin data
	
	<h1>
		<a href="addNewAdmin.html">Add new admin</a>
	</h1>

	<%
	List<Admin> admins = (List<Admin>) request.getAttribute("admins");

	for (Admin admin : admins) {
	%>

	<h1><%=admin.getId()%>
		<%=admin.getEmail()%>
		<%=admin.getPassword()%>
		<%=admin.getName()%>
	</h1>
	<a href="/admin/edit/<%=admin.getId()%>">update</a>
	<a href="/admin/<%=admin.getId()%>">delete</a>

	<%
	}
	;
	%>
</body>
</html>