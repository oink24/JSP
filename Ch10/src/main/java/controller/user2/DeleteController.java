package controller.user2;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.User2Service;

@WebServlet("/user2/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 3671984898268768393L;
	private User2Service service = new User2Service();
	
	// Java 기본 로거
	private Logger logger = Logger.getGlobal();
	
	@Override
	public void init() throws ServletException {
		logger.info("user2 DeleteController init()...1");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("user2 DeleteController doGet()...1");
		
		String uid = req.getParameter("uid");
		
		service.deleteUser2(uid);
		resp.sendRedirect("/Ch10/user2/list.do");
		
		logger.info("user2 DeleteController doGet()...1");
	}
}
