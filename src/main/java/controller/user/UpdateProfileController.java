package controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Point;
import model.Profile;
import model.service.AutoMatchManager;
import model.service.ProfileManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;

public class UpdateProfileController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(UpdateProfileController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		// 로그인 여부 확인
		if (!UserSessionUtils.hasLogined(request.getSession())) {
			return "redirect:/student/login";
		}

		HttpSession session = request.getSession();
		int s_id = (int) session.getAttribute(UserSessionUtils.USER_SESSION_ID);

		if (request.getMethod().equals("GET")) {
			// GET request: 회원정보 수정 form 요청
			ProfileManager manager = ProfileManager.getInstance();
			Profile profile = manager.findProfile(s_id);	// 수정하려는 사용자 정보 검색
			request.setAttribute("profile", profile);

			return "/profile/myPage/updateForm.jsp";
		}


		int activation;
		if (request.getParameter("activation") != null) {
			activation = 1;
		} else {
			activation = 0;
		}

		// POST
		Profile updateStudent = new Profile(
				Integer.parseInt(request.getParameter("s_id")),
				activation,
				request.getParameter("name"),
				Integer.parseInt(request.getParameter("pr_img")),
				Integer.parseInt(request.getParameter("age")),
				Integer.parseInt(request.getParameter("sleep_habit")),
				Integer.parseInt(request.getParameter("lifestyle")),
				Integer.parseInt(request.getParameter("smoking")),
				Integer.parseInt(request.getParameter("grade")),
				request.getParameter("major"),
				Integer.parseInt(request.getParameter("cleaning")),
				Integer.parseInt(request.getParameter("indoor_eating")),
				Integer.parseInt(request.getParameter("mbti")),
				Integer.parseInt(request.getParameter("sharing")),
				Integer.parseInt(request.getParameter("habitude"))
		);

		log.debug("Update User : {}", updateStudent);

		ProfileManager manager = ProfileManager.getInstance();
		manager.update(updateStudent);

		AutoMatchManager automatch = AutoMatchManager.getInstance();
		Point point = automatch.findPoint(s_id);

		String p_dec, p_bin, sleep_habit, cleaning, habitude, mbti;
		sleep_habit = Integer.toBinaryString(Integer.parseInt(request.getParameter("sleep_habit")));

		cleaning = Integer.toBinaryString(Integer.parseInt(request.getParameter("cleaning")));

		habitude = Integer.toBinaryString(Integer.parseInt(request.getParameter("habitude")));

		mbti = Integer.toBinaryString(Integer.parseInt(request.getParameter("mbti")));

		p_bin = Integer.toBinaryString(Integer.parseInt(request.getParameter("smoking")));
		p_bin += String.format("%02d", Integer.parseInt(sleep_habit));
		p_bin += Integer.toBinaryString(Integer.parseInt(request.getParameter("lifestyle")));
		p_bin += String.format("%02d", Integer.parseInt(cleaning));
		p_bin += Integer.toBinaryString(Integer.parseInt(request.getParameter("indoor_eating")));
		p_bin += Integer.toBinaryString(Integer.parseInt(request.getParameter("sharing")));
		p_bin += String.format("%02d", Integer.parseInt(habitude));
		p_bin += String.format("%04d", Integer.parseInt(mbti));

		p_dec = String.valueOf(Integer.parseInt(p_bin, 2));

		point.setPoint_binary(p_bin);
		point.setPoint_dec(p_dec);

		automatch.update(point);
		return "redirect:/profile/myPage";
	}
}
