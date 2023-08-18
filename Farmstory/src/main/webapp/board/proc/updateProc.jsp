<%@ page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@ page import="kr.co.farmstory.dto.ArticleDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String group   = request.getParameter("group");
	String cate    = request.getParameter("cate");
	String no      = request.getParameter("no");
	String title   = request.getParameter("title");
	String content = request.getParameter("content");
	String file    = request.getParameter("file");
	
	ArticleDTO dto = new ArticleDTO();
	dto.setCategory(cate);
	dto.setNo(no);
	dto.setTitle(title);
	dto.setContent(content);
	
	ArticleDAO dao = new ArticleDAO();
	dao.updateArticle(dto);
	
	response.sendRedirect("/Farmstory/board/view.jsp?group="+group+"&cate="+cate+"&no="+no);
%>