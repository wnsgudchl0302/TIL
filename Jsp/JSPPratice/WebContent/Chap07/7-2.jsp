<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest, 
				com.oreilly.servlet.multipart.DefaultFileRenamePolicy, 
				java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	MultipartRequest multi = new MultipartRequest(
			request,
			application.getRealPath("/files"),
			100 * 1024 * 1024,
			"utf-8",
			new DefaultFileRenamePolicy()
			);

	File file = multi.getFile("upload");
	
	if(file == null)
		out.print("파일 업로드 오류!");
	else{
		out.print("File Name : " + file.getName() + "<br>");
		out.print("File Size : " + file.length() + "<br>");
	}
%>

</body>
</html>