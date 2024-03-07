package com.board;

public class MemberDto {
	private int memebrno;
	private String id;
	private String pw;
	private String name;
	
	public MemberDto(int memebrno, String id, String pw, String name) {
		super();
		this.memebrno = memebrno;
		this.id = id;
		this.pw = pw;
		this.name = name;
	}
	
	public MemberDto() {}

	public int getMemebrno() {
		return memebrno;
	}

	public void setMemebrno(int memebrno) {
		this.memebrno = memebrno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "MemberDto [memebrno=" + memebrno + ", id=" + id + ", pw=" + pw + ", name=" + name + "]";
	}
	
	
	
}
