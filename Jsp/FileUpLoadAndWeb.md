# 파일 업로드와 웹
## 목록
+ [파일 업로드](#파일-업로드를-하기-위한-준비-작업)
+ [웹 하드 프로그램](#웹-하드-페이지-만들어보기)



## 파일 업로드를 하기 위한 준비 작업
### O'Reilly의 COS 라이브러리 이용
1. http://www.servlets.com/cos/ 에서 cos-20.08.zip 다운로드
2. cos.jar 파일을 프로젝트 폴더 WebContent > WEB-INF > lib 폴더에 삽입
3. 이클립스 라이브러리 적용
4. tomcat 설정에서 Serve modules without publishing 체크

## 파일 업로드 폼
```jsp
<input type = "file"> // <- 태그를 이용하여 받을 수 있다.
```
[내용 확인하기](https://github.com/wnsgudchl0302/JSP_Study/blob/master/JSPPratice/WebContent/Chap07/7-1.html)
### `주의`
- 전송 방식은 POST 방식이어야 한다. 만약 GET 방식을 사용할 경우 파일 내용이 아닌 파일명만 전송이 된다.
- enctype 속성은 폼을 전송할 때 사용할 인코딩 방법을 지정하는데, 이 속성이 `"multipart/form-data"`가 아니어도 파일명만 전송된다.

## 업로드 파일 처리
```jsp
application.getRealPath("/경로") //경로 지정하는 법
```
[내용 확인하기](https://github.com/wnsgudchl0302/JSP_Study/blob/master/JSPPratice/WebContent/Chap07/7-2.jsp)

## 웹 하드 페이지 만들어보기

### [메인 페이지](https://github.com/wnsgudchl0302/JSP_Study/blob/master/JSPPratice/WebContent/Chap07/webhard.jsp)
### [파일 추가](https://github.com/wnsgudchl0302/JSP_Study/blob/master/JSPPratice/WebContent/Chap07/add_file.jsp)
### [파일 삭제](https://github.com/wnsgudchl0302/JSP_Study/blob/master/JSPPratice/WebContent/Chap07/del_file.jsp)