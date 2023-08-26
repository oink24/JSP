package controller.user2;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.User2DTO;
import service.User2Service;

@WebServlet("/user2/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = -2651683800821644616L;
	private User2Service service = new User2Service();
	
	// Java 기본 로거
	private Logger logger = Logger.getGlobal();
	
	@Override
	public void init() throws ServletException {
		logger.info("user2 ListController init()...1");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("user2 ListController doGet()...1");
		
		List<User2DTO> users = service.selectUser2s();
		
		// View에서 users 참조하기 위해 request Scope 저장
		req.setAttribute("users", users);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user2/list.jsp");
		dispatcher.forward(req, resp);
		
		logger.info("user2 ListController doGet()...2");
	}
}
