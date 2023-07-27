<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그아웃 - 세션테이블에서 해당 클라이언트 명단을 삭제해야함
	
	// 세션 해제
	session.invalidate();

	// 쿠키 해제
	Cookie cookie = new Cookie("cid", null); // 같은 이름으로 설정
	cookie.setMaxAge(0); // 쿠키 유효기간
	response.addCookie(cookie);
	
	// redirect
	response.sendRedirect("./loginForm.jsp");
%>