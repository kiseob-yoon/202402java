package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dto.Board;
import dto.Like_dislikes;
import dto.Member;
import util.Cookies;

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
		    Class.forName("oracle.jdbc.driver.OracleDriver");
		    conn = DriverManager.getConnection(
	        		"jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
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
						rs.getString("regtime"), rs.getInt("hits"),rs.getInt("likes"));
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
		return num;
	}


	public int insert(Board board) {
		PreparedStatement pstmt = null;
		String curTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		try {
			String sql = "INSERT INTO board (num, writer, title, content, regtime, hits, likes, dislikes, memberno) VALUES (SEQ_BOARD.nextval, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS'), 0, 0, 0, ?)";
			pstmt = conn.prepareStatement(sql);
			
	        pstmt.setString(1, board.getWriter());
	        pstmt.setString(2, board.getTitle());
	        pstmt.setString(3, board.getContent());
	        pstmt.setString(4, curTime);
	        pstmt.setInt(5, board.getMemberno());
	        
	        int result = pstmt.executeUpdate();
	        
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
        
        int result = pstmt.executeUpdate();
        
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	return 0;
}
public Board selectForLogin2(int num, String writer) {
	Board board = null;
	String sql = "select * from board where num = ? and writer = ?";
	PreparedStatement pstmt;

	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setString(2, writer);
		
		ResultSet rs = pstmt.executeQuery();	
		if(rs.next()) {
			board = new Board(rs.getInt("num"), rs.getString("writer"), 
					rs.getString("title"), rs.getString("content"),
					rs.getString("regtime"), rs.getInt("hits"),
					rs.getInt("likes"),rs.getInt("dislikes"), rs.getInt("memberno"));
		}

	}	catch (SQLException e) {
		e.printStackTrace();
	}
	return board;

}
public ArrayList<Board> selectFit(String name,String title) { //메서드 호출 시 ArrayList에 Board 객체들을 저장하고 반환할 수 있음 
	ArrayList<Board> list = new ArrayList<Board>(); //ArrayList를 생성
	String sql = "select * from board where writer like ? OR title LIKE ? order by num desc"; //db에서 쿼리문 따옴
	PreparedStatement pstmt; 
	try {
		pstmt = conn.prepareStatement(sql); //sql문을 포함해서 객체 생성
		pstmt.setString(1, "%" + name + "%");
		pstmt.setString(2, "%" + title + "%"); 
		ResultSet rs = pstmt.executeQuery(); //ResultSet에 객체를 담아둠

		while (rs.next()) { //rs에 담아둔 객체를 반복해서 찍어낸다.
			Board board = new Board(rs.getInt("num"), rs.getString("writer"), 
					rs.getString("title"), rs.getString("content"),
					rs.getString("regtime"), rs.getInt("hits"),
					rs.getInt("likes"),rs.getInt("dislikes"), rs.getInt("memberno"));
			list.add(board); //찍어낸 값을 arraylist에 넣어줌

		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	return list;

}


public int like(int num) { 
	String sql = "update board set likes=likes+1 where num = ?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, num);
        int result = pstmt.executeUpdate();
        return result;
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	return 0;
	
}

public int cancel(int num) { 
	String sql = "update board set likes=likes-1 where num = ?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, num);
        int result = pstmt.executeUpdate();
        return result;
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	return 0;
	
}


public boolean hasUserLiked(String userId, HttpServletRequest request) {
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("likeCookie") && cookie.getValue().equals(userId)) {
                return true; // 이미 누른 경우 true 반환
            }
        }
    }
    return false; // 아직 누르지 않은 경우 false 반환
}


public void setLikeCookie(HttpServletResponse response, String userId) {
    Cookie likeCookie = new Cookie("likeCookie", userId);
    likeCookie.setMaxAge(24 * 60 * 60); 
    response.addCookie(likeCookie);
}


void increaseLikeCount() {
    System.out.println("좋아요 수가 증가했습니다.");
}

public static void removeLikeCookie(HttpServletRequest request, HttpServletResponse response, String userId) {
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("likeCookie") && cookie.getValue().equals(userId)) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                break; 
            }
        }
    }
}






}