package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChatController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 로그인 여부 확인
        if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/student/loginForm";		// login form 요청으로 redirect
        }

        int s_id = (int)UserSessionUtils.getLoginUserId(request.getSession());
        request.setAttribute("s_id", s_id);
        return "/chat/sendList.jsp";
    }
}
