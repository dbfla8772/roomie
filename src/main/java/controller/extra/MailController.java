package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Mail;
import model.Mail;
import model.Student;
import model.service.MailManager;
import model.service.ProfileManager;
import model.service.StudentManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class MailController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        int s_id = (int) session.getAttribute(UserSessionUtils.USER_SESSION_ID);

        // 로그인 여부 확인
        if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/student/login";		// login form 요청으로 redirect
        }
        
        MailManager mailManager = MailManager.getInstance();
        Mail mail = null;
        
        List<Mail> mailList = (List<Mail>) mailManager.findMailList(s_id);

        // receive mail list 전달
        request.setAttribute("receiveList", mailList);

        return "/mail/receive/receiveList.jsp";

    }


}
