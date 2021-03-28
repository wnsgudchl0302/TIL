# 쿠키와 세션
## 목록
+ [쿠키](#쿠키)
+ [세션](#세션)

<br>

# 쿠키
- 쿠키는 특정한 정보의 이름과 값을 그 사람의 컴퓨터에 저장해 놓은 것이다.

### 쿠키 생성 방법
```java
Cookie 객체 = new Cookie("쿠키_이름", "쿠기_값");
객체.setMaxAge(쿠키_지속시간_초단위);
response.addCookie(객체);
```

### 쿠키값을 읽는 방법
```java
Cookie[] 쿠키_객체의_배열 = request.getCookies();
```
- 쿠키 값을 읽을 때에는 request객체의 getCookies() 메소드를 사용한다.

### 쿠키를 이용한 로그인 페이지 만들기
* [로그인 메인 페이지](https://github.com/wnsgudchl0302/TIL/blob/master/Jsp/JSPPratice/WebContent/Chap08/8-1.jsp) 
* [로그인](https://github.com/wnsgudchl0302/TIL/blob/master/Jsp/JSPPratice/WebContent/Chap08/8-2.jsp)
* [로그아웃](https://github.com/wnsgudchl0302/TIL/blob/master/Jsp/JSPPratice/WebContent/Chap08/8-3.jsp)

# 세션
- 쿠키는 파일 형태로 저장되기 때문에 보안에 문제가 있다.
- 세션은 웹사이트에 접속하면 해당 사용자와 웹 서버 간에 세션이 생성되기 때문에 쿠키에 나타났던 보안 문제를 해결할 수 있다.
### 세션 생성하는법
```java
session.setAttribute("세션_속성_이름", "값");
```

### 세션 값 읽는 법 (변수에 넣기)
```java
String id = (String)session.setAttribute("세션_속성_이름");
```

### 세션 속성 삭제하는 법
```java
session.removeAttribute("세션_속성_이름");
```

## 세션과 데이터베이스 이용하여 로그인, 로그아웃, 회원가입, 정보수정 만들어보기

* [로그인 메인 페이지](https://github.com/wnsgudchl0302/TIL/blob/master/Jsp/JSPPratice/WebContent/Chap08/member/login_main.jsp) 
* [로그인](https://github.com/wnsgudchl0302/TIL/blob/master/Jsp/JSPPratice/WebContent/Chap08/member/login.jsp) 
* [로그아웃](https://github.com/wnsgudchl0302/TIL/blob/master/Jsp/JSPPratice/WebContent/Chap08/member/logout.jsp) 
* [회원가입 양식](https://github.com/wnsgudchl0302/TIL/blob/master/Jsp/JSPPratice/WebContent/Chap08/member/member_join_form.jsp) 
* [회원가입 기능](https://github.com/wnsgudchl0302/TIL/blob/master/Jsp/JSPPratice/WebContent/Chap08/member/member_join.jsp) 
* [정보수정 양식](https://github.com/wnsgudchl0302/TIL/blob/master/Jsp/JSPPratice/WebContent/Chap08/member/member_update_form.jsp) 
* [정보수정 기능](https://github.com/wnsgudchl0302/TIL/blob/master/Jsp/JSPPratice/WebContent/Chap08/member/member_update.jsp) 