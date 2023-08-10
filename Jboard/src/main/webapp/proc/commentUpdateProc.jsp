<%@ page import="kr.co.jboard.dao.ArticleDAO"%>
<%@ page import="kr.co.jboard.dto.ArticleDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String content = request.getParameter("comment");
	String no = request.getParameter("no");
	String parent = request.getParameter("parent");
	
	ArticleDTO dto = new ArticleDTO();
	dto.setContent(content);
	dto.setNo(no);
	
	ArticleDAO dao = new ArticleDAO();
	dao.updateComment(dto);
	
	response.sendRedirect("/Jboard/view.jsp?no="+parent);
%>