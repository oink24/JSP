package ko.co.Jboard2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ko.co.Jboard2.dto.FileDTO;
import ko.co.Jboard2.service.ArticleService;
import ko.co.Jboard2.service.FileService;

@WebServlet("/fileDownload.do")
public class FileDownloadController extends HttpServlet {
	private static final long serialVersionUID = -7223970756025455445L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService aService = ArticleService.INSTANCE;
	private FileService fService = FileService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fno = req.getParameter("fno");
		logger.debug("fno : " + fno);
		
		// 파일 조회
		FileDTO dto = fService.selecttFile(fno);
		logger.debug(dto.toString());
		
		// 파일 다운로드
		aService.downloadFile(req, resp, dto);
	}
}
