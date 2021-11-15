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

            return "/student/search.jsp";

        }

        /* POST */

        int activation, sleep_habit, lifestyle, smoking, cleaning, indoor_eating, mbti, sharing, habitude;
        /* POST */
        if (request.getParameter("activation") == null)
            activation = -1;
        else
            activation = Integer.parseInt(request.getParameter("activation"));

        if (request.getParameter("sleep_habit") == null)
            sleep_habit = -1;
        else
            sleep_habit = Integer.parseInt(request.getParameter("sleep_habit"));

        if (request.getParameter("lifestyle") == null)
            lifestyle = -1;
        else
            lifestyle = Integer.parseInt(request.getParameter("lifestyle"));

        if (request.getParameter("smoking") == null)
            smoking = -1;
        else
            smoking = Integer.parseInt(request.getParameter("smoking"));

        if (request.getParameter("cleaning") == null)
            cleaning = -1;
        else
            cleaning = Integer.parseInt(request.getParameter("cleaning"));

        if (request.getParameter("indoor_eating") == null)
            indoor_eating = -1;
        else
            indoor_eating = Integer.parseInt(request.getParameter("indoor_eating"));

        if (request.getParameter("mbti") == null)
            mbti = -1;
        else
            mbti = Integer.parseInt(request.getParameter("mbti"));

        if (request.getParameter("sharing") == null)
            sharing = -1;
        else
            sharing = Integer.parseInt(request.getParameter("sharing"));

        if (request.getParameter("habitude") == null)
            habitude = -1;
        else
            habitude = Integer.parseInt(request.getParameter("habitude"));

        log.debug("Search User : {}", s_id);


      /*  String currentpagePro = request.getParameter("currentPage");
        int currentPage = 1;
        if (currentpagePro != null && !currentpagePro.equals("")) {
            currentPage = Integer.parseInt(currentpagePro);
        }*/

        //지금 s_id로만 매개변수 전달하여 프로필리스트 생성, 고쳐야함 manager에 메소드 새로 생성 + DAO에 검색필터 매개변수 추가하여 메소드
        ProfileManager manager = ProfileManager.getInstance();
        List<Profile> profileList = (List<Profile>) manager.findProfileList(s_id, sleep_habit, lifestyle, smoking, cleaning, indoor_eating, mbti, sharing, habitude);
//		List<Profile> profileList = manager.findProfileList(currentPage, countProfilePage);


        // profileList 객체와 현재 로그인한 사용자 ID를 request에 저장하여 전달
        request.setAttribute("profileList", profileList);
        request.setAttribute("s_id", s_id);

        // 사용자 리스트 화면으로 이동(forwarding)
        return "/student/searchResult.jsp";
    }


}
