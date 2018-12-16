package controller.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Post;
import model.User;
import model.dao.PostDAO;
import model.dao.UserDAO;

public class PostListController implements Controller {
	
	PostDAO postDAO = new PostDAO();
	UserDAO userDAO = new UserDAO();

	

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		
		String sort = (String)request.getParameter("sort");
		
		if(sort == null) { //�׺�ٿ��� ó�� �� ����Ʈ �ҷ������� �ֽż� ����
			List<Post> postList = postDAO.findPostList();
	    	request.setAttribute("postList", postList);	
		}
		else if (sort.equals("downcount")){
			List<Post> postList = postDAO.findPostListDown("list");
	    	request.setAttribute("postList", postList);	
		}
		
		
		
		if (session.getAttribute("user") != null) {
			User user = userDAO.findUser( (String)session.getAttribute("user") );
			List<Post> recomList = postDAO.findPostListByColor(user.getInterest1(), user.getInterest2(), user.getInterest3());
    		request.setAttribute("recomList", recomList);	}
			
		
		return "/post/post_list.jsp";
	}
		

}