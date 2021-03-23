<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");

	String dbURL = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
	String dbID = "root";
	String dbPassword = "1234";

	try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword)) {
		
		out.println("DB접속 성공");
		
	} catch (Exception e) {
		
		e.printStackTrace();
		
	}
%>
</body>
</html>