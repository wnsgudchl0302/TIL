# 데이터베이스(Database)ㄷ
## 목록
+ [Database 명령어](#Database-명령어)
+ [데이터베이스를 이용한 프로그래밍](#데이터베이스를-이용한-프로그래밍)
## Database 명령어
### 데이터베이스 관련 명령어
- 데이터베이스 생성
    ```DDL
    create database DB명;
    ```
- 데이터베이스 목록 확인
    ```DDL
    show databases;
    ```
- 데어베이스 삭제
    ```DDL
    drop database DB명;
    ```
### 테이블 관련 명령어
- 테이블 생성
    ```DDL
    create table 테이블명(
        필드명1 자료형 [옵션],
        num int primary key,
        name varchar(20)
    );
    ```
- 테이블 목록 확인
    ```DDL
    show tables;
    ```
- 테이블 구조 확인
    ```DDL
    desc 테이블명;
    ```
- 테이블 삭제
    ```DDL
    drop table 테이블명;
    ```
### 데이터 조작 명령어
- 테이블에 새로운 레코드 추가
    ```DML
    insert into 테이블명 (필드명1, 필드명2) values (필드값1, 필드값2);

    insert into score(num, name) values(1, "이순신");
    ```
- 테이블의 데이터 조회
    ```DML
    데이터 전체 조회
    select * from 테이블명
    
    특정 데이터 조회
    select * from 테이블명 where조건식
    ```
- 테이블의 데이터 수정
    ```DML
    update 테이블명 set 필드명=필드값 where 조건식
    
    update score set kor=90 where num=1;
    ```
- 테이블 데이터 삭제
    ```DML
    delete from 테이블명 where 조건식

    delete from score where num=1;
    ```    
<br>

## 데이터베이스를 이용한 프로그래밍
- ### 데이터베이스 접속 및 종료
    ```DML
    <%
		<%-- 데이터베이스 드라이버 읽기 및 접속 -->
	Connection conn = null;

	Class.forName("com.mysql.cj.jdbc.Driver");

	try {

		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie?serverTimezone=UTC", "root", "1234");
		out.println("DB 접속 성공!");

	} catch (Exception e) {

		e.printStackTrace();

	} finally {
        <%-- 데이터베이스 드라이버 접속 종료 -->
		if (conn != null)
			conn.close();

	}
	%>
    ```
- ### 데이터베이스의 내용을 변경하는 쿼리 실행
    ```DML
    Statement stmt = conn.createStatement();
    stmt.executeUpdate(쿼리);

    --------------------------------------

    <%
		<%-- 데이터베이스 드라이버 읽기 및 접속 -->
	Connection conn = null;

	Class.forName("com.mysql.cj.jdbc.Driver");

	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie?serverTimezone=UTC", "root", "1234");
		out.println("DB 접속 성공!");
		
        <%-- 쿼리문 실행 -->
		Statement stmt = conn.createStatement();
		String sql = "create table score (num int primary key, name varchar(20))";
		stmt.executeUpdate(sql);
		out.println("테이블 생성 성공!");
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
         <%-- 데이터베이스 드라이버 접속 종료 -->
		if (conn != null)
			conn.close();
	}
	%>
    ```
