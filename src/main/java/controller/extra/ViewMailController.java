package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;
import controller.user.ViewProfileController;
import model.Mail;
import model.service.MailManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ViewMailController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(ViewMailController.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 로그인 여부 확인
        if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/student/login";		// login form 요청으로 redirect
        }

        /*int s_id = (int)UserSessionUtils.getLoginUserId(request.getSession());
        request.setAttribute("s_id", s_id);
        return "/chat/sendList.jsp";*/

        MailManager mailManager = MailManager.getInstance();
        Mail mail = null;

        try {
            //메세지 디테일
            int ch_id = Integer.parseInt(request.getParameter("ch_id"));

            log.debug("ch_id :: " + request.getParameter("ch_id"));

            mail = mailManager.findMail(ch_id);
            request.setAttribute("mail", mail);        // 메일 정보 저장

            log.debug("메세지 :: " + mail.getMessage());

            //받은 메세지
            if (Integer.parseInt(request.getParameter("flag")) == 0) {
                return "/mail/receive/detail.jsp";
            }
            // 보낸 메세지
            else {
                return "/mail/send/detail.jsp";
            }

        } catch (Exception e) {
            return "/mail/receive/receiveList.jsp";
        }
    }



}
