<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%
	String name1 = (String)session.getAttribute("name1");
	String memName = (String)session.getAttribute("name");
	boolean login = name1 == null ? false : true;
%>

<html>

<head>
	<title>BOARD</title>
	<link rel="icon" href="favicon.ico" type="image/x-icon">  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/9b36f7d014.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/css/style.css?v=2"/>

    
    <script defer src="js/ie.js"></script>
</head>
<body>

    <header>
    <div class="inner">
        <h1><a href="#">MOVIE BOARD</a></h1>
        
        <ul id="gnb">
            <li><a href="${path}/member/list.jsp">게시판</a></li>
            <li><a href="#">GALLERY</a></li>
            <li><a href="#">YOUTUBE</a></li>
            <li><a href="#">COMMUNITY</a></li>
            <li><a href="#">LOCATIOIN</a></li>
        </ul>
        
        <ul class="util">
				<%
				if (login) {
				%>
				<%=name1%>님
				<input type="button" style="margin-left:10px; padding: 10px; background: #333; color: #fff; border: none; border-radius: 5px; cursor: pointer;" value="로그아웃" onclick="location.href='sessionLogout.jsp'">
								<input class="btn btn-primary w-100 py-2" type="button" 
					value="회원정보 수정" style=" padding: 10px; background: #333; color: #fff; border: none; border-radius: 5px; cursor: pointer;"
					onclick="window.open('${path}/login/member_update_form.jsp', 'popup', 
                                        'width=600, height=450')">
				<%
				} else {
				%>
				<li><a href="${path}/member/sessionLoginForm.jsp">Login</a></li>
				<%
				}
				%>

        </ul>
    </div>
</header>
<figure>
    <video src="${path}/img/movie.mp4" autoplay muted loop></video>
    <div class="inner">
        <h1>ACTION MOVIE</h1>
        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. <br>
        Id praesentium molestias similique quaerat magni facere in a? Adipisci,
        possimus reprehenderit!</p>
        <a href="#">view detail</a>
    </div>
</figure>
<section>
    <div class="inner">
        <h1>RECENT NEWS</h1>
        <div class="wrap">
            <article>
                <div class="pic">
                    <img src="${path}/img/dun.jpg" alt="1번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">듄-파트2 </a></h2>
                <p>황제의 모략으로 멸문한 가문의 유일한 후계자 폴.(티모시 샬라메)어머니 레이디 제시카(레베카 퍼거슨)와 간신히 목숨만 부지한 채 사막으로 도망친다.
                </p>
            </article>
            <article>
                <div class="pic">
                    <img src="${path}/img/fa.jpg" alt="2번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">파묘</a></h2>
                <p>미국 LA, 거액의 의뢰를 받은 무당 ‘화림’(김고은)과 ‘봉길’(이도현)은
				기이한 병이 대물림되는 집안의 장손을 만난다.</p>
            </article>
            <article>
                <div class="pic">
                    <img src="${path}/img/tirano.jpg" alt="3번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">아이엠 티라노</a></h2>
                <p>티라노사우루스와 함께 떠나는 쿵쾅쿵쾅 백악기 대모험
				공룡 세계의 진정한 왕은 누구인가!</p>
            </article>
            <article>
                <div class="pic">
                    <img src="${path}/img/citizen.jpg" alt="4번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">시민덕희</a></h2>
                <p>경찰도 포기한 사건, 덕희는 손대리도 구출하고 잃어버린 돈도 찾겠다는 일념으로
				필살기 하나씩 장착한 직장 동료들과 함께 중국 칭다오로 직접 날아간다. </p>
            </article>
        </div>
    </div>
</section>
<footer>
    <div class="inner">
    <div class="upper">
        <h1>MOVIE BOARD</h1>
        <ul>
            <li><a href="#">Policy</a></li>
            <li><a href="#">Terms</a></li>
            <li><a href="#">Family Site</a></li>
            <li><a href="#">Sitemap</a></li>
        </ul>
    </div>
    <div class="lower">
        <address>
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quas, facere.<br>
        TEL : 031-111-1234  C.P : 010-1234-5678  
        </address>
        <p>
        2024 MOVIE BOARD &copy; copyright all rights reserved.
        </p>
    </div>
    </div>
</footer>      


</body>
</html>
