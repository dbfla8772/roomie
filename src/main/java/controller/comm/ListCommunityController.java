package controller.comm;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.Community;
import model.service.ProfileManagger;

public class ListCommunityController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	ProfileManagger manager = ProfileManagger.getInstance();
		List<Community> commList = manager.findCommunityList();
		
		// commList ��ü�� request�� �����Ͽ� Ŀ�´�Ƽ ����Ʈ ȭ������ �̵�(forwarding)
		request.setAttribute("commList", commList);				
		return "/community/list.jsp";        
    }
}
