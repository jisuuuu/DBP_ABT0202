package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

public class UserDAO {
	private JDBCUtil jdbcUtil = null;
	
	private static UserDAO instance = new UserDAO();

	// �ڽ��� ��ü�� �����ϴ� �޼ҵ� ����
	public static UserDAO getInstance() {
		return instance;
	}
	
	public UserDAO() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil ��ü ����
	}
	
	//����� ����
	public int create(User user) throws SQLException {
		String sql = "INSERT INTO CONSUMER (consumer_id, password, nickname, interest1, interest2, interest3) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";		
		Object[] param = new Object[] {user.getUser_id(), user.getPassword(), user.getNickname(), 
				user.getInterest1(), user.getInterest2(), user.getInterest3()};				
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil �� insert���� �Ű� ���� ����
						
		try {				
			int result = jdbcUtil.executeUpdate();	// insert �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}		
		return 0;			
	}
	
	
	
	/**
	 * �־��� ����� ID�� �ش��ϴ� ����� ������ �����ͺ��̽����� ã�� User ������ Ŭ������ 
	 * �����Ͽ� ��ȯ.
	 */
	public User findUser(String user_id) throws SQLException {
        String sql = "SELECT password, nickname, total_point, interest1, interest2, interest3 "
        			+ "FROM CONSUMER WHERE consumer_id = ? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {user_id});	// JDBCUtil�� query���� �Ű� ���� ����

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query ����
			if (rs.next()) {						
				User user = new User( user_id, rs.getString("password"), rs.getString("nickname"), rs.getInt("total_point"), 
						rs.getString("interest1"), rs.getString("interest2"), rs.getString("interest3") );
				return user;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}
	
	
	
	/**
	 * �־��� ����� ID�� �ش��ϴ� ����ڰ� �����ϴ��� �˻� 
	 */
	public boolean existingUser(String userId) throws SQLException {
		String sql = "SELECT count(*) FROM CONSUMER WHERE consumer_id=?";      
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	// JDBCUtil�� query���� �Ű� ���� ����

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query ����
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return false;
	}
		
	
	
	
	
	
	
	
	
	/**
	 * ��ü ����� ������ �˻��Ͽ� List�� ���� �� ��ȯ
	 */
	public List<User> findUserList() throws SQLException {
        String sql = "SELECT consumer_id, password, nickname, total_point, interest1, interest2, interest3 " 
        		   + "FROM CONSUMER";
		jdbcUtil.setSqlAndParameters(sql, null);		// JDBCUtil�� query�� ����
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query ����			
			List<User> userList = new ArrayList<User>();	// User���� ����Ʈ ����
			while (rs.next()) {
				User user = new User(			// User ��ü�� �����Ͽ� ���� ���� ������ ����
					rs.getString("consumer_id"),
					rs.getString("password"),
					rs.getString("nickname"),
					rs.getInt("total_point"),
					rs.getString("interest1"),
					rs.getString("interest2"),
					rs.getString("interest3"));	
				userList.add(user);				// List�� User ��ü ����
			}		
			return userList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}
	
	/**
	 * ��ü ����� ������ �˻��� �� ���� �������� �������� ����� ����� ���� �̿��Ͽ�
	 * �ش��ϴ� ����� �������� List�� �����Ͽ� ��ȯ.
	 */
	public List<User> findUserList(int currentPage, int countPerPage) throws SQLException {
        String sql = "SELECT consumer_id, password, nickname, total_point, interest1, interest2, interest3 " 
        		   + "CONSUMER ORDER BY consumer_id";
		jdbcUtil.setSqlAndParameters(sql, null,					// JDBCUtil�� query�� ����
				ResultSet.TYPE_SCROLL_INSENSITIVE,				// cursor scroll ����
				ResultSet.CONCUR_READ_ONLY);						
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();				// query ����			
			int start = ((currentPage-1) * countPerPage) + 1;	// ����� ������ �� ��ȣ ���
			if ((start >= 0) && rs.absolute(start)) {			// Ŀ���� ���� ������ �̵�
				List<User> userList = new ArrayList<User>();	// User���� ����Ʈ ����
				do {
					User user = new User(		// User ��ü�� �����Ͽ� ���� ���� ������ ����
							rs.getString("consumer_id"),
							rs.getString("password"),
							rs.getString("nickname"),
							rs.getInt("total_point"),
							rs.getString("interest1"),
							rs.getString("interest2"),
							rs.getString("interest3"));	
					userList.add(user);							// ����Ʈ�� User ��ü ����
				} while ((rs.next()) && (--countPerPage > 0));		
				return userList;							
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}

}
