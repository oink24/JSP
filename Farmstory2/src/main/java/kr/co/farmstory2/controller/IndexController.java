package kr.co.farmstory2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.service.ArticleService;

// 시작페이지 index.jsp가 없으므로 기본주소("")에 대한 맵핑 추가
@WebServlet(value = {"", "/index.do"})
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = -5141473195026626452L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.INSTANCE;

	// 컨텍스트 경로(/Farmstory2) 전역변수
	private String ctxPath;
	
	@Override
	public void init(ServletConfig config) throws ServletException {

		// 컨텍스트 경로(/Farmstory2) 구하기(최초 1번)
		ctxPath = config.getServletContext().getContextPath();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String success = req.getParameter("success");
		req.setAttribute("success", success);
		
		List<ArticleDTO> latest1 = service.selectLatests("story", 5);
		List<ArticleDTO> latest2 = service.selectLatests("grow", 5);
		List<ArticleDTO> latest3 = service.selectLatests("school", 5);
		
		List<ArticleDTO> tabLatests1 = service.selectLatests("notice", 3);
		List<ArticleDTO> tabLatests2 = service.selectLatests("qna", 3);
		List<ArticleDTO> tabLatests3 = service.selectLatests("faq", 3);
		
		req.setAttribute("latest1", latest1);
		req.setAttribute("latest2", latest2);
		req.setAttribute("latest3", latest3);
		req.setAttribute("tabLatests1", tabLatests1);
		req.setAttribute("tabLatests2", tabLatests2);
		req.setAttribute("tabLatests3", tabLatests3);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		dispatcher.forward(req, resp);	
	}
}
