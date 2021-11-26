package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.*;
import model.Mail;
import model.service.MailManager;
import model.service.ProfileManager;
import model.service.StudentManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class MailController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(MailController.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 로그인 여부 확인
        if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/student/login";		// login form 요청으로 redirect
        }
        HttpSession session = request.getSession();
        int s_id = (int) session.getAttribute(UserSessionUtils.USER_SESSION_ID);
        MailManager mailManager = MailManager.getInstance();

        if (request.getMethod().equals("GET")) {
            Mail mail = null;

            // 받은 쪽지함으로
            if (Integer.parseInt(request.getParameter("flag")) == 0) {
                List<Mail> mailList = (List<Mail>) mailManager.findReceiveMailList(s_id);
                request.setAttribute("receiveList", mailList);

                return "/mail/receive/receiveList.jsp";
            }
            // 보낸 쪽지함으로
            else {
                List<Mail> mailList = (List<Mail>) mailManager.findSendMailList(s_id);
                request.setAttribute("sendList", mailList);

                return "/mail/send/sendList.jsp";
            }

        }

        //POST
        try {
            //전송 버튼 눌렀을 때
            int receiver = Integer.parseInt(request.getParameter("receiver"));
            String message = request.getParameter("message");

            //날짜, 시간 구하기
            LocalDateTime now = LocalDateTime.now();
            System.out.println(now); // 2021-06-17T06:43:21.419878100
            String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH시 mm분 ss초"));

            Mail m = new Mail(s_id, receiver, message, formatedNow, 0);
            Scrap s = new Scrap(s_id, receiver);

            mailManager.create(m);

            return "/mail/send/sendList.jsp";

        } catch (Exception e) {
            return "/student/main.jsp";
        }
    }


}
