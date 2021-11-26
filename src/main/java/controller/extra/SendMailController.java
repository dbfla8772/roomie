package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Mail;
import model.Profile;
import model.Scrap;
import model.service.MailManager;
import model.service.ProfileManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class SendMailController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(SendMailController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 로그인 여부 확인
        if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/student/login";		// login form 요청으로 redirect
        }
        HttpSession session = request.getSession();
        int s_id = (int) session.getAttribute(UserSessionUtils.USER_SESSION_ID);
        MailManager mailManager = MailManager.getInstance();
        int receiver = Integer.parseInt(request.getParameter("receiver"));

        log.debug("s_id 확인: " + s_id + " receiver_id 확인: " + receiver);

        //GET
        Profile profile = ProfileManager.getInstance().findProfile(receiver);

        log.debug("receiver의 name 확인 :: " + profile.getName());
        request.setAttribute("receiver", receiver);
        request.setAttribute("receiver_name", profile.getName());

        return "/mail/send/sendForm.jsp";
    }
}
