<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션해제
	session.invalidate();

	// 리다이렉트
	response.sendRedirect("/Jboard/user/login.jsp");
%>