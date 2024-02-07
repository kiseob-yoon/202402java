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
//문자 인코딩을 utf-8로 설정
request.setCharacterEncoding("utf-8");
//JDBC 드라이버 및 데이터베이스 연결 정보 설정
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
Class.forName(driver);
Connection conn = DriverManager.getConnection(url,"scott","tiger");
//SQL 쿼리문: emp1 테이블에 데이터 삽입
String sql = "insert into emp1(ename, job, sal) values(?, ?, ?)";
//SQL 쿼리 실행을 위한 PreparedStatement 생성
PreparedStatement pstmt = conn.prepareStatement(sql);
//PreparedStatement에 파라미터 설정
pstmt.setString(1, request.getParameter("ename"));
pstmt.setString(2, request.getParameter("job"));
pstmt.setDouble(3, Double.parseDouble(request.getParameter("sal")));
//SQL 쿼리 실행 및 결과 반환
int result = pstmt.executeUpdate();
//삽입 결과에 따라 메시지 출력
if (result ==1){
	out.println("입력 성공!");
}
%>
<a href="select.jsp">목록으로</a>
<%
response.sendRedirect("select.jsp");
%>
</body>
</html>