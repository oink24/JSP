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

@WebServlet("/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 2297340746611170268L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 현재 세션 가져오기
		HttpSession session = req.getSession();
		UserDTO sessUser = (UserDTO) session.getAttribute("sessUser"); // 로그인 사용자 객체
		
		String no = req.getParameter("no");
		
		// 게시글 조회
		ArticleDTO article = service.selectArticle(no);
		
		// 댓글 조회
		List<ArticleDTO> comments = service.selectComments(no);
		
		if (sessUser != null)
		{
			// VIEW 공유 참조
			req.setAttribute("no", no);
			req.setAttribute("article", article);
			req.setAttribute("comments", comments);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/view.jsp");
			dispatcher.forward(req, resp);
		}
		else
		{
			resp.sendRedirect("/Jboard2/user/login.do?success=101");
		}
	}
}
