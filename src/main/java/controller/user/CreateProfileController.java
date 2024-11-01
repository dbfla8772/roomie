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
        log.debug("Create Profile Request");
        log.debug("email 확인:" + email);

        StudentManager student = StudentManager.getInstance();
        Student s = student.findStudent(email);

        Profile createProfile = new Profile(
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
