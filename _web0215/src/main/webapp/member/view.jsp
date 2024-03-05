<%@page import="util.Cookies"%>
<%@page import="dto.Like_dislikes"%>
<%@page import="dao.Like_dislikesDao"%>
<%@page import="dto.Comment"%>
<%@page import="dao.CommentDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="java.sql.*"%>

<%
// 게시글 데이터를 담을 변수 정의
    String writer  = "";
    String title   = "";
    String content = "";
    String regtime = "";
    int    hits    = 0;
    int likes = 0;
    int dislikes =0;
    
    String path = request.getContextPath();
    
	int num = Integer.parseInt(request.getParameter("num"));
	String user = request.getParameter("writer");
    String memberId = (String)session.getAttribute("MEMBERID");
    String memName = (String)session.getAttribute("name");
    
    response.addCookie(
            Cookies.createCookie("likedPosts", String.valueOf(num), "/", 60 * 60 * 24 * 30));
 

	if(memberId == null){
		response.sendRedirect("sessionLoginForm.jsp");
	}
	
	BoardDao dao = BoardDao.getInstance();  
	Board board = dao.selectOne(num, true);
	
	
    session.setAttribute("likes",board.getLikes());
    
	writer = board.getWriter();
	title = board.getTitle();
	content = board.getContent();
	regtime = board.getRegtime();
	hits = board.getHits();
	likes = board.getLikes();
	dislikes = board.getDislikes();
	
    title   = title.replace  (" ", "&nbsp;");
    content = content.replace(" ", "&nbsp;").replace("\n", "<br>");
    	
%>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<meta charset="UTF-8">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

th {
	width: 200px;
	height: 75px;
}

th, td {
	font-size: 20px;
	padding: 10px;
	margin: 0;
	vertical-align: top;
}

input[type=text], textarea {
	width: 100%;
}

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
	float: right;
}

table {
	width: 800px;
	text-align: center;
	margin: 0px auto;
}

th {
	width: 200px;
}

td {
	text-align: center;
}

div form {
	width: 700px;
	margin: 0 auto;
}

h2 {
	text-align: center;
}
</style>
<link href="${path}/css/headers.css" rel="stylesheet">


</head>
<body>
	<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
      <symbol id="check2" viewBox="0 0 16 16">
        <path
			d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
      </symbol>
      <symbol id="circle-half" viewBox="0 0 16 16">
        <path
			d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z" />
      </symbol>
      <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path
			d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z" />
        <path
			d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z" />
      </symbol>
      <symbol id="sun-fill" viewBox="0 0 16 16">
        <path
			d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z" />
      </symbol>
    </svg>

	<div
		class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle">
		<button
			class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center"
			id="bd-theme" type="button" aria-expanded="false"
			data-bs-toggle="dropdown" aria-label="Toggle theme (auto)">
			<svg class="bi my-1 theme-icon-active" width="1em" height="1em">
				<use href="#circle-half"></use></svg>
			<span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
		</button>
		<ul class="dropdown-menu dropdown-menu-end shadow"
			aria-labelledby="bd-theme-text">
			<li>
				<button type="button"
					class="dropdown-item d-flex align-items-center"
					data-bs-theme-value="light" aria-pressed="false">
					<svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
						<use href="#sun-fill"></use></svg>
					Light
					<svg class="bi ms-auto d-none" width="1em" height="1em">
						<use href="#check2"></use></svg>
				</button>
			</li>
			<li>
				<button type="button"
					class="dropdown-item d-flex align-items-center"
					data-bs-theme-value="dark" aria-pressed="false">
					<svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
						<use href="#moon-stars-fill"></use></svg>
					Dark
					<svg class="bi ms-auto d-none" width="1em" height="1em">
						<use href="#check2"></use></svg>
				</button>
			</li>
			<li>
				<button type="button"
					class="dropdown-item d-flex align-items-center active"
					data-bs-theme-value="auto" aria-pressed="true">
					<svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
						<use href="#circle-half"></use></svg>
					Auto
					<svg class="bi ms-auto d-none" width="1em" height="1em">
						<use href="#check2"></use></svg>
				</button>
			</li>
		</ul>
	</div>

	<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
  <symbol id="bootstrap" viewBox="0 0 118 94">
    <title>Bootstrap</title>
    <path fill-rule="evenodd" clip-rule="evenodd"
			d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
  </symbol>
  <symbol id="home" viewBox="0 0 16 16">
    <path
			d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z" />
  </symbol>
  <symbol id="speedometer2" viewBox="0 0 16 16">
    <path
			d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z" />
    <path fill-rule="evenodd"
			d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z" />
  </symbol>
  <symbol id="table" viewBox="0 0 16 16">
    <path
			d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z" />
  </symbol>
  <symbol id="people-circle" viewBox="0 0 16 16">
    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
    <path fill-rule="evenodd"
			d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
  </symbol>
  <symbol id="grid" viewBox="0 0 16 16">
    <path
			d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z" />
  </symbol>
