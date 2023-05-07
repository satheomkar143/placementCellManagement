<%@page import="com.sparkplacement.model.Enquiry"%>
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


	all enquiries

	<h1>
		<a href="addNewEnquiry.html">Add new enquiry</a>
	</h1>


	<%
	List<Enquiry> enquiries = (List<Enquiry>) request.getAttribute("enquiries");

	for (Enquiry enquiry : enquiries) {
	%>

	<h1>	
		<%=enquiry.getId()%>
		<%=enquiry.getCourse()%>
		<%=enquiry.getEmail()%>
		<%=enquiry.getFullName()%>
		<%=enquiry.getInfo()%>
		<%=enquiry.getMobile()%>	
		
	</h1>

	<a href="/enquiry/<%=enquiry.getId()%>">delete</a>

<% }; %>
</body>
</html>