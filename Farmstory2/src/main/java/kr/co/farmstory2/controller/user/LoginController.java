package kr.co.farmstory2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.UserService;

@WebServlet("/user/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1294748459753276074L;
	private UserService service = UserService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String success = req.getParameter("success");
		req.setAttribute("success", success);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user/login.jsp");
		dispatcher.forward(req, resp);	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid  = req.getParameter("uid");
		String pass = req.getParameter("pass");
		
		UserDTO user = service.selectUser(uid, pass); // 사용자가 존재하지 않으면 null
		
		if (user != null)
		{
			// 현재 세션 구하기
			HttpSession session = req.getSession();
			
			// 사용자 세션 설정
			session.setAttribute("sessUser", user);
			
			resp.sendRedirect("/Farmstory2");
		}
		else
		{
			resp.sendRedirect("/Farmstory2/user/login.do?success=100");
		}
	}
}
