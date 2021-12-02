package controller.user;

import controller.Controller;
import model.Profile;
import model.Scrap;
import model.service.MyRoomieManager;
import model.service.ProfileManager;
import model.service.ScrapManager;
import model.service.StudentNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ViewProfileController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(ViewProfileController.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		int s_id = (int) session.getAttribute(UserSessionUtils.USER_SESSION_ID);
		session.setAttribute("login", 1);

		// 로그인 여부 확인
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/student/login";		// login form 요청으로 redirect
        }

		ProfileManager manager = ProfileManager.getInstance();
		ScrapManager scrapManager = ScrapManager.getInstance();
		MyRoomieManager roomieManager = MyRoomieManager.getInstance();

		int userId = Integer.parseInt(request.getParameter("s_id"));
		log.debug("detail user_id확인: " + userId);

    	Profile profile = null;
		String scrap;
		String myroomie;
    	try {
			profile = manager.findProfile(userId);	// 사용자 정보 검색

			scrap = String.valueOf(scrapManager.isScraped(s_id, userId));
			myroomie = String.valueOf(roomieManager.isPicked(s_id, userId));

			log.debug("scrap 여부 확인: " + scrap);
			
			request.setAttribute("profile", profile);		// 사용자 정보 저장
			request.setAttribute("scrap", scrap);		// 스크랩 여부 저장
			request.setAttribute("myroomie", myroomie);  //마이루미 신청 여부 저장

			return "/student/main/detail.jsp";				// 사용자 보기 화면으로 이동
		} catch (StudentNotFoundException e) {
	        return "redirect:/student/main";
		}
    }
}
