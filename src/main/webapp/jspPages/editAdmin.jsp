<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	update admin
	
	<form action="/admin/${admin.getId()}" method="post">
		name<input type="text" name="name" value="${admin.getName()}"><br>
		email<input type="text" name="email" value="${admin.getEmail()}"><br>
		password<input type="text" name="password" value="${admin.getPassword()}"><br>
		<input type="submit">
	</form>
</body>
</html>