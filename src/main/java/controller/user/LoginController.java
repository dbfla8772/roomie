package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.extra.ScrapController;
import model.Student;
import model.service.StudentManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		if (request.getMethod().equals("GET")) {

			return "/student/loginForm.jsp";
		}
		try {
			// 모델에 로그인 처리를 위임
			StudentManager manager = StudentManager.getInstance();
			manager.login(email, password);

			StudentManager student = StudentManager.getInstance();
			Student s = student.findStudent(email);

			// 세션에 사용자 아이디 저장

			session.setAttribute(UserSessionUtils.USER_SESSION_KEY, email);
			log.debug("login s_id::: " + s.getS_id());
			session.setAttribute(UserSessionUtils.USER_SESSION_ID, s.getS_id());

			return "redirect:/student/main";
		} catch (Exception e) {
			/* UserNotFoundException이나 PasswordMismatchException 발생 시
			 * 다시 login form을 사용자에게 전송하고 오류 메세지도 출력
			 */
			request.setAttribute("loginFailed", "true");
			request.setAttribute("exception", e);
			return "/student/loginForm.jsp";
		}
	}
}
