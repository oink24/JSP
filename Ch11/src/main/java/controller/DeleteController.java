package controller;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = -893782725067255864L;
	
	// enum을 이용한 싱글톤 객체
	private MemberService service = MemberService.INSTANCE;
	
	// Java 기본 로거
	private Logger logger = Logger.getGlobal();
	
	@Override
	public void init() throws ServletException {
		logger.info("DeleteController init()...1");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("DeleteController doGet()...1");
		
		String uid = req.getParameter("uid");
		
		service.deleteMember(uid);
		resp.sendRedirect("/Ch11/list.do");
		
		logger.info("DeleteController doGet()...2");
	}
}
