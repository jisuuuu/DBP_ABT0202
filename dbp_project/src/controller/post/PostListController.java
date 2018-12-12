package controller.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Post;
import model.dao.PostDAO;

public class PostListController implements Controller {
	
	PostDAO postDAO = new PostDAO();

	

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String sort = (String)request.getParameter("sort");
		
		if(sort == null) { //�׺�ٿ��� ó�� �� ����Ʈ �ҷ������� �ֽż� ����
			List<Post> postList = postDAO.findPostList();
	    	request.setAttribute("postList", postList);	
		}
		else if (sort.equals("downcount")){
			List<Post> postList = postDAO.findPostListDown("list");
	    	request.setAttribute("postList", postList);	
		}
		
		return "/post/post_list.jsp";
	}
		

}