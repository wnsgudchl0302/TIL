# JSP Programming 기초
## 목록
+ [JSP 프로그램 기본형태](#JSP-프로그램-기본형태)
    + [page 지시자](#page-지시자)
    + [스크립틀릿](#스크립틀릿)
+ [주석](#주석)
+ [화면 출력하기](#화면-출력하기)
# JSP 프로그램 기본형태
- JSP 프로그램의 확장자는 ".jsp"이다.
- 시작을 알리는 표시로 <% 를 사용하고 끝을 알리는 표시로 %> 를 사용한다.
<br>
<br>

## page 지시자
```
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
```
|`속성과 값`|`의미`|
|:--- | :---  |
|  language="java" | 프로그래밍 언어로 자바를 사용한다.  |
| contentType="text/html; charset=UTF-8"  | 이 JSP 프로그램이 생성할 문서는 UTF-8로 인코딩된 HTML이다.  |
| pageEncoding="UTF-8"` | 이 JSP 프로그램 파일은 UTF-8로 인코딩되어 있다.  |
<br>

## 스크립틀릿
```
<%
 out.println("JSP HELLO");
%>
```
# 주석
- 자바에서 사용하던 주석 //, /* ~ */은 html에서 텍스트로 인식한다.
- \<!-- --> <%-- -->를 사용하면 된다.
- \<!-- -->주석은 소스보기를 하면 보이지만 <%-- -->주석은 보이지 않는다.

# 화면 출력하기
```
<%
    out.print(출력할내용);
%>

하나의 내용을 출력하고 싶을 때 사용
<%= 출력할 내용 %>

```
