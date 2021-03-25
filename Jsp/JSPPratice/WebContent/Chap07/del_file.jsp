<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.File"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		int num = Integer.parseInt(request.getParameter("num"));

	Class.forName("com.mysql.cj.jdbc.Driver");

	String dbURL = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
	String dbID = "root";
	String dbPassword = "1234";

	try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from webhard where num=" + num);) {

		if (rs.next()) {
			File file = new File(application.getRealPath("/files/") + rs.getString("fname"));
			if (file != null) {

		file.delete();
			}

			stmt.executeUpdate("delete from webhard where num=" + num);
		}

	} catch (Exception e) {

		e.printStackTrace();

	}
	response.sendRedirect("webhard.jsp");
	%>
</body>
</html>
