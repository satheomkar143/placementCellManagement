<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	update student

	<form action="/student/${student.getId()}" method="post">
		id<input type="text" name="id" value="${student.getId()}"><br>
		name<input type="text" name="email" value="${student.getEmail()}">><br>
		email<input type="text" name="password"
			value="${student.getPassword()}">><br> <input
			type="submit">
	</form>
</body>
</html>