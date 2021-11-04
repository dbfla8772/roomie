package controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Community;
import model.Student;
import model.service.ExistingStudentException;
import model.service.StudentManager;

public class RegisterController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(RegisterController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       	if (request.getMethod().equals("GET")) {	
    		// GET request: ??????? ??? form ???	
    		log.debug("RegisterForm Request");

    		List<Community> commList = StudentManager.getInstance().findCommunityList();	// ии?ве?? ????? ???
			request.setAttribute("commList", commList);	
		
			return "/user/registerForm.jsp";   // ????? ????? ?????? update form???? ????     	
	    }	

    	// POST request (????????? parameter?? ?????)
       	Student student = new Student(
			request.getParameter("userId"),
			request.getParameter("password"),
			request.getParameter("name"),
			request.getParameter("email"),
			request.getParameter("phone"),
			Integer.parseInt(request.getParameter("commId")));
		
        log.debug("Create User : {}", student);

		try {
			StudentManager manager = StudentManager.getInstance();
			manager.create(student);
	        return "redirect:/user/list";	// ???? ?? ????? ????? ??????? redirect
	        
		} catch (ExistingStudentException e) {	// ???? ??? ?? ??????? form???? forwarding
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("user", student);
			return "/user/registerForm.jsp";
		}
    }
}
