package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/greeting.do")
public class GreetingServlet extends HttpServlet {
	private static final long serialVersionUID = 3L;
	
	@Override
	public void init() throws ServletException {
		// 서블릿 최초 실행 시
		System.out.println("GreetingServlet init()..");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트측의 GET 요청 시
		System.out.println("GreetingServlet doGet()..");
		
		// HTML 출력
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = resp.getWriter(); // 출력객체
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("<title>GreetingServlet</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>GreetingServlet</h3>");
		writer.println("<a href='./1_Servlet.jsp'>Servlet main</a>");
		writer.println("<a href='./hello.do'>HelloServlet</a>");
		writer.println("<a href='./welcome.do'>WelcomeServlet</a>");
		writer.println("<a href='./greeting.do'>GreetingServlet</a>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트측의 POST 요청 시
		System.out.println("GreetingServlet doPost()..");
	}
	@Override
	public void destroy() {
		// 서블릿 종료 시
		System.out.println("GreetingServlet destroy()..");
	}
}