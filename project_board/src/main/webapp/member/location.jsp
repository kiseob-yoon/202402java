<%@page import="dto.Board"%>
<%@page import="dto.Like_dislikes"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int likes = (int)session.getAttribute("likes");
int num = Integer.parseInt(request.getParameter("num"));

Board board = new Board(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
BoardDao dao = BoardDao.getInstance();
int result = dao.like(num);
%>

<script>
<%
if (result > 0) {
%>
    alert('좋아요.');
<%
} else {
%>
    alert('좋아요 처리 중 오류가 발생했습니다.');
<%
}
%>
location.href="view.jsp?num=" + <%=num%>;
</script>

</body>
</html>