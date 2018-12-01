package controller;

import java.util.HashMap;
import java.util.Map;
import controller.user.*;
import controller.post.*;


public class RequestMapping {

    
     private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	
        mappings.put("/", new ForwardController("index.jsp"));
        
        //main page
        mappings.put("/main/main", new MainController());
        
        //user ����
        mappings.put("/user/list", new ListUserController());
        mappings.put("/user/login", new LoginController());
        mappings.put("/user/login/form", new ForwardController("/user/login.jsp"));
        mappings.put("/user/logout", new LogoutController());
        mappings.put("/user/mypage", new MyPageController());
        mappings.put("/user/register", new RegisterController());
        mappings.put("/user/register/form", new ForwardController("/user/register.jsp"));
        mappings.put("/user/register_ok", new ForwardController("/user/register_ok.jsp"));
        
        //post ���� 
        mappings.put("/post/create/form", new PostFormController());
        mappings.put("/post/create", new PostCreateController());
        mappings.put("/post/detail", new PostDetailController());
        
        //�ʱ� ��Ʈ��Ʈ��
        mappings.put("/boot", new ForwardController("bootstrap.jsp"));
    }

    public Controller findController(String uri) {	
        return mappings.get(uri);
    }
}
