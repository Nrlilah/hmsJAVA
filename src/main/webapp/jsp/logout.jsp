<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoodBye</title>
</head>
<body>
<h1>Logout Successfully</h1>
<% session.invalidate(); %>

<a href="../index.jsp">Home</a>
</body>
</html>