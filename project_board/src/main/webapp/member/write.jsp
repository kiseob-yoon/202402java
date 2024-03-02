<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%
    // 글 번호 값 얻기, 주어지지 않았으면 0으로 설정
    		
    String tmp = request.getParameter("num");
    int num = (tmp != null && tmp.length() > 0) ? Integer.parseInt(tmp)
                                                : 0;

    // 새 글쓰기 모드를 가정하고 변수 초기값 설정
    String writer  = "";
    String title   = "";
    String content = "";
    String action  = "insert.jsp";

    // 글 번호가 주어졌으면, 글 수정 모드
    if (num > 0) {
      	BoardDao dao = BoardDao.getInstance();
      	Board board = dao.selectOne(num, false);
    	
    	writer = board.getWriter();
    	title = board.getTitle();
    	content = board.getContent();
    	
    	action  = "update.jsp?num=" + num;
    	

    }
%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
    <meta charset="UTF-8">
    <style>
        table { width:1000px; text-align:center; margin-bottom: 50px; }
        th    { width:200px; height: 100px; }
        th, td{ font-size: 20px; padding: 15px;}
        input[type=text], textarea { width:100%; }
        input[type="submit"], input[type="button"] {
    width: 100px; /* 원하는 너비로 조절합니다. */
    height: 40px; /* 원하는 높이로 조절합니다. */
    padding: 10px; /* 원하는 패딩 값을 설정합니다. */
  }


  /* 버튼의 크기를 조절하는 스타일 */
  input[type="submit"], input[type="button"], input[type="reset"] {
    width: 100px; /* 원하는 너비로 조절합니다. */
    height: 40px; /* 원하는 높이로 조절합니다. */
    padding: 10px; /* 원하는 패딩 값을 설정합니다. */
    margin: 10px;
    float: right;
  }
  input[type="button"], input[type="button"], input[type="reset"] {
    float:right;
  }
    </style>
    <link href="css/headers.css" rel="stylesheet">
</head>
<body>

<main>
  <h1 class="visually-hidden">Headers examples</h1>

  <div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="index.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="32" fill="currentColor" class="bi bi-clipboard-check-fill" viewBox="0 0 16 16" style="margin: 10px;">
          <path d="M6.5 0A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0zm3 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5z"/>
          <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1A2.5 2.5 0 0 1 9.5 5h-3A2.5 2.5 0 0 1 4 2.5zm6.854 7.354-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708.708"/>
        </svg>
        <span class="fs-4">BOARD</span>
      </a>

      <ul class="nav nav-pills">
        <li class="nav-item"><a href="index.jsp" class="nav-link active" aria-current="page">Home</a></li>
        <li class="nav-item"><a href="sessionLogout.jsp" class="nav-link">Logout</a></li>
        <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
        <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
        <li class="nav-item"><a href="#" class="nav-link">About</a></li>
      </ul>
    </header>
  </div>
  </div>

<div class="container" style="padding-top: 100px">
<form method="post" action="<%=action%>">

<div class="mb-3" style="display:flex; align-items:center; justify-content:center; height:100vh;">
    
    <div>

    <table>
        <h1 style="text-align:center;">글작성</h1>
        <tr>
            <th>제목</th>
            <td><input type="text" name="title"class="form-control" id="nameInput"  maxlength="80"
                       value="<%=title%>">
            </td>
        </tr>
        <tr >
            <th>작성자</th>
            <td><input type="text" name="writer" class="form-control" id="nameInput" maxlength="20"
                       value="<%=session.getAttribute("name1")%>"readonly>
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea class="form-control" id="exampleFormControlTextarea1"name="content" rows="10"><%=content%></textarea>
            </td>

        </tr>

    </table>
    
    <input type="button" class="btn btn-primary" value="목록" onclick="history.back()">
        <input type="reset" class="btn btn-primary" value="초기화">

        <input type="submit" class="btn btn-primary" value="저장">
</div>
   </div>
</form>

</div>

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
				crossorigin="anonymous"></script>

</body>
</html>
