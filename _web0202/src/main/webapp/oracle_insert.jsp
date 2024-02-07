<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>

<%
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
        
        String sql = "insert into score (num, name, kor, eng, math) values (?,?,?,?,?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, request.getParameter("num"));
            pstmt.setString(2, request.getParameter("name"));
            pstmt.setString(3, request.getParameter("kor"));
            pstmt.setString(4, request.getParameter("eng"));
            pstmt.setString(5, request.getParameter("math"));

            pstmt.executeUpdate();
            response.sendRedirect("oracle_list.jsp");
            
        } catch(SQLException e){
            e.printStackTrace();
        }
        
    } catch(Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>