</svg>
	<main>
		<h1 class="visually-hidden">Headers examples</h1>

		<div class="container">
			<header
				class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
				<a href="index.jsp"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
					<svg xmlns="http://www.w3.org/2000/svg" width="40" height="32"
						fill="currentColor" class="bi bi-clipboard-check-fill"
						viewBox="0 0 16 16" style="margin: 10px;">
          <path
							d="M6.5 0A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0zm3 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5z" />
          <path
							d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1A2.5 2.5 0 0 1 9.5 5h-3A2.5 2.5 0 0 1 4 2.5zm6.854 7.354-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708.708" />
        </svg> <span class="fs-4">BOARD</span>
				</a>

				<ul class="nav nav-pills">
					<li class="nav-item"><a href="index.jsp"
						class="nav-link active" aria-current="page">Home</a></li>
					<li class="nav-item"><a href="sessionLogout.jsp"
						class="nav-link">Logout</a></li>
					<li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
					<li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
					<li class="nav-item"><a href="#" class="nav-link">About</a></li>
				</ul>
			</header>
		</div>
		</div>

		<%
		if(writer.equals(memName)){
			 %>
		<div class="mb-3"
			style="display: flex; align-items: center; justify-content: center; height: 100vh;">
			<div class="container" style="padding-top: 50px;">
				<h2 style="text-align: center; margin-bottom: 50px;">게시판 글보기</h2>
				<table class="center-table table table-bordered table-hover" style=width:900px;>
					<tbody>
					<tr>
						<th>제목</th>
						<td><%=title%></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%=writer%></td>
					</tr>
					<tr>
						<th>작성일시</th>
						<td><%=regtime%></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><%=hits%></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><%=content%></td>
					</tr>
					</tbody>
				</table>
				
				<div style="text-align: left; margin: 50px 0px 0px 200px">
				<div class="btn-group">
					<input type="button" class="btn btn-primary" value="목록" onclick="location.href='list.jsp'">
					<input type="button" class="btn btn-primary" value="수정" name="editButton" onclick="location.href='write.jsp?num=<%=num%>'">
					<input type="button" class="btn btn-primary" value="삭제" onclick="confirmDelete()">
					
					
        			<a href="location.jsp?num=<%=board.getNum()%>">
  					<img id="myImage" src="${path}/assets/brand/hand-thumbs-up.svg" style="text-align: right; margin: 10px 0px 0px 435px; width:40px; height:32px;">
					</a>
					
					<span style="margin: 20px 0px 0px 5px;"><%=likes%></span>
					
					<img id="change" src="${path}/assets/brand/hand-thumbs-down.svg" style="text-align: right; margin: 10px 0px 0px 0px; width:40px; height:32px;" onclick="changeImage()">
					<span style="margin: 20px 0px 0px 5px;"><%=dislikes%></span>
					
					</div>
				</div>
			</div>
		</div>
		
		<div id="comments-container">
			<form action="comment.jsp" method="post">
				작성자: <input type="text" name="writer" value="<%=session.getAttribute("MEMBERID")%>" style="width:80px" border:none;>
				<textarea name="content" rows="4" cols="50"
					placeholder="댓글을 입력하세요"></textarea>
				<br> <input type="submit" class="btn btn-primary" value="제출">
			</form>
		</div>
		<%  
		} else{
			%>
		<div class="mb-3"
			style="display: flex; align-items: center; justify-content: center; height: 100vh;">
			<div class="container" style="padding-top: 50px;">
				<h2 style="text-align: center; margin-bottom: 50px;">게시판 글보기</h2>
				<table class="center-table table table-bordered table-hover" style=width:900px;>
					<tr>
						<th>제목</th>
						<td><%=title%></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%=writer%></td>
					</tr>
					<tr>
						<th>작성일시</th>
						<td><%=regtime%></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><%=hits%></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><%=content%></td>
					</tr>
				</table>
					<div style="text-align: left; margin: 50px 0px 0px 200px">
					<div class="btn-group">
					<input type="button" class="btn btn-primary" value="목록"
					onclick="location.href='list.jsp'">
					</div>
					</div>
			</div>
		</div>


		<div id="comments-container">
			<form action="comment.jsp" method="post">
				<textarea name="content" rows="4" cols="50" placeholder="로그인이 필요합니다"></textarea> 
			</form>
		</div>
		<% 	    
		}
	
			 %>
		<script>


    function confirmDelete() {
        // confirm 함수를 사용하여 확인 메시지를 표시
        var result = confirm("게시물을 삭제하시겠습니까?");
        
        // 확인을 눌렀을 때 true를 반환하고, 취소를 눌렀을 때 false를 반환
        if (result) {
            // 확인을 눌렀을 때 삭제 처리를 수행할 URL로 이동
            location.href = 'delete.jsp?num=<%=num%>';
        }


    }
		</script>	 
			 
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
			crossorigin="anonymous"></script>
</body>
</html>