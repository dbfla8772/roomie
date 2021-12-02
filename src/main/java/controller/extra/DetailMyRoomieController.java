package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Profile;
import model.service.MyRoomieManager;
import model.service.ProfileManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DetailMyRoomieController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(controller.extra.MyRoomieController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        int s_id = (int) session.getAttribute(UserSessionUtils.USER_SESSION_ID);

        MyRoomieManager roomieManager = MyRoomieManager.getInstance();
        ProfileManager manager = ProfileManager.getInstance();

        int userId = Integer.parseInt(request.getParameter("s_id"));
        log.debug("detail user_id확인: " + userId);

        Profile profile;
        try {
            profile = manager.findProfile(userId);	// 사용자 정보 검색
            int flag = roomieManager.isCheckd(s_id, userId);

            request.setAttribute("profile", profile);
            request.setAttribute("flag", flag);

            return "/myroomie/detail.jsp";
        } catch (Exception e) {
            return "redirect:/myroomie/view";
        }
    }
}
