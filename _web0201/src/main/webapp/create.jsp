<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
// JDBC 드라이버 로드
Class.forName(driver);
// 데이터베이스 연결
Connection conn = DriverManager.getConnection(url,"scott","tiger");
// SQL 쿼리문: emp1 테이블을 생성하고, emp 테이블의 일부 열을 가져와 저장
String sql = "CREATE TABLE emp1 as SELECT ename, job, sal from emp";
// SQL 쿼리 실행을 위한 PreparedStatement 생성
PreparedStatement pstmt = conn.prepareStatement(sql);
// SQL 쿼리 실행
pstmt.executeQuery();
%>
접속 완료! <br/> emp1 테이블 생성!

</body>
</html>