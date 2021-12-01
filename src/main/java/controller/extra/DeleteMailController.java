package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Profile;
import model.service.MailManager;
import model.service.ProfileManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteMailController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(DeleteMailController.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 로그인 여부 확인
        if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/student/login";		// login form 요청으로 redirect
        }
        HttpSession session = request.getSession();
        int s_id = (int) session.getAttribute(UserSessionUtils.USER_SESSION_ID);
        MailManager mailManager = MailManager.getInstance();
        int ch_id = Integer.parseInt(request.getParameter("ch_id"));

        log.debug("s_id 확인: " + s_id + ", ch_id 확인: " + ch_id);

        //GET
        mailManager.remove(ch_id);

        return "/mail/send/sendList.jsp";
    }
}
