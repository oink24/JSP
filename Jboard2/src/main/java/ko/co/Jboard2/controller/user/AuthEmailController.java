package ko.co.Jboard2.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import ko.co.Jboard2.service.UserService;

@WebServlet("/user/authEmail.do")
public class AuthEmailController extends HttpServlet {
	private static final long serialVersionUID = 4935019054359303516L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService service = UserService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String type  = req.getParameter("type");
		String name  = req.getParameter("name");
		String email = req.getParameter("email");
		
		int result = 0;
		int status = 0;
		
		if (type.equals("REGISTER")) // 회원가입
		{
			result = service.selectCountEmail(email); // 중복여부(1 or 0)
			status = service.sendCodeByEmail(email);  // 전송결과(1 or 0)
		}
		else if (type.equals("FIND_ID")) // id 찾기
		{
			result = service.selectCountNameAndEmail(name, email); // 일치하는 이름과 이메일 존재여부(1 or 0)
			
			if (result == 1)
				status = service.sendCodeByEmail(email); // 전송결과(1 or 0)
		}
			
		// JSON 생성
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		json.addProperty("status", status);
		
		// JSON 출력
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String code = req.getParameter("code");
		logger.info("code : " + code);

		int result = service.confirmCodeByEmail(code);
		logger.info("result : " + result);

		// JSON 생성
		JsonObject json = new JsonObject();
		json.addProperty("result", result);

		// JSON 출력
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
	}
}
