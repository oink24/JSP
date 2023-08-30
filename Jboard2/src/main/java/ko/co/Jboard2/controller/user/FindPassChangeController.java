package ko.co.Jboard2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ko.co.Jboard2.service.UserService;

@WebServlet("/user/findPassChange.do")
public class FindPassChangeController extends HttpServlet{
	private static final long serialVersionUID = -2618299457876878805L;
	private UserService service = UserService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user/findPassChange.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uid   = req.getParameter("uid");
		String pass1 = req.getParameter("pass1");
		service.updateUserPass(uid, pass1);
		
		resp.sendRedirect("/Jboard2/user/login.do?success=300");
	}
}
