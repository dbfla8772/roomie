package controller.extra;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.MyRoomie;
import model.Profile;
import model.service.MyRoomieManager;
import model.service.ProfileManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class WaitRoomieController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(controller.extra.MyRoomieController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        int s_id = (int) session.getAttribute(UserSessionUtils.USER_SESSION_ID);

        MyRoomieManager waitManager = MyRoomieManager.getInstance();

        if (request.getMethod().equals("GET")) {

            List<Profile> waitList = waitManager.findWaitRoomieList(s_id);
            request.setAttribute("waitList", waitList);

            List<Profile> requestList = waitManager.findRequestRoomieList(s_id);
            request.setAttribute("requestList", requestList);

            return "/myroomie/wait.jsp";
        }
        return null;
    }
}

