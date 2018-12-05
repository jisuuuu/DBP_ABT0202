package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.dao.PostDAO;

public class PostDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String post_id = (String)request.getParameter("postId");
		
		String pri = "/post/detail?postId=" + post_id; 
		
		if (!UserSessionUtils.isLogined(request.getSession())) {
    		
    		HttpSession session = request.getSession();
            session.setAttribute("url_prior_login", pri);
    	
            return "redirect:/user/login/form";		// login form 요청으로 redirect
        }
		
		
		PostDAO post = new PostDAO();
		request.setAttribute("post", post.findPost(post_id));
		
		return "/post/show.jsp";
	}

}
