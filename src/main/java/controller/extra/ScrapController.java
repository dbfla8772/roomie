package controller.extra;

import controller.Controller;
import controller.user.UpdateProfileController;
import controller.user.UserSessionUtils;
import model.Profile;
import model.Scrap;
import model.dao.ScrapDAO;
import model.service.ProfileManager;
import model.service.StudentManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class ScrapController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(ScrapController.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        int s_id = (int) session.getAttribute(UserSessionUtils.USER_SESSION_ID);
        ScrapDAO scrap = new ScrapDAO();

        if (request.getMethod().equals("GET")) {
            List<Profile> scrapList = scrap.findScarpList(s_id);
            request.setAttribute("scrapList", scrapList);

            return "/scrap/view.jsp";
        }

        /* post */
        try {
            //스크랩 버튼 눌렀을 때
            ProfileManager manager = ProfileManager.getInstance();
            Profile profile = manager.findProfile(s_id);	// 스크랩하려는 사용자 정보 검색
            Scrap s = new Scrap(profile.getS_id(), Integer.parseInt(request.getParameter("sc_id")));

            scrap.create(s);

            return "/student/main/detail.jsp";

        } catch (Exception e) {
            return "/student/main.jsp";
        }
    }

}
