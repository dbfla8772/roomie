package controller;

import java.util.HashMap;
import java.util.Map;

import controller.extra.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.user.*;

public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);

    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
        mappings.put("/", new ForwardController("/student/loginForm.jsp"));
        mappings.put("/student/login", new LoginController());
        mappings.put("/student/register", new RegisterController());

        mappings.put("/profile/create", new CreateProfileController());
        mappings.put("/profile/myPage", new myPageController());
        mappings.put("/profile/update", new UpdateProfileController());

        mappings.put("/student/main", new ListProfileController());
        mappings.put("/student/main/detail", new ViewProfileController());
        mappings.put("/student/search", new SearchProfileController());

        mappings.put("/student/automatch", new AutoMatchController());

        mappings.put("/scrap/view", new ScrapController());
        mappings.put("/scrap/delete", new DeleteScrapController());

        mappings.put("/mail/send", new SendMailController());
        mappings.put("/mail/send/sendList", new MailController());
        mappings.put("/mail/send/detail", new ViewMailController());
        mappings.put("/mail/receive/receiveList", new MailController());
        mappings.put("/mail/receive/detail", new ViewMailController());


        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {
        return mappings.get(uri);
    }
}
