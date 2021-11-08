package controller.comm;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.ProfileManagger;
import model.Community;

public class ViewCommunityController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	
    	Community comm = null;
		ProfileManagger manager = ProfileManagger.getInstance();
		int commId = Integer.parseInt(request.getParameter("commId"));
		comm = manager.findCommunity(commId);		// Ŀ�´�Ƽ ���� �˻�			
		
		request.setAttribute("community", comm);	// Ŀ�´�Ƽ ���� ����				
		return "/community/view.jsp";				// Ŀ�´�Ƽ ���� ȭ������ �̵�
    }
}
