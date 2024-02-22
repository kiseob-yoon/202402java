<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@page import="util.Cookies"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
    request.setCharacterEncoding("utf-8");
    int num = Integer.parseInt(request.getParameter("id"));
    String writer = request.getParameter("name");
    Board board = BoardDao.getInstance().selectForLogin2(num, writer);
    String remember = request.getParameter("remember");
    
    
    // 쿠키 생성 및 삭제
    if (remember != null && remember.equals("on")) {
        response.addCookie(
            Cookies.createCookie("id", String.valueOf(num), "/", 60 * 60 * 24 * 30)
        );
    } else {
        response.addCookie(
            Cookies.createCookie("id", "", "/", 0)
        );
    }

    // 로그인 여부 확인
    if (board != null) {
        // 로그인 성공 시 세션 설정 및 페이지 이동
        session.setAttribute("MEMBERID", String.valueOf(board.getNum()));
        session.setAttribute("name", board.getWriter());
        response.sendRedirect("index.jsp"); //a
    } else {
        // 로그인 실패 시
%>
<html>
<head><title>로그인 실패</title></head>
<body>
    <script>
        alert("로그인에 실패하였습니다.");
        history.go(-1);
    </script>
</body>
</html>
<%
    } // 페이지의 끝
    // 로그인 성공 시

%>