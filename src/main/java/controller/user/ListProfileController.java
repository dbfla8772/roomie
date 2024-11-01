package controller.user;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.Profile;
import model.Student;
import model.service.ProfileManager;
import model.service.StudentManager;

public class ListProfileController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		// 로그인 여부 확인
		if (!UserSessionUtils.hasLogined(request.getSession())) {
			return "redirect:/student/login";
		}

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute(UserSessionUtils.USER_SESSION_KEY);

		StudentManager student = StudentManager.getInstance();
		Student s = student.findStudent(email);

		int s_id = (int)UserSessionUtils.getS_Id(request.getSession());
		ProfileManager manager = ProfileManager.getInstance();
		List<Profile> profileList = manager.findProfileList(s.getC_id(), s.getGender(), s_id);


		// profileList 객체와 현재 로그인한 사용자 ID를 request에 저장하여 전달
		request.setAttribute("profileList", profileList);
		request.setAttribute("s_id", s_id);
		request.setAttribute("name", s.getName());

		// 사용자 리스트 화면으로 이동
		return "/student/main.jsp";
	}
}
