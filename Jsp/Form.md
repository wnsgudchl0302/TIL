# Form 태그
## 목록
+ [form 태그](#form-태그)
+ [입력 태그](#입력-태그)
+ [GET 방식으로 값 전달](#get-방식으로-값-전달)
+ [POST 방식으로 값 전달](#post-방식으로-값-전달)
+ [단일 값 입력 처리](#단일-값-입력-처리)
+ [다중 선택 입력 처리](#다중-선택-입력-처리)
## form 태그
웹에서 사용자의 입력을 받기 위해서는 HTML의 \<form> 태그를 사용한다.
```jsp
<form action="입력 값을 전달할 프로그램" method="데이터를 전달하는 방식">
입력 태그
</form>
```
### action 속성
- 입력된 값들을 전달할 JSP 프로그램 이름을 적는다.
- 만약 같은 폴더에 있지 않으면 경로 까지 적어준다.
### method 속성
- 입력된 데이터를 전달아는 방식이다.
- GET 또는 POST 중 원하는 방식을 적어주면된다.
- GET 방식은 전달되는 데이터가 웹 브라우저의 주소창에 보이지만 POST는 보이지 않는다.

## 입력 태그
| `입력 태그`  | `입력 유형`  |
|  :---:  | :--- |
|  \<input> |   텍스트, 비밀번호, 라디오버튼, 체크박스, submit, reset, 파일   |
|  \<select> |   드롭다운 리스트, 일반 리스트   |
|  \<textarea> |   여러 줄의 텍스트 입력   |
```jsp
// EXAMPLE
<input type="text" name="abc">
<input type="submit" value="확인">
```

## GET 방식으로 값 전달
GET방식으로 값 전달해보기
```html
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="4-2.jsp" method="GET">
		국어: <input type="text" name="kor"><br>
		영어: <input type="text" name="eng"><br>
		수학: <input type="text" name="math"><br>
		<input type="submit" value="확인">
	</form>
</body>
</html>
```
```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

국어 : <%=request.getParameter("kor") %><br>
영어 : <%=request.getParameter("eng") %><br>
수학 : <%=request.getParameter("math") %><br>
</body>
</html>
```
### `주소창에 http://localhost:8080/Study/4-2.jsp?kor=100&eng=80&math=90 전달한 값이 보여진다.`

## POST 방식으로 값 전달
POST 방식으로 값 전달해보기
```html
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="4-2.jsp" method="POST">
		국어: <input type="text" name="kor"><br>
		영어: <input type="text" name="eng"><br>
		수학: <input type="text" name="math"><br>
		<input type="submit" value="확인">
	</form>
</body>
</html>
```
```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

국어 : <%=request.getParameter("kor") %><br>
영어 : <%=request.getParameter("eng") %><br>
수학 : <%=request.getParameter("math") %><br>
</body>
</html>
```
### `주소창에 http://localhost:8080/Study/4-2.jsp 전달한 값이 보이지 않는다.`

### GET이나 POST로 전달된 값을 받을 때에는 request.getParameter()키워드를 사용한다.
<br>

## 단일 값 입력 처리
다양한 입력란 처리를 해보자
```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="4-5.jsp" method="POST">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="gender" value="남" checked>남</td>
				<td><input type="radio" name="gender" value="여" >여</td>
			</tr>
			<tr>
				<td>가입경로</td>
				<td>
					<select name="intro">
						<option value="웹검색" selected>웹검색</option>
						<option value="지인소개">지인소개</option>
						<option value="기타">기타</option>
					</select>				
				</td>
			</tr>
			<tr>
				<td>주소지</td>
				<td>
					<select name="addr" size="4">
						<option value="서울" selected>서울</option>
						<option value="경기">경기</option>
						<option value="인천">인천</option>
						<option value="기타">기타</option>
					</select>				
				</td>
			</tr>
			<tr>
				<td>메모</td>
				<td>
					<textarea name="memo" rows="4"></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="가입">
	</form>
</body>
</html>
```
```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
아이디 : <%=request.getParameter("id") %><br>
비밀번호 : <%=request.getParameter("pw") %><br>
성별 : <%=request.getParameter("gender") %><br>
가입경로 : <%=request.getParameter("intro") %><br>
주소지 : <%=request.getParameter("addr") %><br>
메모 : <%=request.getParameter("memo") %>
</body>
</html>
```
### 중간에 request.setCharacterEncoding("utf-8");가 있는데 이는 request객체에게 "이 프로그램으로 전달되어 네가 보관하고 있는 값들이 UTF-8로 인코딩되어 있어" 라고 말해주는 것이다.
<br>

## 다중 선택 입력 처리
다중 선택을 하여 여러개의 값을 전송해보자
```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="4-7.jsp" method="POST">
		<table>
			<tr>
				<td>관심언어</td>
				<td><input type="checkbox" name="lang" value="PHP">PHP
					<input type="checkbox" name="lang" value="JSP">JSP 
					<input type="checkbox" name="lang" value="ASP.NET">ASP.NET</td>
			</tr>
			<tr>
				<td>취미</td>
				<td><select name="hobby" size="4" multiple>
						<option value="영화">영화</option>
						<option value="운동">운동</option>
						<option value="독서">독서</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>
		</table>
		<input type="submit" value="전송">
	</form>
</body>
</html>
```
```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String[] lang = request.getParameterValues("lang");
	String[] hobby = request.getParameterValues("hobby");
	%>
	관심 언어 :
	<%
		for (int i = 0; i < lang.length; i++) {
		out.println(lang[i] + " ");
	}
	%>
	<br> 취미 :
	<%
		for (int i = 0; i < hobby.length; i++) {
		out.println(hobby[i] + " ");
	}
	%>
	<br>
</body>
</html>
```

### `getParameter()는 하나의 값만 꺼내지만 getParameterValues()는 배열을 반환하여 여러 개의 값을 반환 할 수 있다.`