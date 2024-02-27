<%@page import="dto.Comment"%>
<%@page import="dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
String writer  = request.getParameter("writer" );
String content = request.getParameter("content");
if (writer  == null || writer.length()  == 0 ||
content == null || content.length() == 0) {
%>      
    <script>
        alert('모든 항목이 빈칸 없이 입력되어야 합니다.');
        history.back();
    </script>
<%        
    return;
}
Comment comment = new Comment(writer,content);
// 입력된 내용으로 새 글 레코드 추가
CommentDao dao = CommentDao.getInstance(); 
dao.insert(comment);
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