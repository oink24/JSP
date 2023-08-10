<%@	page import="kr.co.jboard.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	
	ArticleDAO dao = new ArticleDAO();
	dao.deleteArticle(no);
	
	response.sendRedirect("/Jboard/list.jsp");
%>