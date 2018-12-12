package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Post;
import java.text.*;
import java.util.*;

public class PointDAO {
	private JDBCUtil jdbcUtil = null;

	public PointDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	//point Àû¸³
		public int GivePoint(String user_id) throws SQLException {
			
			int result = 0;
			String sql = "";
			Object[] param = null;
			
			sql = "UPDATE CONSUMER SET total_point = total_point + 10 WHERE consumer_id = ?";
			param = new Object[] {user_id} ;	
			
			jdbcUtil.setSqlAndParameters(sql, param); 
			

			try {
				result = jdbcUtil.executeUpdate();
				
			} catch (Exception ex) {
				jdbcUtil.rollback();
				ex.printStackTrace();
			} finally {
				jdbcUtil.commit();
				jdbcUtil.close();
				
			}
			
			return result;
			
		}
	
	//point ¼Ò¸ê
		public int TakePoint(String user_id) throws SQLException {
			
			int result = 0;
			String sql = "";
			Object[] param = null;
			
			sql = "UPDATE CONSUMER SET total_point = total_point - 5 WHERE consumer_id = ?";
			param = new Object[] {user_id} ;	
			
			jdbcUtil.setSqlAndParameters(sql, param); 
			

			try {
				result = jdbcUtil.executeUpdate();
				
			} catch (Exception ex) {
				jdbcUtil.rollback();
				ex.printStackTrace();
			} finally {
				jdbcUtil.commit();
				jdbcUtil.close();
				
			}
			
			return result;
			
		}
	
}
