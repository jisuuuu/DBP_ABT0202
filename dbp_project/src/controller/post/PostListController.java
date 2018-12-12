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
		
		if(sort == null) { //네비바에서 처음 글 리스트 불러왔을때 최신순 정렬
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