package controller.user;

import controller.Controller;
import model.Profile;
import model.service.ProfileManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class SearchProfileController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(SearchProfileController.class);

    private static final int countProfilePage = 10;    // 한 화면에 출력할 사용자 수
    
    private static final int[] filter = new int[10];

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        int s_id = (int) session.getAttribute(UserSessionUtils.USER_SESSION_ID);
        // 로그인 여부 확인
        if (!UserSessionUtils.hasLogined(session)) {
            return "redirect:/student/login";        // login 요청으로 redirect
        }

        if (request.getMethod().equals("GET")) {
            // GET request: 검색필터
            log.debug("SearchForm Request : {}", s_id);
            ProfileManager manager = ProfileManager.getInstance();
            Profile profile = manager.findProfile(s_id);
            request.setAttribute("profile", profile);

            return "/student/search.jsp";

        }

        /* POST */
        int sleep_habit, lifestyle, smoking, grade, cleaning, indoor_eating, mbti, sharing, habitude;
        String major = null;
        /* POST */

        if (request.getParameter("sleep_habit") == null) {
            sleep_habit = -1;
            filter[0] = -1;
        }
        else {
            sleep_habit = Integer.parseInt(request.getParameter("sleep_habit"));
            filter[0] = 0;
        }

        if (request.getParameter("lifestyle") == null) {
            lifestyle = -1;
            filter[1] = -1;
        }
        else {
            lifestyle = Integer.parseInt(request.getParameter("lifestyle"));
            filter[1] = 0;
        }

        if (request.getParameter("smoking") == null) {
            smoking = -1;
            filter[2] = -1;
        }
        else {
            smoking = Integer.parseInt(request.getParameter("smoking"));
            filter[2] = 0;
        }

        if (request.getParameter("grade") == null) {
            grade = -1;
            filter[3] = -1;
        }
        else {
            grade = Integer.parseInt(request.getParameter("grade"));
            filter[3] = 0;
        }

        if (request.getParameter("major") != null) {
            major = request.getParameter("major");
            filter[4] = 0;
        }
        else {
            filter[4] = -1;
        }

        if (request.getParameter("cleaning") == null) {
            cleaning = -1;
            filter[5] = -1;
        }
        else {
            cleaning = Integer.parseInt(request.getParameter("cleaning"));
            filter[5] = 0;
        }

        if (request.getParameter("indoor_eating") == null) {
            indoor_eating = -1;
            filter[6] = -1;
        }
        else {
            indoor_eating = Integer.parseInt(request.getParameter("indoor_eating"));
            filter[6] = 0;
        }
        mbti = Integer.parseInt(request.getParameter("mbti"));
        filter[7] = mbti;

        if (request.getParameter("sharing") == null) {
            sharing = -1;
            filter[8] = -1;
        }
        else {
            sharing = Integer.parseInt(request.getParameter("sharing"));
            filter[8] = 0;
        }

        if (request.getParameter("habitude") == null) {
            habitude = -1;
            filter[9] = -1;
        }
        else {
            habitude = Integer.parseInt(request.getParameter("habitude"));
            filter[9] = 0;
        }
        log.debug("Search User : {}", s_id);


      /*  String currentpagePro = request.getParameter("currentPage");
        int currentPage = 1;
        if (currentpagePro != null && !currentpagePro.equals("")) {
            currentPage = Integer.parseInt(currentpagePro);
        }*/

        //지금 s_id로만 매개변수 전달하여 프로필리스트 생성, 고쳐야함 manager에 메소드 새로 생성 + DAO에 검색필터 매개변수 추가하여 메소드
        ProfileManager manager = ProfileManager.getInstance();
        List<Profile> profileList = (List<Profile>) manager.findProfileList(s_id, sleep_habit, lifestyle, smoking, grade, major, cleaning, indoor_eating, mbti, sharing, habitude);
//		List<Profile> profileList = manager.findProfileList(currentPage, countProfilePage);

        // profileList 객체와 현재 로그인한 사용자 ID를 request에 저장하여 전달
        request.setAttribute("profileList", profileList);
        request.setAttribute("s_id", s_id);
        request.setAttribute("filter", filter);

        // 사용자 리스트 화면으로 이동(forwarding)
        return "/student/searchResult.jsp";
    }


}
