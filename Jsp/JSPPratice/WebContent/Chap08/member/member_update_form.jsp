<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
		
		ResultSet rs = stmt.executeQuery(String.format(
				"select * from member where id='%s'",
		(String)session.getAttribute("userId")));
		) {
		rs.next();
	

%>
	<form action="member_update.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" readonly
				value="<%=rs.getString("id")%>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"
				value="<%=rs.getString("pw")%>"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"
				value="<%=rs.getString("name")%>"></td>
			</tr>
		</table>
		<input type="submit" value="저장">
	</form>
<%
	} catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>