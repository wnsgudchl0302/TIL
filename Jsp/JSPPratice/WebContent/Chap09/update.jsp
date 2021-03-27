<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.*" %>

<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	if(writer == null || writer.length() == 0 ||
			title == null || title.length() == 0 ||
			content == null || content.length() ==0){
%>
	<script>
		alert('모든 항목이 빈칸 없이 입력되어야 합니다.');
		history.back();
	</script>

<%
		return;
	}
	
	Class.forName("com.mysql.cj.jdbc.Driver");

	String dbURL = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
	String dbID = "root";
	String dbPassword = "1234";

	try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		Statement stmt = conn.createStatement();
		){
			String curTime = LocalDate.now() + " " + LocalTime.now().toString().substring(0,8);
			
			stmt.executeUpdate(String.format(
					"update board set writer='%s', title='%s', "+
					"content='%s', regtime='%s' where num = %d",
					writer, title, content, curTime, num)					
					);
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("view.jsp?num=" + num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>