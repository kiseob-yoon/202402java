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
    String memName = (String)session.getAttribute("name1");
    
	boolean login = memName == null ? false : true;
 

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
<title>게시판 글보기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="icon" type="image/x-icon" href="assets/brand/favicon.ico"/>
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
	width: 100px; 
	height: 40px;
	padding: 10px; 
}

input[type="submit"], input[type="button"], input[type="reset"] {
	width: 100px; 
	height: 40px; 
	padding: 10px; 
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

	<main>
		<h1 class="visually-hidden">Headers examples</h1>

		<div class="container">
			<header
				class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
				<a href="index.jsp"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
      <svg xmlns="http://www.w3.org/2000/svg" width="40" height="32" fill="currentColor" class="bi bi-film" viewBox="0 0 16 16" style="margin: 10px;">
  		<path d="M0 1a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1zm4 0v6h8V1zm8 8H4v6h8zM1 1v2h2V1zm2 3H1v2h2zM1 7v2h2V7zm2 3H1v2h2zm-2 3v2h2v-2zM15 1h-2v2h2zm-2 3v2h2V4zm2 3h-2v2h2zm-2 3v2h2v-2zm2 3h-2v2h2z"/>
		</svg>
          <path
							d="M6.5 0A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0zm3 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5z" />
          <path
							d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1A2.5 2.5 0 0 1 9.5 5h-3A2.5 2.5 0 0 1 4 2.5zm6.854 7.354-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708.708" />
        </svg> <span class="fs-4">MOVIE BOARD</span>
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
					
					
					
        			<a href="like.jsp?num=<%=board.getNum()%>">
  					<img id="myImage" src="<%=path%>/assets/brand/hand-thumbs-up.svg" style="text-align: right; margin: 10px 0px 0px 500px; width:40px; height:32px;" onclick="changeImage()">
					</a>
					
					<span style="margin: 20px 0px 0px 5px;"><%=likes%></span>
					
					
					</div>
				</div>
			</div>
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
					
					
					<a href="like.jsp?num=<%=board.getNum()%>">
  					<img id="myImage" src="<%=path%>/assets/brand/hand-thumbs-up.svg" style="text-align: right; margin: 10px 0px 0px 730px; width:40px; height:32px;" onclick="changeImage()">
					</a>
					
					<span style="margin: 20px 0px 0px 5px;"><%=likes%></span>
					
					</div>
					</div>
			</div>
		</div>


		<% 	    
		}
	
			 %>
		<script>
		
		const imagePath = "<%=path%>";
		
    	function confirmDelete() {
        var result = confirm("게시물을 삭제하시겠습니까?");   
        if (result) {
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
