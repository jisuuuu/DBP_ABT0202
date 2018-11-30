package controller;

import java.util.HashMap;
import java.util.Map;
import controller.user.*;
import controller.post.*;


public class RequestMapping {

    
    // 각 요청 uri에 대한 controller 객체를 저장할 HashMap 생성
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// 각 uri에 대응되는 controller 객체를 생성 및 저장
        mappings.put("/", new ForwardController("index.jsp"));
        
        //main page
        mappings.put("/main/main", new MainController());
        
        //user 관련
        mappings.put("/user/list", new ListUserController());
        mappings.put("/user/login", new MainController());
        mappings.put("/user/login/form", new ForwardController("/user/login.jsp"));
        mappings.put("/user/logout", new LogoutController());
        mappings.put("/user/register", new RegisterController());
        mappings.put("/user/register/form", new ForwardController("/user/register.jsp"));
        mappings.put("/user/register_ok", new ForwardController("/user/register_ok.jsp"));
        
        //post 관련
        mappings.put("/post/create/form", new ForwardController("/post/create.jsp"));
        mappings.put("/post/create", new PostCreateController());
        
        //logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// 주어진 uri에 대응되는 controller 객체를 찾아 반환
        return mappings.get(uri);
    }
}
