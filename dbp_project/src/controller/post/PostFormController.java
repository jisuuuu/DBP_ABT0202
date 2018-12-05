package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;

public class PostFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// �α��� �������� �α�������
    	if (!UserSessionUtils.isLogined(request.getSession())) {
    		
    		HttpSession session = request.getSession();
            session.setAttribute("url_prior_login", "/post/create/form");
    	
            return "redirect:/user/login/form";		// login form ��û���� redirect
        }
		return "/post/create.jsp";
	}

}
