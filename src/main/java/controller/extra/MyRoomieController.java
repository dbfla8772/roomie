package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Profile;
import model.service.MyRoomieManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class MyRoomieController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(controller.extra.ScrapController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        int s_id = (int) session.getAttribute(UserSessionUtils.USER_SESSION_ID);

        MyRoomieManager roomieManager = MyRoomieManager.getInstance();

        if (request.getMethod().equals("GET")) {
            List<Profile> roomieList = roomieManager.findMyRoomieList(s_id);
            request.setAttribute("roomieList", roomieList);

            return "/myroomie/view.jsp";
        }

        /* POST */
        try {
            return null;
        } catch (Exception e) {
            return "/student/main.jsp";
        }

    }
}
