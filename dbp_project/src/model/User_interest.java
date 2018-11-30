package model;

public class User_interest extends User {	//user_id�� �ĺ��ϹǷ� ��ӹ���
	private String interest1 = "";
	private String interest2 = "";
	private String interest3 = "";
	private String interest4 = "";
	
	//������ 4��
	public User_interest(String user_id, String interest1) {	//�⺻���� interest�� �Ѱ� ������ ���� (1~4������ ����)
		super(user_id);
		this.interest1 = interest1;
	}
	
	public User_interest(String user_id, String interest1, String interest2) {
		super(user_id);
		this.interest1 = interest1;
		this.interest2 = interest2;
	}
	
	public User_interest(String user_id, String interest1, String interest2, String interest3) {
		super(user_id);
		this.interest1 = interest1;
		this.interest2 = interest2;
		this.interest3 = interest3;
	}
	
	public User_interest(String user_id, String interest1, String interest2, String interest3, String interest4) {
		super(user_id);
		this.interest1 = interest1;
		this.interest2 = interest2;
		this.interest3 = interest3;
		this.interest4 = interest4;
	}


	
	public String getInterest1() {
		return interest1;
	}
	public void setInterest1(String interest1) {
		this.interest1 = interest1;
	}
	public String getInterest2() {
		return interest2;
	}
	public void setInterest2(String interest2) {
		this.interest2 = interest2;
	}
	public String getInterest3() {
		return interest3;
	}
	public void setInterest3(String interest3) {
		this.interest3 = interest3;
	}
	public String getInterest4() {
		return interest4;
	}
	public void setInterest4(String interest4) {
		this.interest4 = interest4;
	}
	
}
