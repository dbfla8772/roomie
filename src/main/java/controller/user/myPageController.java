package controller.user;

import controller.Controller;
import model.Profile;
import model.service.ProfileManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class myPageController implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        session.setAttribute("login", 1);
        ProfileManager profileManager = ProfileManager.getInstance();
        Profile profile = profileManager.findProfile((Integer) session.getAttribute(UserSessionUtils.USER_SESSION_ID));

        request.setAttribute("profile", profile);

        return "/profile/myPage.jsp";
    }
}
