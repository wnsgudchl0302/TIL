<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String userId = null;
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("userId")){
				userId = cookie.getValue();
				break;
			}
		}
	}
	
	if((String)session.getAttribute("userId")!= null){
%>
	<form action="logout.jsp" method="post">
		<%=(String)session.getAttribute("userName")%>님 로그인
		<input type="submit" value="로그아웃">
		<input type="button" value="회원정보 수정"
			onclick="window.open('member_update_form.jsp','popup','width=400,height=200')">
	</form>
<%
	} else {
%>	
	<form action="login.jsp" method="post">
		아이디 : <input type = "text" name = "id"> &nbsp; &nbsp;
		비밀번호  : <input type = "password" name = "pw">
		<input type = "submit" value="로그인">
		<input type="button" value="회원가입"
			onclick="window.open('member_join_form.jsp','popup','width=400,height=200')">
	</form>
<%
	}
%>

</body>
</html>