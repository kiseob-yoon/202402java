<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
Class.forName(driver);
Connection conn = DriverManager.getConnection(url,"scott","tiger");
String sql = "select num, name, kor, eng, math from score where num=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, request.getParameter("num"));
ResultSet rs = pstmt.executeQuery();
int num = 0; String name = ""; int kor = 0; int eng =0; int math = 0;
if(rs.next()){
	num = rs.getInt("num");
	name = rs.getString("name");
	kor = rs.getInt("kor");
	eng = rs.getInt("eng");
	math = rs.getInt("math");
}

%>
<h1>수정하기</h1>

<form id="frm">
번호<input type="text" name="num" value="<%=num%>"/></br>
이름<input type="text" name="name" value="<%=name%>"/></br>
국어<input type="text" name="kor" value="<%=kor%>"/></br>
영어<input type="text" name="eng" value="<%=eng%>"/></br>
수학<input type="text" name="math" value="<%=math%>"/></br>

<a href="index.jsp">목록으로</a>
</form>
<input type="button" onclick="update()" value="수정"/>
<button onClick="del()">삭제</button>
<script>
function del(){
	document.getElementById('frm').action='oracle_delete.jsp';
	document.getElementById('frm').submit();
}
function update() {
	document.getElementById('frm').action='oracle_update.jsp';
	document.getElementById('frm').submit();
}
</script>
</body>
</html>