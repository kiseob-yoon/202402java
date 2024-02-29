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
import dto.Comment;

public class CommentDao {
	private static Connection conn;
	private static CommentDao dao = new CommentDao(); //유일한 인스턴스
	private CommentDao() {} // 생성자를 private으로 하여 외부에서 생성못하게 막음
	public static CommentDao getInstance() { //외부에서 메서드 호출하면
		CommentDao.getConnection(); //getConnection메소드 호출
		return dao; //싱글턴을 사용하여 인스턴스를 사용
	}

	private static void getConnection(){ //db연결
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/project1", "root", "mysql");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Comment> selectList() { //메서드 호출 시 ArrayList에 Board 객체들을 저장하고 반환할 수 있음 
		ArrayList<Comment> list = new ArrayList<Comment>(); //ArrayList를 생성
		String sql = "select * from comment order by num desc"; //db에서 쿼리문 따옴
		PreparedStatement pstmt; 
		try {
			pstmt = conn.prepareStatement(sql); //sql문을 포함해서 객체 생성 
			ResultSet rs = pstmt.executeQuery(); //ResultSet에 객체를 담아둠

			while (rs.next()) { //rs에 담아둔 객체를 반복해서 찍어낸다.
				Comment comment = new Comment(rs.getInt("num"), rs.getString("writer"), 
						rs.getString("regtime"),rs.getString("content"));
				list.add(comment); //찍어낸 값을 arraylist에 넣어줌

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;

	}
	
	public int delete(int num) {
		String sql = "select * from comment where num = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate("delete from comment where num=" + num);

		} catch(Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	public int insert(Comment comment) {
		PreparedStatement pstmt = null;
		String curTime = LocalDate.now() + " " + 
				LocalTime.now().toString().substring(0, 8);
		try {
			String sql = "INSERT INTO comment (writer, regtime, content) VALUES (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
	        pstmt.setString(1, comment.getWriter());
	        pstmt.setString(2, curTime);
	        pstmt.setString(3, comment.getContent());
	        
	        int result = pstmt.executeUpdate();
	        
		} catch(Exception e) {
			e.printStackTrace();
		} 
		
		return 0;
	}
	
	public int update(int num, String writer, String content) {
		PreparedStatement pstmt = null;
		try {
			String sql = "update comment set writer=?, content=? where num=?";
			pstmt = conn.prepareStatement(sql);
			
	        pstmt.setString(1, writer);
	        pstmt.setString(2, content);
	        pstmt.setInt(3, num);
	        
	        int result = pstmt.executeUpdate();
	        
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
	
}
