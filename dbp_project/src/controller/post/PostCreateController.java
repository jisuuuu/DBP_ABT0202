package controller.post;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.DispatcherServlet;
import controller.post.MultipartHttpServletRequest;
import model.Post;
import model.dao.PostDAO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class PostCreateController implements Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(PostCreateController.class);

	private PostDAO postDAO = null; 
	Post post = null;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		Post post = null;
		

		MultipartHttpServletRequest multipartRequest = new MultipartHttpServletRequest(request);
		post = multipartRequest.post;
		logger.debug(post.toString());

		postDAO = new PostDAO();
		postDAO.create(post);
		Post p2 = postDAO.findPost2((String)session.getAttribute("user"), request.getParameter("post_title"), 
					request.getParameter("post_content"));
		

		request.setAttribute("post", p2);
	
//		return "/post/show.jsp";	
		return "/main/main";
	}

}
