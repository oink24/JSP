package controller.user5;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.User5DTO;
import service.User5Service;

@WebServlet("/user5/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 8312637816853853119L;
	private User5Service service = new User5Service();
	
	// Java 기본 로거
	private Logger logger = Logger.getGlobal();
	
	@Override
	public void init() throws ServletException {
		logger.info("user5 RegisterController init()...1");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("user5 RegisterController doGet()...1");

		RequestDispatcher dispatcher = req.getRequestDispatcher("/user5/register.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("user5 RegisterController doPost()...1");
		
		String uid    = req.getParameter("uid");
		String name   = req.getParameter("name");
		String birth  = req.getParameter("name");
		String gender = req.getParameter("gender");
		String age    = req.getParameter("age");
		String addr   = req.getParameter("addr");
		String hp     = req.getParameter("hp");
		
		User5DTO dto = new User5DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setBirth(birth);
		dto.setGender(gender);
		dto.setAge(age);
		dto.setAddr(addr);
		dto.setHp(hp);
		
		service.insertUser5(dto);
		resp.sendRedirect("/Ch10/user5/list.do");
		
		logger.info("user5 RegisterController doPost()...2");
	}
}
