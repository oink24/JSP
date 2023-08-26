package controller.user2;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.User2DTO;
import service.User2Service;

@WebServlet("/user2/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = -5532604821869053497L;
	private User2Service service = new User2Service();
	
	// Java 기본 로거
	private Logger logger = Logger.getGlobal();
	
	@Override
	public void init() throws ServletException {
		logger.info("user2 RegisterController init()...1");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("user2 RegisterController doGet()...1");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user2/register.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("user2 RegisterController doPost()...1");
		
		String uid  = req.getParameter("uid");
		String name = req.getParameter("name");
		String hp   = req.getParameter("hp");
		String age  = req.getParameter("age");
		
		User2DTO dto = new User2DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAge(age);
		
		logger.info("user2 RegisterController doPost()...2 : " + dto);
		
		service.insertUser2(dto);
		resp.sendRedirect("/Ch10/user2/list.do");
	}
}
