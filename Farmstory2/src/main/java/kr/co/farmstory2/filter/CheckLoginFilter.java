package kr.co.farmstory2.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.UserDTO;

/**
 * 로그인 여부 체크 필터
 * web.xml 필터 등록 및 해당 필터가 작동할 주소매핑 작업
 */
public class CheckLoginFilter implements Filter {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		logger.debug("doFilter...");
		
		// 로그인 여부 확인
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession();
		
		UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");
		
		if (sessUser != null)
		{
			logger.debug("here1...");
			chain.doFilter(request, response);
		}
		else
		{
			// 다음 필터 호출, 필터 없으면 최종 자원 요청
			logger.debug("here2...");
			((HttpServletResponse)response).sendRedirect("/Farmstory2/user/login.do?success=101");
		}
	}
}
