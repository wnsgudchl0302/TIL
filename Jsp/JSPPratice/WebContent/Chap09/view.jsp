<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{width:680px; text-align:center;}
	th{width:100px; background-color:cyan;}
	td{text-align: left; border:1px solid gray;}
</style>
</head>
<body>
	<table>
		<tr>
			<th>제목</th>
			<td></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td></td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td></td>
		</tr>
		<tr>
			<th>글의 내용입니다.</th>
			<td></td>
		</tr>
	</table>
	
	<br>
	<input type="button" value="목록보기" onclick="location.href='list.jsp'">
	<input type="button" value="수정" onclick="location.href='write.jsp'">
	<input type="button" valur="삭제" onclick="location.href='delete.jsp'">
</body>
</html>