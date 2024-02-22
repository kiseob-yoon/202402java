<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   

<%

	String id = request.getParameter("id"); 
	String email = request.getParameter("pw");
	Member member = MemberDao.getInstance().selectForLogin(id, email);
	
        if (member != null) {
            session.setAttribute("userId",   member.getId());
            session.setAttribute("userName", member.getName());
                
            response.sendRedirect("login_main.jsp"); //a
            return;
        }
        
    
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>

<script>
    alert('아이디 또는 비밀번호가 틀립니다!');
    history.back();
</script>
<%
response.sendRedirect("login_main.jsp");
%>
 
</body>
</html>
