<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        form input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }

        form input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    String userId = null;

    Cookie[] cookies = request.getCookies();           
    if (cookies != null) {
        for(Cookie cookie : cookies) {           
            if (cookie.getName().equals("userId")) { // userId 쿠키의 값을
                userId = cookie.getValue();          // 변수 userId에 넣음
                break;
            }
        }
    }
    
    if (userId != null) {          // 로그인 상태일 때의 출력 
%>
        <form action="logoutPS.jsp" method="post"> <!--8-3.jsp:로그아웃 처리--> 
            <%=userId%>님 로그인
            <input type="submit" value="로그아웃">
            
        </form>
<%  
    } else {                       // 로그인되지 않은 상태일 때의 출력
%>
        <form action="loginPS.jsp" method="post"> <!--8-2.jsp:로그인 처리-->
            아이디   <input type="text"     name="id">
            비밀번호 <input type="text" name="pw">
            <input type="submit" value="로그인"> 
        </form>
<%
    }
%>

</body>
</html>