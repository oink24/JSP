<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그아웃 - 세션테이블에서 해당 클라이언트 명단을 삭제해야함
	// 세션 해제
	session.invalidate();
	response.sendRedirect("../2_session.jsp");
%>