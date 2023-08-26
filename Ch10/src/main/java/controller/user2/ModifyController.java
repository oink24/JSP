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

@WebServlet("/user2/modify.do")
public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = -2129005799940891284L;
	private User2Service service = new User2Service();
	
	// Java 기본 로거
	private Logger logger = Logger.getGlobal();
	
	@Override
	public void init() throws ServletException {
		logger.info("user2 ModifyController init()...1");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("user2 ModifyController doGet()...1");
		
		String uid = req.getParameter("uid");
		
		User2DTO user = service.selectUser2(uid);
		req.setAttribute("user", user);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user2/modify.jsp");
		dispatcher.forward(req, resp);
		
		logger.info("user2 ModifyController doGet()...2");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("user2 ModifyController doPost()...1");
		
		String uid  = req.getParameter("uid");
		String name = req.getParameter("name");
		String hp   = req.getParameter("hp");
		String age  = req.getParameter("age");
		
		User2DTO dto = new User2DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAge(age);
		
		service.updateUser2(dto);
		resp.sendRedirect("/Ch10/user2/list.do");
		
		logger.info("user2 ModifyController doPost()...2");
	}
}
