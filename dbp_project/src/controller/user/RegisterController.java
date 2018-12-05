package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import controller.Controller;
import model.User;
import model.service.ExistingUserException;
import model.service.UserManager;

public class RegisterController implements Controller{

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		User user = new User(
			request.getParameter("user_id"),
			request.getParameter("nickname"),
			request.getParameter("password"),
			Integer.parseInt(request.getParameter("total_point")),
			request.getParameter("interest1"),
			request.getParameter("interest2"),
			request.getParameter("interest3")
		);
        

		try {
			UserManager manager = UserManager.getInstance();
			manager.create(user);
	        return "redirect:/user/register_ok";		// 성공 시 사용자 리스트 화면으로 redirect
	        
		} catch (ExistingUserException e) {		// 예외 발생 시 회원가입 form으로 f
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("user", user);
			return "/user/register.jsp";
		}
		
		
    }
}
