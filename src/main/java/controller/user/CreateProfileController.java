package controller.user;

import controller.Controller;
import model.College;
import model.Point;
import model.Profile;
import model.Student;
import model.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class CreateProfileController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateProfileController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
        String email = request.getParameter("email");

//        if (request.getMethod().equals("GET")) {
//            // GET request: 회원정보 등록 form 요청
//
//
//            return "/profile/myPage/updateForm.jsp";
//        }
        log.debug("Create Profile Request");
        log.debug("email 확인:" + email);

        StudentManager student = StudentManager.getInstance();
        Student s = student.findStudent(email);
        //request.setAttribute("s_id", s.getS_id());

        Profile createProfile = new Profile(            //생성자와 순서 맞으면 ok
                s.getS_id(),
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

        String p_dec, p_bin, p;
        p = request.getParameter("smoking");
        p += request.getParameter("sleep_habit");
        p += request.getParameter("lifestyle");
        p += request.getParameter("cleaning");
        p += request.getParameter("indoor_eating");
        p += request.getParameter("habitude");
        p += request.getParameter("mbti");

        p_bin = Integer.toBinaryString(Integer.parseInt(p));
        p_dec = String.valueOf(Integer.parseInt(p_bin, 2));

        Point createPoint = new Point(
                s.getS_id(),
                p_bin,
                p_dec
        );

        log.debug("Create Profile : {}", createProfile);
        try {
            ProfileManager manager = ProfileManager.getInstance();
            manager.create(createProfile);

            AutoMatchManager auto = AutoMatchManager.getInstance();
            auto.create(createPoint);
            return "/student/loginForm.jsp";

        } catch (ExistingStudentException e) {	// 예외 발생 시 회원가입 form으로 forwarding
            request.setAttribute("create Profile Failed", true);
            request.setAttribute("exception", e);
            request.setAttribute("createProfile", createProfile);
            return "/profile/myPage/createForm.jsp";
        }
    }
}
