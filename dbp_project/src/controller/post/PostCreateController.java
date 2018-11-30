package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.Post;
import model.dao.PostDAO;




public class PostCreateController implements Controller {

	private PostDAO postDAO = null; 
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		Post post = null;
		
		//링크 첨부할 경우
		if ( request.getParameter("file") == "") {
			post = new Post( 
					(String)session.getAttribute("user"), request.getParameter("post_title"), 
					request.getParameter("post_content"), request.getParameter("file_link"), 
					request.getParameter("usage") );
		}
		
		postDAO = new PostDAO();
		postDAO.create(post);
		return "redirect:/user/list";		
	}

}
