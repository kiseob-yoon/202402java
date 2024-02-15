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

public class BoardDao {
	private static Connection conn;
	private static BoardDao dao = new BoardDao(); //유일한 인스턴스
	private BoardDao() {} // 생성자를 private으로 하여 외부에서 생성못하게 막음
	public static BoardDao getInstance() { //외부에서 메서드 호출하면
		BoardDao.getConnection(); //getConnection메소드 호출
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

	public ArrayList<Board> selectList() { //메서드 호출 시 ArrayList에 Board 객체들을 저장하고 반환할 수 있음 
		ArrayList<Board> list = new ArrayList<Board>(); //ArrayList를 생성
		String sql = "select * from board order by num desc"; //db에서 쿼리문 따옴
		PreparedStatement pstmt; 
		try {
			pstmt = conn.prepareStatement(sql); //sql문을 포함해서 객체 생성 
			ResultSet rs = pstmt.executeQuery(); //ResultSet에 객체를 담아둠

			while (rs.next()) { //rs에 담아둔 객체를 반복해서 찍어낸다.
				Board board = new Board(rs.getInt("num"), rs.getString("writer"), 
						rs.getString("title"), rs.getString("content"),
						rs.getString("regtime"), rs.getInt("hits"));
				list.add(board); //찍어낸 값을 arraylist에 넣어줌
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;

	}
	public Board selectOne(int num, boolean inc) {
		String sql = "select * from board where num = ?";
		PreparedStatement pstmt;
		Board board = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();	
			if(rs.next()) {
				board = new Board(rs.getInt("num"), rs.getString("writer"), 
						rs.getString("title"), rs.getString("content"),
						rs.getString("regtime"), rs.getInt("hits"));
			}
			if(inc) {
				pstmt.executeUpdate("update board set hits=hits+1 where num=" + num);
			}

		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return board;

	}

	public int delete(int num) {
		String sql = "select * from board where num = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate("delete from board where num=" + num);

		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}


	public int insert(Board board) {
		PreparedStatement pstmt = null;
		String curTime = LocalDate.now() + " " + 
				LocalTime.now().toString().substring(0, 8);
		try {
			String sql = "INSERT INTO board (writer, title, content, regtime, hits) VALUES (?, ?, ?, ?, 0)";
			pstmt = conn.prepareStatement(sql);
			
	        pstmt.setString(1, board.getWriter());
	        pstmt.setString(2, board.getTitle());
	        pstmt.setString(3, board.getContent());
	        pstmt.setString(4, curTime);
	        
	        return pstmt.executeUpdate();
	        
		} catch(Exception e) {
			e.printStackTrace();
		} 
		
		return 0;
	}	



public int update(int num, String writer, String title, String content) {
	PreparedStatement pstmt = null;
	try {
		String sql = "update board set writer=?, title=?, content=? where num=?";
		pstmt = conn.prepareStatement(sql);
		
        pstmt.setString(1, writer);
        pstmt.setString(2, title);
        pstmt.setString(3, content);
        pstmt.setInt(4, num);
        
        return pstmt.executeUpdate();
        
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	return 0;
}

}