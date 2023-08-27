package controller.user5;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.User5DTO;
import service.User5Service;

@WebServlet("/user5/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 7268620127242254841L;
	private User5Service service = new User5Service();
	
	// Java 기본 로거
	private Logger logger = Logger.getGlobal();
	
	@Override
	public void init() throws ServletException {
		logger.info("user5 ListController init()...1");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("user5 ListController doGet()...1");
		
		List<User5DTO> users = service.selectUser5s();
		
		// View에서 users 참조하기 위해 request Scope 저장
		req.setAttribute("users", users);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user5/list.jsp");
		dispatcher.forward(req, resp);
		
		logger.info("user5 ListController doGet()...2");
	}
}
