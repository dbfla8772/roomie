package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.*;
import model.Mail;
import model.service.MailManager;
import model.service.ProfileManager;
import model.service.StudentManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class MailController implements Controller {
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

            List<Mail> mailList = (List<Mail>) mailManager.findMailList(s_id);

            // receive mail list 전달
            request.setAttribute("receiveList", mailList);

            return "/mail/receive/receiveList.jsp";
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
