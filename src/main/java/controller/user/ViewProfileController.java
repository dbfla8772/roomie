package controller.user;

import controller.Controller;
import model.Profile;
import model.service.ProfileManager;
import model.service.StudentNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class ViewProfileController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(ViewProfileController.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	// 로그인 여부 확인
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/student/login";		// login form 요청으로 redirect
        }

		ProfileManager manager = ProfileManager.getInstance();

		int userId = Integer.parseInt(request.getParameter("s_id"));
		log.debug("s_id확인::" + userId);

    	Profile profile = null;
    	try {
			profile = manager.findProfile(userId);	// 사용자 정보 검색
			request.setAttribute("profile", profile);		// 사용자 정보 저장
			return "/student/main/detail.jsp";				// 사용자 보기 화면으로 이동
		} catch (StudentNotFoundException e) {
	        return "redirect:/student/main";
		}
    }
}
