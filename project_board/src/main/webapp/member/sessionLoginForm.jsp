
<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    <%

	Cookies cookies = new Cookies(request);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="${path}/css/login.css"/>
</head>
<body>
<form action="${path}/member/sessionLogin.jsp">
<%
if(cookies.exists("id")){
%>
아이디 <input type="text" name="id" value="<%=cookies.getValue("id") %>" size="10"/>

<% 
}


else{
%>
아이디 <input type="text" name="id" size="10"/>
<%
}
%>
아이디 저장: <input type="checkbox" name="remember" checked/>
이메일 <input type="text" name="email" size="10">
<input type="submit" value="로그인">
</form>

</body>
</html>