<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
        <style>
        body {
            background-color: #fff; /* Light Blue */
            font-family: Arial, sans-serif;
        }

        form {
            width: 300px;
            margin: 50px auto;
            padding: 20px;
            background-color: ##f4f4f4; /* Light Blue */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
        }

        table td {
            padding: 10px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #007bff; /* Green */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        h2{
        text-align:center;
        }
    </style>
</head>
<body>

<%
    request.setCharacterEncoding("utf-8");
	Member member 
	= MemberDao.getInstance().select((String)session.getAttribute("userId"));

%>
        <form action="member_update.jsp" method="post">
        <h2>회원 정보 수정</h2>
            <table>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="id" readonly
                               value="<%=member.getId()%>"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="pw" 
                               value="<%=member.getEmail()%>"></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" 
                               value="<%=member.getName()%>"></td>
                </tr>
            </table>    
            <input type="submit" value="저장"> 
        </form>
<%       

%>
    
</body>
</html>