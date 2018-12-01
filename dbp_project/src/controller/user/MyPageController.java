package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.service.UserManager;
import model.service.UserNotFoundException;
import model.User;

public class MyPageController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	if (!UserSessionUtils.isLogined(request.getSession())) {
    		return "redirect:/user/login/form";		// login form 요청으로 redirect
        }
    		
    	User user = null;
    	String userId = request.getParameter("user_id");
    	UserManager manager = UserManager.getInstance();
    	
    	try {
    		user = manager.findUser(userId);
    	}catch(UserNotFoundException e) {
    		return "redirect:/user/list";
    	}
    	
    	request.setAttribute("user", user);
    	return "/user/mypage.jsp";
    	
    }
}
