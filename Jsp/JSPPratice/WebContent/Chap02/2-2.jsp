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

오늘 날짜 : 
<%
out.print(LocalDate.now());	
%>

<br>

현재 시간 :
<%
out.print(LocalTime.now());
%>
</body>
</html>