<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onClick="test()">클릭</button>
<h1 id="title">헬로우 jsp</h1>
<h1 class="title2">헬로우 jsp2</h1>
<script>
function test(){
	let str = document.getElementById("title"); //id값 직접 참조
	let str2 = document.querySelector("#title"); //css선택자로 첫번째로 선택되는 요소 참조
	let str3 = document.querySelector(".title2"); //위와 마찬가지로 첫번째로 매칭되는 요소를 참조
	console.log("안녕 JSP",'HI',str, str2, str3);
	str3.innerHTML = "테스트";
}
</script>
</body>
</html>