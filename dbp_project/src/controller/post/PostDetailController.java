package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.dao.PostDAO;

public class PostDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String post_id = (String)request.getParameter("postId");
		PostDAO post = new PostDAO();
		request.setAttribute("post", post.findPost(post_id));
		
		return "/post/detail.jsp";
	}

}
