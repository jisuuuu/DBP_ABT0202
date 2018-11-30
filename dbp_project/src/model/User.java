package model;

public class User {

	private String user_id;
	private String nickname;
	private String password;
	private int total_point;
	
	public User(String user_id, String nickname, String password, int total_point) {
		super();
		this.user_id = user_id;
		this.nickname = nickname;
		this.password = password;
		this.total_point = 10;
	}
	public User(String user_id, String nickname, String password) {
		super();
		this.user_id = user_id;
		this.nickname = nickname;
		this.password = password;
	}
	
	public User(String user_id) {
		super();
		this.user_id = user_id;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getTotal_point() {
		return total_point;
	}
	public void setTotal_point(int total_point) {
		this.total_point = total_point;
	}
	
	
	/* 비밀번호 검사 */
	public boolean matchPassword(String password) {
		if (password == null) {
			return false;
		}
		return this.password.equals(password);
	}
	
	public boolean isSameUser(String userid) {
        return this.user_id.equals(userid);
    }

}
