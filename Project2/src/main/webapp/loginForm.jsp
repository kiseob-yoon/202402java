<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<style>

 .account{
	margin: 10px 10px;
}
 .write{
	border-radius:3px;
	border:1px solid;
	width: 100%;
}

#divid{
	color:blue;
}
#divemail{
	color:blue;
}
#login {
	float: right;
	background:blue;
	color:#fff;
	border-radius:5px;
	float:left;
}
</style>
</head>
<body>
<div>
<form action="login.jsp" method="post">
<div class="account">
<label>아이디</label><input type="text" name="id" class="write">
</div>
<div class="account">
<label>이메일</label><input type="text" name="email" class="write">
</div>
<button type="submit" id="login">로그인</button>
</form>
</div>
</body>
</html>