<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest, 
				com.oreilly.servlet.multipart.DefaultFileRenamePolicy, 
				java.io.File" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.*" %>

<%
	MultipartRequest multi = new MultipartRequest(
			request,
			application.getRealPath("/files"),
			100 * 1024 * 1024,
			"utf-8",
			new DefaultFileRenamePolicy()
			);

	File file = multi.getFile("upload");
	
	if(file != null){
		Class.forName("com.mysql.cj.jdbc.Driver");

		String dbURL = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "1234";

		try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
				Statement stmt = conn.createStatement();) 
		{
			String curTime = LocalDate.now() + " " + LocalTime.now().toString().substring(0,8);
			
			stmt.executeUpdate(String.format(
					"insert into webhard (fname, ftime, fsize) "+
					"values ('%s', '%s', %d)",
					file.getName(), curTime, (int)file.length()
					));
			
			response.sendRedirect("webhard.jsp");
			return;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
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
	alert('업로드 실패 !');
	history.back();
</script>

</body>
</html>