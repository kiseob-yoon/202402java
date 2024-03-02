
<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    <%

	Cookies cookies = new Cookies(request);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="${path}assets/js/color-modes.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.115.4">

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/sign-in/">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link href="${path}/assets/dist/css/bootstrap.min.css" rel="stylesheet">

<title>로그인 페이지</title>
<link rel="stylesheet" href="${path}/css/login.css"/>
<style>
.custom-btn {
	padding: 0.5rem 1rem; /* 필요한 만큼 패딩 값을 조절하세요 */
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	width: 100%;
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.btn-bd-primary {
	--bd-violet-bg: #712cf9;
	--bd-violet-rgb: 112.520718, 44.062154, 249.437846;
	--bs-btn-font-weight: 600;
	--bs-btn-color: var(--bs-white);
	--bs-btn-bg: var(--bd-violet-bg);
	--bs-btn-border-color: var(--bd-violet-bg);
	--bs-btn-hover-color: var(--bs-white);
	--bs-btn-hover-bg: #6528e0;
	--bs-btn-hover-border-color: #6528e0;
	--bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
	--bs-btn-active-color: var(--bs-btn-hover-color);
	--bs-btn-active-bg: #5a23c8;
	--bs-btn-active-border-color: #5a23c8;
}

.bd-mode-toggle {
	z-index: 1500;
}
        .center-form {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .col-md-6 {
    word-wrap: break-word;
}

<link href="${path}/sign-in.css" rel="stylesheet">
</style>

</head>
<body>
<main class="container center-form">
<form action="${path}/member/sessionLogin.jsp" class="col-md-6">



<%
if(cookies.exists("id")){
%>
아이디 <input type="text" name="id" class="form-control" id="floatingInput" placeholder="아이디" value="<%=cookies.getValue("id") %>" size="10"/>

<% 
}


else{
%>
아이디 <input type="text" name="id" class="form-control" id="floatingInput" placeholder="아이디" size="10"/>
<%
}
%>

이메일 <input type="text" name="email" class="form-control" id="floatingInput" size="10">
<input class="form-check-input" type="checkbox" id="flexCheckDefault" name="remember" checked/><label class="form-check-label"
					for="flexCheckDefault"> 아이디 저장 </label>
<div>
<button class="btn btn-primary custom-btn" type="submit" value="로그인">로그인</button>

			<button class="btn btn-primary custom-btn" type="button" value="회원가입"
				onclick="window.open('${path}/login/member_join_form.jsp', 'popup', 
                                        'width=600, height=450')">회원가입</button>
</div> 
</form>
</main>
<script src="${path}/assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>