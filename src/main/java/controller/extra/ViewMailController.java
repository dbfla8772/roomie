package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Mail;
import model.service.MailManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewMailController implements Controller {
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
            //받은 메세지 디테일
            int ch_id = Integer.parseInt(request.getParameter("ch_id"));
            //log.debug("s_id확인: " + s_id + " ch_id확인: " + ch_id);

            mail = mailManager.findMail(ch_id);

            request.setAttribute("mail", mail);		// 사용자 정보 저장

            return "/mail/receiveList/detail.jsp";

        } catch (Exception e) {
            return "/mail/receiveList.jsp";
        }
    }



}
