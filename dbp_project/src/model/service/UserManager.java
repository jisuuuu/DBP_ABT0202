package model.service;

import java.sql.SQLException;
import java.util.List;

import model.User;
import model.dao.UserDAO;

/**
 * ����� ���� API�� ����ϴ� �����ڵ��� ���� �����ϰ� �Ǵ� Ŭ����.
 * UserDAO�� �̿��Ͽ� �����ͺ��̽��� ������ ���� �۾��� �����ϵ��� �ϸ�,
 * �����ͺ��̽��� �����͵��� �̿��Ͽ� �����Ͻ� ������ �����ϴ� ������ �Ѵ�.
 * �����Ͻ� ������ ������ ��쿡�� �����Ͻ� �������� �����ϴ� Ŭ������ 
 * ������ �� �� �ִ�.
 */
public class UserManager {
	private static UserManager userMan = new UserManager();
	private UserDAO userDAO; 

	private UserManager() {
		try {
			userDAO = new UserDAO();
			
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static UserManager getInstance() {
		return userMan;
	}
	
	public int create(User user) throws SQLException, ExistingUserException {
		if (userDAO.existingUser(user.getUser_id()) == true) {
			throw new ExistingUserException( user.getUser_id() + "�� �̹� �����ϴ� ���̵��Դϴ�.");
		}
		return userDAO.create(user);
	}

	                                      

	public User findUser(String userId)
		throws SQLException, UserNotFoundException {
		User user = userDAO.findUser(userId);
		
		return user;
	}
	
	public User findUser2(String userId)
			throws SQLException, UserNotFoundException {
			User user = userDAO.findUser(userId);
			
			if (user == null) {
				throw new UserNotFoundException(userId + "�� �������� �ʴ� ���̵��Դϴ�.");
			}
			return user;
		}

	

	public boolean login(String userId, String password)
		throws SQLException, UserNotFoundException, PasswordMismatchException {
		User user = findUser2(userId);

		if (!user.matchPassword(password)) {
			throw new PasswordMismatchException("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		}
		return true;
	}

	

	public UserDAO getUserDAO() {
		return this.userDAO;
	}
	
	
	
	
	public List<User> findUserList() throws SQLException {
		return userDAO.findUserList();
}

public List<User> findUserList(int currentPage, int countPerPage)
	throws SQLException {
	return userDAO.findUserList(currentPage, countPerPage);
}
}
