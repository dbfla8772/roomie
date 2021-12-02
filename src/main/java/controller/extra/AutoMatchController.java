package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Point;
import model.Profile;
import model.Student;
import model.service.AutoMatchManager;
import model.service.ProfileManager;
import model.service.StudentManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class AutoMatchController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(AutoMatchController.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession();
        int s_id = (int) session.getAttribute(UserSessionUtils.USER_SESSION_ID);

        try {
            AutoMatchManager autoMatchManager = AutoMatchManager.getInstance();
            ProfileManager profileManager = ProfileManager.getInstance();

            List<Integer> list = autoMatchManager.sortedPointList(s_id);
            List<Profile> profileList = new ArrayList<>();

            for (int i = list.size()-1; i >= 0; i--) {
                profileList.add(profileManager.findProfile(list.get(i)));
            }

            request.setAttribute("profileList", profileList);
            return "/profile/automatch.jsp";
        } catch (Exception e) {
            return "redirect:/student/main";
        }
    }

}
