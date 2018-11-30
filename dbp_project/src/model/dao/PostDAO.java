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
		jdbcUtil = new JDBCUtil(); // JDBCUtil 객체 생성
	}

	// 글 생성
	public int create(Post post) throws SQLException {
		
		String sql = "";
		Object[] param = null;
		if (post.getPost_file() == "") {
			
			 sql = "INSERT INTO POST (post_id, title, content, consumer_id, file_link, usage, THUMNAIL) "
					+ "VALUES (POST_ID_SEQUENCE.nextval, ?, ?, ?, ?, ?, ?)";
			 param = new Object[] { post.getTitle(), post.getContent(), 
						post.getConsumer_id(), post.getFile_link(), post.getUsage() ,post.getThumnail()};
		}
		else {
			
			sql = "INSERT INTO POST (post_id, title, content, consumer_id, post_file, usage, THUMNAIL) "
					+ "VALUES (POST_ID_SEQUENCE.nextval, ?, ?, ?, ?, ?, ?)";
			 param = new Object[] { post.getTitle(), post.getContent(), 
						post.getConsumer_id(), post.getPost_file(), post.getUsage(), post.getThumnail()};
		}
			
	
			jdbcUtil.setSqlAndParameters(sql, param); // JDBCUtil 에 insert문과 매개 변수 설정

			try {
				int result = jdbcUtil.executeUpdate(); // insert 문 실행
				return result;
			} catch (Exception ex) {
				jdbcUtil.rollback();
				ex.printStackTrace();
			} finally {
				jdbcUtil.commit();
				jdbcUtil.close(); // resource 반환
			}
		
		return 0;
	}

	//글 목록 불러오기
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
					rs.getString("usage"), rs.getString("thumnail"));	
				postList.add(post);				
			}		
			return postList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	
	
	//글 하나 불러오기
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
						rs.getString("usage"), rs.getString("thumnail"));	
									
				}		
				return post;					
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				jdbcUtil.close();		// resource 반환
			}
			return null;
		}
}
