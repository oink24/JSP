package controller;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import service.MemberService;

@WebServlet("/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = -1059275453772015863L;

	// enum을 이용한 싱글톤 객체
	private MemberService service = MemberService.INSTANCE;
	
	// Java 기본 로거
	private Logger logger = Logger.getGlobal();
	
	@Override
	public void init() throws ServletException {
		logger.info("ListController init()...1");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("ListController doGet()...1");
		
		List<MemberDTO> members = service.selectMembers();
		
		// View에서 members 참조하기 위해 request Scope 저장
		req.setAttribute("members", members);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/list.jsp");
		dispatcher.forward(req, resp);
		
		logger.info("ListController doGet()...2");
	}
}
