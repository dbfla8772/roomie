package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.MyRoomie;
import model.Profile;
import model.service.MyRoomieManager;
import model.service.ProfileManager;
import model.service.ScrapManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class MyRoomieController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(controller.extra.MyRoomieController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        int s_id = (int) session.getAttribute(UserSessionUtils.USER_SESSION_ID);

        MyRoomieManager roomieManager = MyRoomieManager.getInstance();
        ScrapManager scrapManager = ScrapManager.getInstance();

        if (request.getMethod().equals("GET")) {
            List<Profile> roomieList = roomieManager.findMyRoomieList(s_id);
            request.setAttribute("roomieList", roomieList);

            return "/myroomie/view.jsp";
        }

        /* POST */
        try {
            //마이루미로 픽 눌렀을 때
            int roomie_id = Integer.parseInt(request.getParameter("roomie_id"));
            MyRoomie mr = new MyRoomie(s_id, roomie_id);

            roomieManager.create(mr);

            log.debug("s_id 확인: " + s_id + " roomie_id 확인: " + roomie_id);

            ProfileManager manager = ProfileManager.getInstance();
            Profile profile = manager.findProfile(roomie_id);

            String myroomie = String.valueOf(roomieManager.isPicked(s_id, roomie_id));
            String scrap = String.valueOf(scrapManager.isScraped(s_id, roomie_id));

            request.setAttribute("profile", profile);		// 사용자 정보 저장
            request.setAttribute("scrap", scrap);		// 스크랩 여부 저장
            request.setAttribute("myroomie", myroomie);  //마이루미 신청 여부 저장

            return "/student/main/detail.jsp";
        } catch (Exception e) {
            return "/student/main.jsp";
        }

    }
}
