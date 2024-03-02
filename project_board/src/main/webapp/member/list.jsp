<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%
	String memberId = (String)session.getAttribute("MEMBERID");
	String named = (String)session.getAttribute("named");

	if(memberId == null){
		response.sendRedirect("sessionLoginForm.jsp");
	}

	BoardDao dao = BoardDao.getInstance(); 
	List<Board> list = dao.selectList();
	List<Board>search = dao.selectFit(named);
	


%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시판 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  </head>
  <body>
      <link href="css/headers.css" rel="stylesheet">
      <style>
	td .custom-link {
  	text-decoration: none; /* 링크 밑줄 제거 */
  	color: inherit; /* 부모 요소에서 상속된 색상 사용 */
	}
	td a {
  	text-decoration: none; /* 링크 밑줄 제거 */
  	color: inherit; /* 부모 요소에서 상속된 색상 사용 */
	}
      </style>
  </head>
  <body>
    </div>


<main>
  <h1 class="visually-hidden">Headers examples</h1>

  <div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="index.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="32" fill="currentColor" class="bi bi-clipboard-check-fill" viewBox="0 0 16 16" style="margin: 10px;">
          <path d="M6.5 0A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0zm3 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5z"/>
          <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1A2.5 2.5 0 0 1 9.5 5h-3A2.5 2.5 0 0 1 4 2.5zm6.854 7.354-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708.708"/>
        </svg>
        <span class="fs-4">MOVIE BOARD</span>
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
      <div class="container d-flex flex-wrap justify-content-center">
        <form class="col-12 col-lg-auto mb-2 mb-lg-0 me-lg-auto flex-row" role="search" method="post" action="select.jsp">
        <div class="d-flex align-items-center">
          <input type="search" name="na" class="form-control" placeholder="Search..." aria-label="Search" style="margin:10px">
          <input type="submit" value="검색" class="btn btn-light text-dark me-2 d-inline-block"></input>
        </div>
        </form>
      </div>

 
<div class="container" style="padding-top: 50px;">
<table class="table table-striped table-hover" style="text-align:center;">
    <tr>
        <th class="num"    >번호    </th>
        <th class="title"  >제목    </th>
        <th class="writer" >작성자  </th>
        <th class="regtime">작성일시</th>
        <th                >조회수  </th>
    </tr>
    
    
    
<%     
if(named != null && !named.isEmpty()){
    for(Board board : search){
%>
        <tr>
            <td><%=board.getNum()%></td>
            <td style="text-align:center; ">
			<a href="view.jsp?num=<%=board.getNum()%>
			&writer=<%=board.getWriter()%>">
    		<%=board.getTitle()%>
			</a>
            </td>
            <td><%=board.getWriter()%></td>
            <td><%=board.getRegtime()%></td>
            <td><%=board.getHits()%></td>

        </tr>

<% 
	}
   
  
} else {
for(Board bo : list){
%>         
        <tr>
            <td><%=bo.getNum()%></td>
            <td style="text-align:center;">
                <a href="view.jsp?num=<%=bo.getNum()%>" class="custom-link">
                    <%=bo.getTitle()%>
                </a>
            </td>
            <td><%=bo.getWriter()%></td>
            <td><%=bo.getRegtime()%></td>
            <td><%=bo.getHits()%></td>

        </tr>

<%

}
}

%>
</table>

<br>
<input type="button" value="글쓰기" class="btn btn-primary" onclick="location.href='write.jsp'">



   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
 </body>
</html>
