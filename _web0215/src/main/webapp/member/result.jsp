<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//Cookies cookies = new Cookies(request);
String remember = request.getParameter("remember");
String email = request.getParameter("id");
if(remember != null && remember.equals("on")){
	response.addCookie( //브라우저에 쿠키를 생성함
			Cookies.createCookie("id",email, "/", 60*60*24*30)
	);
} else{
	response.addCookie(
			Cookies.createCookie("id","","/",0)
	);
	
}
response.sendRedirect("index.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>