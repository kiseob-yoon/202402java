package dto;

public class Comment {
	private int num;
	private String writer;
	private String regtime;
	private String content;
	
	public Comment(int num, String writer, String regtime, String content) {
		super();
		this.num = num;
		this.writer = writer;
		this.regtime = regtime;
		this.content = content;
	}
	
	public Comment(String writer, String content) {
		super();
		this.writer = writer;
		this.content = content;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Comment [num=" + num + ", writer=" + writer + ", regtime=" + regtime + ", content=" + content + "]";
	}
	
	

}
