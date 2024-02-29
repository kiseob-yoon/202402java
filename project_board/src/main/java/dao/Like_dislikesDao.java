package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Board;
import dto.Like_dislikes;

public class Like_dislikesDao {
	private static Connection conn;
	private static Like_dislikesDao dao = new Like_dislikesDao(); //유일한 인스턴스
	private Like_dislikesDao() {} // 생성자를 private으로 하여 외부에서 생성못하게 막음
	public static Like_dislikesDao getInstance() { //외부에서 메서드 호출하면
		Like_dislikesDao.getConnection(); //getConnection메소드 호출
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

	
	
	public Like_dislikes select(int num, String user, Boolean is_like) {
	    String insertSql = "INSERT INTO like_dislikes (num, user, is_like) VALUES (?, ?, ?)";
	    String updateLikesSql = "UPDATE board SET likes = likes + 1 WHERE num = ?";
	    String updateDislikesSql = "UPDATE board SET dislikes = dislikes + 1 WHERE num = ?";
			PreparedStatement pstmtInsert;
	    PreparedStatement pstmtUpdate;
	    	Like_dislikes result = null;
	    
			try {
	        pstmtInsert = conn.prepareStatement(insertSql);
	        pstmtInsert.setInt(1, num);
	        pstmtInsert.setString(2, user);
	        pstmtInsert.setBoolean(3, is_like);
	        pstmtInsert.executeUpdate();

				if(is_like) {
					pstmtUpdate = conn.prepareStatement(updateLikesSql);
				} else {
	        pstmtUpdate = conn.prepareStatement(updateDislikesSql);
	      }

	      pstmtUpdate.setInt(1, num);
	      pstmtUpdate.executeUpdate();

	      result = new Like_dislikes(num, user, is_like);

			}	catch (SQLException e) {
				e.printStackTrace();
			}
			return result;

		}
	
	public Board selectOne(int num) {
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

		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return board;

	}

	
	
}
