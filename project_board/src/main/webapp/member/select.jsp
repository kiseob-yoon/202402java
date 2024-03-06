<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
String writer  = request.getParameter("na");
String memberId = (String)session.getAttribute("MEMBERID");

session.setAttribute("named", writer);
String named = (String)session.getAttribute("named");
session.setAttribute("title", writer);

if(memberId == null){
	response.sendRedirect("sessionLoginForm.jsp");
}
if(named==null){
	session.removeAttribute("named");
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
response.sendRedirect("list.jsp");
%>
</body>
</html>