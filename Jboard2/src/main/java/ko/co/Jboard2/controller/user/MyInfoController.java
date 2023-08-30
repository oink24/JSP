package ko.co.Jboard2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import ko.co.Jboard2.service.UserService;

@WebServlet("/user/myInfo.do")
public class MyInfoController extends HttpServlet {
	private static final long serialVersionUID = 934828179861044820L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService service = UserService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/user/myInfo.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String kind = req.getParameter("kind");
		String uid  = req.getParameter("uid");
		
		logger.debug("kind : " + kind);
		logger.debug("uid : "  + uid);
		
		switch(kind)
		{
		case "WITHDRAW":
			int result = service.updateUserForWithdraw(uid);
			
			JsonObject json = new JsonObject();
			json.addProperty("result", result);
			
			resp.getWriter().print(json);
			
			break;
		case "PASSWORD":
			break;
		case "MODIFY":
			break;
		}
		
		
	}
}
