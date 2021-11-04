package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.user.*;
import controller.comm.*;

public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    
    // �� ��û uri�� ���� controller ��ü�� ������ HashMap ����
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// �� uri�� �����Ǵ� controller ��ü�� ���� �� ����
        mappings.put("/", new ForwardController("/student/loginForm.jsp"));
        mappings.put("/student/login", new LoginController());
        mappings.put("/student/register/form", new RegisterController());
        mappings.put("/student/register", new RegisterController());
        mappings.put("/student/main", new ListProfileController());
        mappings.put("/profile/update", new UpdateProfileController());
        mappings.put("/student/search", new SearchProfileController());
        mappings.put("/student/automatch", new AutoMatchController());
        mappings.put("/student/main/detail", new ScrapController());
        mappings.put("/scrap/view", new ListProfileController());
        mappings.put("/chat/send", new ChatController());
        mappings.put("/chat/sendList", new ChatController());
        mappings.put("/chat/receiveList", new ChatController());
        

        // ����� ���� ���� �� ��û�� ���� ��û ó�� ����
//      mappings.put("/user/update/form", new UpdateUserFormController());
        mappings.put("/user/update/form", new UpdateUserController());
        mappings.put("/user/update", new UpdateUserController());
        mappings.put("/user/delete", new DeleteUserController());
        
        // Ŀ�´�Ƽ ���� request URI �߰�
        mappings.put("/community/list", new ListCommunityController());
        mappings.put("/community/view", new ViewCommunityController());
        mappings.put("/community/create/form", new ForwardController("/community/creationForm.jsp"));
        mappings.put("/community/create", new CreateCommunityController());
        mappings.put("/community/update/form", new UpdateCommunityController());
        mappings.put("/community/update", new UpdateCommunityController());
        
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// �־��� uri�� �����Ǵ� controller ��ü�� ã�� ��ȯ
        return mappings.get(uri);
    }
}
