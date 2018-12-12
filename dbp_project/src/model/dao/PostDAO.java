package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Post;
import java.text.*;
import java.util.*;

public class PostDAO {
	private JDBCUtil jdbcUtil = null;

	public PostDAO() {
		jdbcUtil = new JDBCUtil();
	}

	// �� ����
	public int create(Post post) throws SQLException {
		
		int result = 0;
		String sql = "";
		Object[] param = null;		
		
		if (post.getPost_file() == "") {
			
			 sql = "INSERT INTO POST (post_id, title, content, consumer_id, file_link, usage, THUMNAIL, COLOR1, COLOR2) "
					+ "VALUES (POST_ID_SEQUENCE.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
			 param = new Object[] { post.getTitle(), post.getContent(), 
						post.getConsumer_id(), post.getFile_link(), post.getUsage() ,post.getThumnail(), post.getColor1(), post.getColor2()};
		}
		else {
			
			sql = "INSERT INTO POST (post_id, title, content, consumer_id, post_file, usage, THUMNAIL, COLOR1, COLOR2) "
					+ "VALUES (POST_ID_SEQUENCE.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
			 param = new Object[] { post.getTitle(), post.getContent(), 
						post.getConsumer_id(), post.getPost_file(), post.getUsage(), post.getThumnail(), post.getColor1(), post.getColor2()};
		}
			
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
	
	
	//Download Count ����
	public int DownLoadCount(int post_id) throws SQLException {
		
		int result = 0;
		String sql = "";
		Object[] param = null;
		
		sql = "UPDATE POST SET down_count = down_count + 1 WHERE post_id = ?";
		param = new Object[] {post_id} ;	
		
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
	
	//�� ��� �ҷ����� �ٿ�ε� ��
		public  List<Post> findPostListDown(String where) throws SQLException {
			String sql;
			if (where.equals("main")) {
				sql = "SELECT * " + "FROM POST WHERE ROWNUM >= 1 AND ROWNUM <= 9 ORDER BY down_count DESC";}
			else {
				sql = "SELECT * " + "FROM POST ORDER BY down_count DESC";}
			jdbcUtil.setSqlAndParameters(sql, null);		
						
			try {
				ResultSet rs = jdbcUtil.executeQuery();				
				List<Post> postList = new ArrayList<Post>();	
				
				
				
				while (rs.next()) {
					DateFormat df = new java.text.SimpleDateFormat("yyyy.MM.dd a h:mm");
					Date utilDate = new java.util.Date(rs.getDate("upload_date").getTime());
					String dateString = df.format(utilDate);
					
					Post post = new Post(
						rs.getInt("post_id"), rs.getString("consumer_id"),
						rs.getString("title"), rs.getString("content"),
						rs.getString("post_file"), rs.getString("file_link"),
						rs.getInt("down_count"), dateString, 
						rs.getString("usage"), rs.getString("thumnail"),
						rs.getString("color1"), rs.getString("color2"));	
					postList.add(post);				
				}		
				return postList;					
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				jdbcUtil.close();		// resource ��ȯ
			}
			return null;
		}

	//�� ��� �ҷ����� - �ֽż�
	public  List<Post> findPostList() throws SQLException {
        String sql = "SELECT * " + "FROM POST ORDER BY upload_date DESC";
		jdbcUtil.setSqlAndParameters(sql, null);		
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();				
			List<Post> postList = new ArrayList<Post>();	
			
			
			
			while (rs.next()) {
				DateFormat df = new java.text.SimpleDateFormat("yyyy.MM.dd a h:mm");
				Date utilDate = new java.util.Date(rs.getDate("upload_date").getTime());
				String dateString = df.format(utilDate);
				
				Post post = new Post(
					rs.getInt("post_id"), rs.getString("consumer_id"),
					rs.getString("title"), rs.getString("content"),
					rs.getString("post_file"), rs.getString("file_link"),
					rs.getInt("down_count"), dateString, 
					rs.getString("usage"), rs.getString("thumnail"),
					rs.getString("color1"), rs.getString("color2"));	
				postList.add(post);				
			}		
			return postList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}
	
	
	//������ �� ��� �ҷ�����
		public  List<Post> findPostListByUser(String user_id) throws SQLException {
	        String sql = "SELECT * " + "FROM POST WHERE consumer_id = ? ORDER BY upload_date DESC";
	        Object[] param = new Object[] {user_id} ;
			jdbcUtil.setSqlAndParameters(sql, param);		
						
			try {
				ResultSet rs = jdbcUtil.executeQuery();				
				List<Post> postList = new ArrayList<Post>();	
				
				
				
				while (rs.next()) {
					DateFormat df = new java.text.SimpleDateFormat("yyyy.MM.dd a h:mm");
					Date utilDate = new java.util.Date(rs.getDate("upload_date").getTime());
					String dateString = df.format(utilDate);
					
					Post post = new Post(
						rs.getInt("post_id"), rs.getString("consumer_id"),
						rs.getString("title"), rs.getString("content"),
						rs.getString("post_file"), rs.getString("file_link"),
						rs.getInt("down_count"), dateString, 
						rs.getString("usage"), rs.getString("thumnail"),
						rs.getString("color1"), rs.getString("color2"));	
					postList.add(post);				
				}		
				return postList;					
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				jdbcUtil.close();		// resource ��ȯ
			}
			return null;
		}
	
	
	//�� �ϳ� �ҷ�����
		public  Post findPost(String user_id) throws SQLException {
	        String sql = "SELECT * " + "FROM POST " + "WHERE post_id = " + user_id;
			jdbcUtil.setSqlAndParameters(sql, null);	
			
			Post post = null;
						
			try {
				ResultSet rs = jdbcUtil.executeQuery();				
					
				while (rs.next()) {
					DateFormat df = new java.text.SimpleDateFormat("yyyy.MM.dd a h:mm");
					Date utilDate = new java.util.Date(rs.getDate("upload_date").getTime());
					String dateString = df.format(utilDate);
					
					post = new Post(
						rs.getInt("post_id"), rs.getString("consumer_id"),
						rs.getString("title"), rs.getString("content"),
						rs.getString("post_file"), rs.getString("file_link"),
						rs.getInt("down_count"), dateString, 
						rs.getString("usage"), rs.getString("thumnail"),
						rs.getString("color1"), rs.getString("color2"));	
									
				}		
				return post;					
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				jdbcUtil.close();		// resource ��ȯ
			}
			return null;
		}
		
		
		//��  �ҷ�����2
		public Post findPost2(String user_id, String Title, String Content) throws SQLException {
			        String sql = "SELECT * " + "FROM POST " + "WHERE consumer_id = ? and title = ? and content = ?";
			        Object[] param = new Object[] { user_id, Title, Content};
					jdbcUtil.setSqlAndParameters(sql, param);	
					
					Post post = null;
					
					try {
						ResultSet rs = jdbcUtil.executeQuery();				
							
						while (rs.next()) {
							DateFormat df = new java.text.SimpleDateFormat("yyyy.MM.dd a h:mm");
							Date utilDate = new java.util.Date(rs.getDate("upload_date").getTime());
							String dateString = df.format(utilDate);
							
							post = new Post(
								rs.getInt("post_id"), rs.getString("consumer_id"),
								rs.getString("title"), rs.getString("content"),
								rs.getString("post_file"), rs.getString("file_link"),
								rs.getInt("down_count"), dateString, 
								rs.getString("usage"), rs.getString("thumnail"),
								rs.getString("color1"), rs.getString("color2"));	
											
						}		
						return post;					
						
					} catch (Exception ex) {
						ex.printStackTrace();
					} finally {
						jdbcUtil.close();		// resource ��ȯ
					}
					return null;
				}
		
		
		//�ٿ���� �� ��� �ҷ�����
				public  List<Post> findPostListByDown(String user_id) throws SQLException {
			        String sql = "SELECT post.post_id, post.title, post.usage, post.color1, post.color2 " + 
			        		"FROM post, point " + 
			        		"WHERE post.post_id = point.post_id AND point.use_or_get = ? AND point.consumer_id = ?";
			        Object[] param = new Object[] {"use", user_id} ;
					jdbcUtil.setSqlAndParameters(sql, param);		
								
					try {
						ResultSet rs = jdbcUtil.executeQuery();				
						List<Post> postList = new ArrayList<Post>();	
						while (rs.next()) {
							Post post = new Post(
								rs.getInt("post_id"), rs.getString("title"),
								rs.getString("usage"),
								rs.getString("color1"), rs.getString("color2"));	
							postList.add(post);				
						}		
						return postList;					
						
					} catch (Exception ex) {
						ex.printStackTrace();
					} finally {
						jdbcUtil.close();		// resource ��ȯ
					}
					return null;
				}

}

