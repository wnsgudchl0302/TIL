<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	Cookie cookie = new Cookie("userId", null);
	cookie.setMaxAge(0);
	response.addCookie(cookie);

	response.sendRedirect("8-1.jsp");
%>
