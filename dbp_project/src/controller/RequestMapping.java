package controller;

import java.util.HashMap;
import java.util.Map;
import controller.user.*;
import controller.post.*;


public class RequestMapping {

    
    // �� ��û uri�� ���� controller ��ü�� ������ HashMap ����
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// �� uri�� �����Ǵ� controller ��ü�� ���� �� ����
        mappings.put("/", new ForwardController("index.jsp"));
        
        //main page
        mappings.put("/main/main", new MainController());
        
        //user ����
        mappings.put("/user/list", new ListUserController());
        mappings.put("/user/login", new MainController());
        mappings.put("/user/login/form", new ForwardController("/user/login.jsp"));
        mappings.put("/user/logout", new LogoutController());
        mappings.put("/user/register", new RegisterController());
        mappings.put("/user/register/form", new ForwardController("/user/register.jsp"));
        mappings.put("/user/register_ok", new ForwardController("/user/register_ok.jsp"));
        
        //post ����
        mappings.put("/post/create/form", new ForwardController("/post/create.jsp"));
        mappings.put("/post/create", new PostCreateController());
        
        //logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// �־��� uri�� �����Ǵ� controller ��ü�� ã�� ��ȯ
        return mappings.get(uri);
    }
}
