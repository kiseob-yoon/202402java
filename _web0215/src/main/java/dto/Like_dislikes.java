package dto;

public class Like_dislikes {
	private int like_dislike_id;
	private int num;
	private String user;
	private Boolean is_like;
	
	
	public Like_dislikes(int like_dislike_id, int num, String user, Boolean is_like) {
		super();
		this.like_dislike_id = like_dislike_id;
		this.num = num;
		this.user = user;
		this.is_like = is_like;
	}
	

	public Like_dislikes(int num, Boolean is_like) {
		super();
		this.num = num;
		this.is_like = is_like;
	}


	public Like_dislikes(int num, String user, Boolean is_like) {
		super();
		this.num = num;
		this.user = user;
		this.is_like = is_like;
	}


	public int getLike_dislike_id() {
		return like_dislike_id;
	}


	public void setLike_dislike_id(int like_dislike_id) {
		this.like_dislike_id = like_dislike_id;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getUser() {
		return user;
	}


	public void setUser(String user) {
		this.user = user;
	}


	public Boolean getIs_like() {
		return is_like;
	}


	public void setIs_like(Boolean is_like) {
		this.is_like = is_like;
	}


	@Override
	public String toString() {
		return "Like_dislikes [like_dislike_id=" + like_dislike_id + ", num=" + num + ", user=" + user + ", is_like="
				+ is_like + "]";
	}
	
	
	
	
	
}
