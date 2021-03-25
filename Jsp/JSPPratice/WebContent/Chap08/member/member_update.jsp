<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");

Class.forName("com.mysql.cj.jdbc.Driver");

String dbURL = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
String dbID = "root";
String dbPassword = "1234";

try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		Statement stmt = conn.createStatement();
		
		) {
	
		stmt.executeUpdate(String.format(
				"update member set pw='%s', name='%s' where id = '%s'",
				request.getParameter("pw"),
				request.getParameter("name"),
				request.getParameter("id")));
		
		session.setAttribute("userName", request.getParameter("name"));
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert('수정이 완료되었습니다.');
	opener.location.reload(true);
	window.close();
</script>


</body>
</html>