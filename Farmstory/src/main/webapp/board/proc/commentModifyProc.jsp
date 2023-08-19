<%@ page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@ page import="kr.co.farmstory.dto.ArticleDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String group   = request.getParameter("group");
	String cate	   = request.getParameter("cate");
	String no 	   = request.getParameter("no");
	String parent  = request.getParameter("parent");
	String content = request.getParameter("comment");
	
	ArticleDTO dto = new ArticleDTO();
	dto.setNo(no);
	dto.setContent(content);
	
	ArticleDAO dao = new ArticleDAO();
	dao.updateComment(dto);
	
	response.sendRedirect("/Farmstory/board/view.jsp?group="+group+"&cate="+cate+"&no="+parent);
%>