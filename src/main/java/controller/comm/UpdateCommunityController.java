package controller.comm;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.Controller;
import model.service.StudentManager;
import model.Community;
import model.Student;

public class UpdateCommunityController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateCommunityController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
 
		int commId = Integer.parseInt(request.getParameter("commId"));
		
		if (request.getMethod().equals("GET")) {	
    		// GET request: Ŀ�´�Ƽ ���� form ��û	
    		StudentManager manager = StudentManager.getInstance();
			Community comm = manager.findCommunity(commId);	// �����Ϸ��� Ŀ�´�Ƽ ���� �˻�
			request.setAttribute("community", comm);			
			
			List<Student> members = manager.findCommunityMembers(commId); // Ŀ�´�Ƽ ȸ�� ����Ʈ �˻�
			request.setAttribute("members", members);		
			return "/community/updateForm.jsp";   // �˻��� ������ update form���� ����     
	    }	
    	
    	// POST request (Ŀ�´�Ƽ ������ parameter�� ���۵�)
    	Community comm = new Community(
    		commId,
    		request.getParameter("name"),
    		request.getParameter("desc"),
    		null, request.getParameter("chairId"), null);

    	log.debug("Update Community : {}", comm);

		StudentManager manager = StudentManager.getInstance();
		manager.updateCommunity(comm);			
        return "redirect:/community/list";			
    }
}
