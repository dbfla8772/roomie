package controller.user;

import controller.Controller;
import model.College;
import model.service.CollegeManager;
import model.service.ExistingStudentException;
import model.service.StudentManager;
import model.service.StudentNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class EmailCheckController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(RegisterController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.debug("email check");
        List<College> colList = CollegeManager.getInstance().findCollegeList();
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        StudentManager manager = StudentManager.getInstance();
        if (manager.existing(email)) {
            request.setAttribute("err", "1");
            request.setAttribute("email", "");
        } else {
            request.setAttribute("err", "0");
            request.setAttribute("email", email);
        }
        request.setAttribute("name", name);
        request.setAttribute("colList", colList);
        return "/student/registerForm.jsp";
    }
}
