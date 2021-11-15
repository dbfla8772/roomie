package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Profile;
import model.Scrap;
import model.service.ProfileManager;
import model.service.ScrapManager;
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

        ScrapManager scrapManager = ScrapManager.getInstance();

        if (request.getMethod().equals("GET")) {
            List<Profile> scrapList = scrapManager.findScarpList(s_id);
            request.setAttribute("scrapList", scrapList);

            return "/scrap/view.jsp";
        }

        /* POST */
        try {
            //스크랩 버튼 눌렀을 때
            int scrap_id = Integer.parseInt(request.getParameter("scrap_id"));
            Scrap s = new Scrap(s_id, scrap_id);

            scrapManager.create(s);

            log.debug("s_id 확인: " + s_id + " scrap_id 확인: " + scrap_id);

            ProfileManager manager = ProfileManager.getInstance();
            Profile profile = manager.findProfile(scrap_id);

            String scrap = String.valueOf(scrapManager.isScraped(s_id, scrap_id));

            request.setAttribute("profile", profile);		// 사용자 정보 저장
            request.setAttribute("scrap", scrap);		// 스크랩 여부 저장

            return "/student/main/detail.jsp";

        } catch (Exception e) {
            return "/student/main.jsp";
        }
    }

}
