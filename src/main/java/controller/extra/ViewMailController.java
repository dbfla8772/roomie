package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;
import controller.user.ViewProfileController;
import model.Mail;
import model.Profile;
import model.service.MailManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.service.ProfileManager;
import model.service.StudentManager;
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

        MailManager mailManager = MailManager.getInstance();
        ProfileManager profiletManager = ProfileManager.getInstance();
        Mail receivemail = null;
        Mail sendMail = null;

        try {
            //메세지 디테일
            int ch_id = Integer.parseInt(request.getParameter("ch_id"));

            log.debug("ch_id :: " + request.getParameter("ch_id"));


            //받은 메세지
            if (Integer.parseInt(request.getParameter("flag")) == 0) {
                receivemail = mailManager.findreceiveMail(ch_id);
                Profile sender_pro = profiletManager.findProfile(receivemail.getSender()); //sender의 프로필 - name뽑아내기 위해서
                String sender = sender_pro.getName();

                request.setAttribute("mail", receivemail);        // 메일 정보 저장
                request.setAttribute("sender", sender);

                log.debug("Message :: " + receivemail.getMessage());

                return "/mail/receive/detail.jsp";
            }
            // 보낸 메세지
            else {
                sendMail = mailManager.findsendMail(ch_id);
                Profile receiver_pro = profiletManager.findProfile(sendMail.getReceiver()); //receiver의 프로필 - name뽑아내기 위해서
                String receiver = receiver_pro.getName();

                request.setAttribute("mail", sendMail);        // 메일 정보 저장
                request.setAttribute("receiver", receiver);

                log.debug("Message :: " + sendMail.getMessage());

                return "/mail/send/detail.jsp";
            }

        } catch (Exception e) {
            return "/mail/receive/receiveList.jsp";
        }
    }



}
