<%@page import="dto.Board"%>
<%@page import="dto.Like_dislikes"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int num = Integer.parseInt(request.getParameter("num"));
Board board = new Board(num);
BoardDao dao = BoardDao.getInstance();
String userId = (String)session.getAttribute("MEMBERID");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int result = 0;

boolean userLiked = dao.hasUserLiked(userId, request);

if (userLiked) {
    dao.like(num);
    
    dao.removeLikeCookie(request,response, userId);
    result++;
} else {
	dao.cancel(num);
    
    dao.setLikeCookie(response, userId);
    result--;
}

%>

<script>
<%
//좋아요 결과에 따른 스크립트 처리
if (result > 0) {
%>
 alert('좋아요.');
<%
} else {
%>
 alert('좋아요 취소.');
<%
}
%>
location.href="view.jsp?num=" + <%=num%>;
</script>

</body>
</html>