package ko.co.Jboard2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ko.co.Jboard2.dto.ArticleDTO;
import ko.co.Jboard2.dto.UserDTO;
import ko.co.Jboard2.service.ArticleService;

@WebServlet("/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1426386210669161437L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 현재 세션 가져오기
		HttpSession session = req.getSession();
		UserDTO sessUser = (UserDTO) session.getAttribute("sessUser"); // 로그인 사용자 객체
		
		String pg = req.getParameter("pg"); // 현재 페이지번호 수신
		
		// 페이지 관련 변수
		int currentPage  = service.getCurrentPage(pg);    // 현재 페이지 번호
		int total        = service.selectCountTotal();    // 전체 게시물 갯수
		int lastPageNum  = service.getLastPageNum(total); // 마지막 페이지 번호
		int[] result     = service.getPageGroupNum(currentPage, lastPageNum); // 페이지그룹 start, end 번호
		int pageStartNum = service.getPageStartNum(total, currentPage);       // 페이지 게시글 시작번호
		int start        = service.getStartNum(currentPage); // 시작 인덱스
		
		// 글 조회
		List<ArticleDTO> articles = service.selectArticles(start);
		
		if (sessUser != null)
		{
			// VIEW 공유 참조
			req.setAttribute("articles", articles);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("lastPageNum", lastPageNum);
			req.setAttribute("pageGroupStart", result[0]);
			req.setAttribute("pageGroupEnd", result[1]);
			req.setAttribute("pageStartNum", pageStartNum+1);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("list.jsp");
			dispatcher.forward(req, resp);
		}
		else
		{
			resp.sendRedirect("/Jboard2/user/login.do?success=101");
		}
	}
}
