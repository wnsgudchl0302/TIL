<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		table { width:680px; text-align:center;}
		th	{background-color:cyan;}
		
		.num {width:80px;}
		.title {width:230px;}
		.writer {width:100px;}
		.regtime {width:180px;}
		
		a:link {text-decoration:none; color:blue;}
		a:visited{text-decoration:none; color:gray;}
		a:hover{text-decoration:none; color:red;}
	</style>
</head>
<body>
	<table>
		<tr>
			<th class="num">번호</th>
			<th class="title">제목</th>
			<th class="writer">작성자</th>
			<th class="regtime">작성일시</th>
			<th>조회수</th>
		</tr>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");

	String dbURL = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
	String dbID = "root";
	String dbPassword = "1234";

	try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from board order by num desc");){
	while (rs.next()){
		
%>
	
		<tr>
			<td><%=rs.getInt("num") %></td>
			<td style="text-align:left"><a href="view.jsp?num=<%=rs.getInt("num")%>"><%=rs.getString("title") %></a></td>
			<td><%=rs.getString("writer")%></td>
			<td><%=rs.getString("regtime")%></td>
			<td><%=rs.getInt("hits")%></td>
		</tr>

<%		
	}

} catch (Exception e) {
	e.printStackTrace();
}
%>
	</table>
	<br>
	<input type="button" value="글쓰기" onclick="location.href='write.jsp'">

</body>
</html>