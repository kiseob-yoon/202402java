<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%
	String memberId = (String)session.getAttribute("MEMBERID");
	String memName = (String)session.getAttribute("name");
	boolean login = memberId == null ? false : true;
%>

<html>

<head><title>로그인폼</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <script src="https://kit.fontawesome.com/9b36f7d014.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/css/style.css"/>
    <script defer src="js/ie.js"></script>
</head>
<body>

    <header>
    <div class="inner">
        <h1><a href="#">DCODLAB</a></h1>
        
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
				"<%=memName%>"님 로그인 한 상태
				<input type="button" value="로그아웃" onclick="location.href='sessionLogout.jsp'">
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
    <video src="${path}/img/visual.mp4" autoplay muted loop></video>
    <div class="inner">
        <h1>INNOVATION</h1>
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
                    <img src="${path}/img/news1.jpg" alt="1번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">Lorem ipsum dolor sit</a></h2>
                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Vitae minus,
                    eaque corrupti vero ad maiores! </p>
            </article>
            <article>
                <div class="pic">
                    <img src="${path}/img/news2.jpg" alt="2번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">Lorem ipsum dolor sit</a></h2>
                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Vitae minus,
                    eaque corrupti vero ad maiores! </p>
            </article>
            <article>
                <div class="pic">
                    <img src="${path}/img/news3.jpg" alt="3번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">Lorem ipsum dolor sit</a></h2>
                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Vitae minus,
                    eaque corrupti vero ad maiores! </p>
            </article>
            <article>
                <div class="pic">
                    <img src="${path}/img/news4.jpg" alt="4번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">Lorem ipsum dolor sit</a></h2>
                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Vitae minus,
                    eaque corrupti vero ad maiores! </p>
            </article>
        </div>
    </div>
</section>
<footer>
    <div class="inner">
    <div class="upper">
        <h1>DCODELAB</h1>
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
        2020 DCODELAB &copy; copyright all rights reserved.
        </p>
    </div>
    </div>
</footer>      


</body>
</html>
