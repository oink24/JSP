package kr.co.farmstory2.controller.market;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.ProductService;

@WebServlet("/market/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = -3043407315367193492L;
	private Logger logger = LoggerFactory.getLogger(this.getClass()); 
	private ArticleService aService = ArticleService.INSTANCE;
	private ProductService pService = ProductService.INSTANCE; 

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String success = req.getParameter("success");
		String type = req.getParameter("type");
		String pg   = req.getParameter("pg");

		logger.debug("type : " + type);
		logger.debug("pg : " + pg);
		
		if (type == null)
			type = "0";
		
		int currentPage  = aService.getCurrentPage(pg);       // 현재 페이지 번호
		int total        = aService.selectCountTotal(type);   // 전체 게시물 갯수
		int lastPageNum  = aService.getLastPageNum(total);    // 마지막 페이지 번호
		int[] result     = aService.getPageGroupNum(currentPage, lastPageNum); // 페이지그룹 start, end 번호
		int pageStartNum = aService.getPageStartNum(total, currentPage); // 페이지 시작번호
		int start        = aService.getStartNum(currentPage); // 시작 인덱스
		List<ProductDTO> products = pService.selectProducts(type, start);
		
		req.setAttribute("success", success);
		req.setAttribute("type", type);
		req.setAttribute("total", total);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum+1);
		req.setAttribute("products", products);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/market/list.jsp");
		dispatcher.forward(req, resp);	
	}
}
