<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.print("오늘 날짜 : " + LocalDate.now() + "<br>");
		out.print("현재 시간 : " + LocalTime.now());
	%>
</body>
</html>