package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.StudentManager;
import model.service.StudentNotFoundException;
import model.Student;

public class ViewUserController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	// 로그인 여부 확인
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";		// login form 요청으로 redirect
        }
    	
		StudentManager manager = StudentManager.getInstance();
		String userId = request.getParameter("userId");

    	Student student = null;
    	try {
			student = manager.findStudent(userId);	// 사용자 정보 검색
		} catch (StudentNotFoundException e) {
	        return "redirect:/user/list";
		}	
		
    	request.setAttribute("user", student);		// 사용자 정보 저장
		return "/user/view.jsp";				// 사용자 보기 화면으로 이동
    }
}
