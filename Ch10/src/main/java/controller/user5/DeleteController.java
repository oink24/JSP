package controller.user5;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.User5Service;

@WebServlet("/user5/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = -5429937399248363554L;
	private User5Service service = new User5Service();
	
	// Java 기본 로거
	private Logger logger = Logger.getGlobal();
	
	@Override
	public void init() throws ServletException {
		logger.info("user5 DeleteController init()...1");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("user5 DeleteController doGet()...1");
		
		String uid = req.getParameter("uid");
		
		service.deleteUser5(uid);
		resp.sendRedirect("/Ch10/user5/list.do");
		
		logger.info("user5 DeleteController doGet()...2");
	}
}
