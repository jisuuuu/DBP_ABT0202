package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.Post;
import model.Review;
import java.text.*;
import java.util.*;

public class ReviewDAO {
	private JDBCUtil jdbcUtil = null;
	private ResultSet rs;
    private static ReviewDAO instance;
	
	public ReviewDAO() {
		jdbcUtil = new JDBCUtil();
	}

    public static ReviewDAO getInstance(){
        if(instance == null)
            instance = new ReviewDAO();
        return instance;
    }
    
    // ���� ����
 	public int create(Review review) throws SQLException {
 			
 		int result = 0;
 		String sql = "";
 		Object[] param = null;		
 			
 		sql = "INSERT INTO REVIEW (review_id, post_id, consumer_id, content) VALUES (REVIEW_ID_SEQUENCE.nextval, ?, ?, ?)";
 		   param = new Object[] { review.getPost_id(), review.getConsumer_id(), review.getReview_content() };
 		
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
    
    // ��� ��� ��������
    public List<Review> getReviewList(int postNum)
    {
    	String sql = "SELECT * FROM REVIEW where post_id=?";
    	Object[] param = new Object[] {postNum};
		jdbcUtil.setSqlAndParameters(sql, param);		
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();				
			List<Review> reviewList = new ArrayList<Review>();	
			
			
			while (rs.next()) {
				//DateFormat df = new java.text.SimpleDateFormat("yyyy.MM.dd a h:mm");
				//Date utilDate = new java.util.Date(rs.getDate("upload_date").getTime());
				//String dateString = df.format(utilDate);
				
				Review review = new Review(
						postNum,
						rs.getInt("review_id"), 
						rs.getString("consumer_id"),
						rs.getString("content"));	
					reviewList.add(review);	
				
			}		
			return reviewList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
    } // end getCommentList
    
	
}
