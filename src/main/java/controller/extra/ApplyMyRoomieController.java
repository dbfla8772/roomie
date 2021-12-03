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

public class ApplyMyRoomieController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(controller.extra.ApplyMyRoomieController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        int s_id = (int) session.getAttribute(UserSessionUtils.USER_SESSION_ID);

        MyRoomieManager roomieManager = MyRoomieManager.getInstance();
        int roomie_id = Integer.parseInt(request.getParameter("roomie_id"));
        int flag = Integer.parseInt(request.getParameter("flag"));
        log.debug("s_id 확인: " + s_id + " roomie_id 확인: " + roomie_id);

        //거절버튼 or 삭제버튼 눌렀을 때
        if (request.getMethod().equals("GET")) {
            MyRoomie mr = new MyRoomie(s_id, roomie_id);
            roomieManager.remove(mr);

            //삭제버튼
            if (flag == 0) {
                List<Profile> roomieList = roomieManager.findMyRoomieList(s_id);
                request.setAttribute("roomieList", roomieList);

                return "/myroomie/wait.jsp";
            }
            //거절버튼
            else if (flag == 1) {
                List<Profile> waitList = roomieManager.findWaitRoomieList(s_id);
                request.setAttribute("waitList", waitList);

                List<Profile> requestList = roomieManager.findRequestRoomieList(s_id);
                request.setAttribute("requestList", requestList);

                return "/myroomie/wait.jsp";
            }

        }

        /* POST */
        try {
            //수락버튼 눌렀을때
            MyRoomie mr = new MyRoomie(s_id, roomie_id);
            roomieManager.update(mr);

            List<Profile> roomieList = roomieManager.findMyRoomieList(s_id);
            request.setAttribute("roomieList", roomieList);

            return "/myroomie/view.jsp";
        } catch (Exception e) {
            return "/student/main.jsp";
        }

    }
}
