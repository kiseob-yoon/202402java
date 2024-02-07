<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table { 
        width: 650px;
        height: 350px; 
        text-align: center; 
        border-collapse: collapse;

        }
        th, td{
        font-size: 20px;
        border: 1px solid;
        }
        th    { background-color: cyan; }
        h1 {
        font-weight: normal;

        }
        
        body{
        width: 500px;
        margin: 0 auto;
        
        }
        button{
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        background-color: #3498db;
        color: #fff;
        cursor: pointer;
        transition: background-color 0.3s ease;
        &:hover {
    	background-color: #2980b9; /* 호버 시 배경색 변경 */
        }

  }
    </style>    
</head>
<body>

<table>
    <tr>
        <th>번호</th><th>이름</th>
        <th>국어</th><th>영어</th><th>수학</th>
        <th>총점</th><th>평균</th><th>처리</th>
    </tr>
    
<%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    try ( 
        Connection conn = DriverManager.getConnection(
        		"jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
    	Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select * from score");
    ) {
    	String sql = "select num, name, kor, eng, math from score";
    	
        try (PreparedStatement pstmt = conn.prepareStatement(sql)){
    		int max1 = 0;
    		int max2 = 0;
    		int max3 = 0;
    		int totalStudetns = 0;
    		double totalAverage = 0.0; 
    		
        	while (rs.next()) {

        		int korScore = rs.getInt("kor");
        		int engScore = rs.getInt("eng");
        		int mathScore = rs.getInt("math");
     
        		
        		if(max1 < korScore){
        			max1 = korScore;
        		}
        		if(max2 < engScore){
        			max2 = engScore;
        		}
        		if(max3 < mathScore){
        			max3 = mathScore;
        		}
        		
                int sum = rs.getInt("kor") + rs.getInt("eng") + 
                          rs.getInt("math");
                int num = rs.getInt("num");
                String name = rs.getString("name");
                int kor = rs.getInt("kor");
                int eng = rs.getInt("eng");
                int math = rs.getInt("math");
                
                double average = (float)sum /3;
    %>          
                <tr>
                    <td><a href="oracle_updateForm.jsp?num=<%=num%>"><%=num%></a></td>
					<td><%=name%></td>
                    <td><%=kor%></td>
                    <td><%=eng%></td>
                    <td><%=math%></td>
                    <td><%=sum%></td>
                    <td><%=String.format("%.2f", average)%></td>
                    <td><a href="oracle_delete.jsp?num=<%=num%>">삭제</a></td>
                </tr>
                
                
    <% 
    totalAverage += average;
    totalStudetns++;
    
        }
        double overallAverage = totalAverage / totalStudetns;
       
        out.print("<p>전체 평균: " + String.format("%.2f",overallAverage)+"<p>");	
        out.print("국어 최고 점수:" + max1 + "</p>");
        out.print("영어 최고 점수:" + max2 + "</p>");
        out.print("수학 최고 점수:" + max3 + "</p>");
        
        } catch (Exception e){
        	e.printStackTrace();
        }
        
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
<h1>학생 점수 테이블</h1>

</table>
</br></p>
<button onclick="location.href='index.jsp'">홈 화면</button>
<button onclick="location.href='oracle_insertForm.jsp'">사원 입력</button>

</body>
</html>