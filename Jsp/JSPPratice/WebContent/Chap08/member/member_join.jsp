<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");

Class.forName("com.mysql.cj.jdbc.Driver");

String dbURL = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
String dbID = "root";
String dbPassword = "1234";

try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(String.format("select * from member where id='%s'",
		request.getParameter("id")));
		) {
	if (rs.next()) {
%>
	<script>
		alert('이미 등록된 아이디입니다.');
		history.back()
	</script>
<%
	}else {
		
		stmt.executeUpdate(String.format(
				"insert into member values('%s', '%s', '%s')",
				request.getParameter("id"),
				request.getParameter("pw"),
				request.getParameter("name")));
	}
%>
	<script>
		alert('가입이 완료되었습니다.');
		window.close();		
	</script>
<%

} catch (Exception e) {
	e.printStackTrace();
}
%>

</body>
</html>