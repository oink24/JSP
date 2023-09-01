package ko.co.Jboard2.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ko.co.Jboard2.service.ArticleService;
import ko.co.Jboard2.service.FileService;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 2848984032605873938L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService aService = ArticleService.INSTANCE;
	private FileService fService = FileService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
		logger.debug("no : " + no);
		
		// 파일 삭제(DB)
		int result = fService.deleteFile(no);
		
		// 글+댓글 삭제
		aService.deleteArticle(no);

		// 파일 삭제(Directory)
		if (result > 0)
		{
			String path = aService.getFilePath(req);

			File file = new File(path+"/"+"파일명");

			if (file.exists())
				file.delete();	
		}

		resp.sendRedirect("/Jboard2/list.do");
	}
}
