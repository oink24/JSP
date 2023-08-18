<%@ page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String no	 = request.getParameter("no");
	
	ArticleDAO dao = new ArticleDAO();
	dao.deleteArticle(no, cate);
	
	response.sendRedirect("/Farmstory/board/list.jsp?group="+group+"&cate="+cate);
%>