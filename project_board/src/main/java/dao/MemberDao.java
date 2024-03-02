package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import dto.Board;
import dto.Member;

public class MemberDao {
	private static Connection conn;
	private static MemberDao dao = new MemberDao();
	private MemberDao() {} 
	public static MemberDao getInstance() { 
		MemberDao.getConnection(); 
		return dao; 
	}
	
	private static void getConnection(){ 
		try {
		    Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
	        		"jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Member selectForLogin(String id, String email) {
		Member member = null;
		String sql = "select * from member where id = ? and email = ?";
		PreparedStatement pstmt;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			
			ResultSet rs = pstmt.executeQuery();	
			if(rs.next()) {
				member = new Member(rs.getInt("memberno"),
									rs.getString("id"), 
									rs.getString("email"),
									rs.getString("name"));
			}

		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return member;

	}
	
	public Member select(String id) {
		String sql = "select * from member where id = ?";
		PreparedStatement pstmt;
		Member member = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();	
			if(rs.next()) {
				member = new Member(
									rs.getString("id"), 
									rs.getString("email"),
									rs.getString("name"));
			}

		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return member;

	}
	
	public int insert(Member member) {
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO member (memberno,id,email,name) VALUES (SEQ_BOARD.nextval, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
	        pstmt.setString(1, member.getId());
	        pstmt.setString(2, member.getEmail());
	        pstmt.setString(3, member.getName());
	        
	        return pstmt.executeUpdate();
	        
		} catch(Exception e) {
			e.printStackTrace();
		} 
		
		return 0;
	}	

	public int update(Member member) {
		PreparedStatement pstmt = null;
		try {
			String sql = "update member set email=?, name=? where id=?";
			pstmt = conn.prepareStatement(sql);
			
	        pstmt.setString(1, member.getEmail());
	        pstmt.setString(2, member.getName());
	        pstmt.setString(3, member.getId());
	        
	        return pstmt.executeUpdate();
	        
		} catch(Exception e) {
			e.printStackTrace();
		} 
		
		return 0;
	}	
	

}
