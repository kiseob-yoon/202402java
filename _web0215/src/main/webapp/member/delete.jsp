<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
    // 지정된 글 번호 얻기
    int num = Integer.parseInt(request.getParameter("num"));

	String memberId = (String)session.getAttribute("MEMBERID");
	
	if(memberId == null){
		response.sendRedirect("sessionLoginForm.jsp");
	}
	
	BoardDao dao = BoardDao.getInstance(); 
	dao.delete(num);
%>
	<script>
		alert('삭제가 되었습니다.');
		location.href="list.jsp";
	</script>

