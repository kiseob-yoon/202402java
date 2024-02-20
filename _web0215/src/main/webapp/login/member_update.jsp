<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("utf-8");
	Member member = new Member(request.getParameter("id"  ),
        					   request.getParameter("pw"  ),
        					   request.getParameter("name"));
	MemberDao.getInstance().update(member);
        
        session.setAttribute("userName", request.getParameter("name"));

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>

<script>
    alert('수정이 완료되었습니다.');
    opener.location.reload(true); //새로고침
    window.close();
</script>

</body>
</html>