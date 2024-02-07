package thread;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class WinEmp extends JFrame {
	
	JTextField tf1 = new JTextField(5);
	JTextField tf2 = new JTextField(5);
	JTextField tf3 = new JTextField(5);
	
	JButton bt1 = new JButton("전체 내용");
	JButton bt2 = new JButton("입력");
	JButton bt3 = new JButton("이름 검색");
	JButton bt4 = new JButton("수정");
	JButton bt5 = new JButton("삭제");
	JTextArea ta = new JTextArea(10, 40);
	Connection conn;
	Statement stmt;
	class Clock implements Runnable{
		@Override
		public void run() {
			for(;;) {
				LocalDateTime localDateTime = LocalDateTime.now();
				String localDateTimeFormat1 = 
						localDateTime.format(
								DateTimeFormatter.
								ofPattern("yyyy년 MM월 dd일 HH시 mm분 ss초"));
				
//				System.out.println(localDateTimeFormat1);
				WinEmp.this.setTitle(localDateTimeFormat1); //내부 클래스에서 외부 클래스를 참조하고 this(자기자신)인 Clock에 localDateTimeFormat1의 형식을 클래스에 저장함 
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
	}
	public WinEmp() {
		String url = "jdbc:mysql://localhost:3306/firm";
		String id = "root";
		String pass = "mysql";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url,id,pass);
			stmt = conn.createStatement();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		JLabel lb1 = new JLabel("부서코드:");
		JLabel lb2 = new JLabel("부서명:");
		JLabel lb3 = new JLabel("부서위치:");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Container con = this.getContentPane();
		con.setLayout(new BorderLayout());
		JPanel jp1 = new JPanel(new FlowLayout());
		jp1.add(bt1); jp1.add(bt2); jp1.add(bt3); 
		jp1.add(bt4); jp1.add(bt5);
		con.add(jp1, BorderLayout.SOUTH);
		JScrollPane scroll = new JScrollPane(ta);
		JPanel jp2 = new JPanel(new FlowLayout());
		jp2.add(scroll);
		con.add(jp2, BorderLayout.CENTER);
		
		JPanel jp3 = new JPanel(new FlowLayout());
		con.add(jp3, BorderLayout.NORTH);
		jp3.add(lb1); jp3.add(tf1);
		jp3.add(lb2); jp3.add(tf2);
		jp3.add(lb3); jp3.add(tf3);
		
//		Clock clock = new Clock(); //설계된 클래스로 객체를 생성
//		Thread th = new Thread(clock); clock 주소를 받아서 스레드 객체를 생성하였고 clock의 run메서드를 실행가능함
//		th.start(); // 스레드를 start함
		
		Clock2 clock2 = new Clock2(this); //생성자로 WinEmp(자기자신)을 전달
		Thread th = new Thread(clock2); //clock2의 클래스를 스레드가 받아냄
		th.start(); // 스레드를 시작함
		
		this.setTitle("dept 관리");
		this.setLocation(500, 400);
		this.setSize(500, 300);
		this.setVisible(true);
		
		bt1.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				select();
				
			}
		});
		bt2.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				insert();
				clearTextField();
				select();
			}
		});
		bt3.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				select2();
				
			}
		});
	}
	
	private void clearTextField() {
		tf1.setText(""); tf2.setText(""); tf3.setText("");
	}
	
	public void select() {
		String sql = "select deptno, dname, loc from dept";
		try {
			ResultSet rs = stmt.executeQuery(sql);
			ta.setText("");
			while(rs.next()) {
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				String str = String.format("%d, %s, %s\n", 
						                   deptno, dname, loc);
				ta.append(str);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void insert() {
		String sql = String.format(
	    "insert into dept values(%s, '%s', '%s')",
	     tf1.getText(), tf2.getText(), tf3.getText());
		try {
//			System.out.println(sql);
			int res = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void select2() {
		String sql = String.format("select deptno, dname, loc from dept where dname = '%s'", tf2.getText());
		try {
			ResultSet rs = stmt.executeQuery(sql);
			ta.setText("");
			if(rs.next()) {
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				String str = String.format("%d, %s, %s\n", 
						                   deptno, dname, loc);
				ta.append(str);
				tf1.setText(deptno+"");
				tf3.setText(loc);
			} else {
				tf1.setText("");
				tf2.setText("");
				tf3.setText("");
				ta.append("해당 자료 없습니다.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		new WinEmp();
	}
}