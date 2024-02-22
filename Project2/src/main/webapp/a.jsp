<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
String name =request.getParameter("name");

%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="b.jsp">b 페이지 이동</a>
<a href="https://www.naver.com">네이버</a>
<%= name %><br>
${param.name }

</body>
</html>