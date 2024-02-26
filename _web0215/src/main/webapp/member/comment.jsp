<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
String comment  = request.getParameter("newComment");

String memberId = (String)session.getAttribute("MEMBERID");

if(memberId == null){
	response.sendRedirect("sessionLoginForm.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
response.sendRedirect("view.jsp");
%>
</body>
</html>