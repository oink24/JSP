<%@ page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@ page import="kr.co.farmstory.dto.ArticleDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String group   	= request.getParameter("group");
	String cate    	= request.getParameter("cate");
	String title 	= request.getParameter("title");
	String content 	= request.getParameter("content");
	String file 	= request.getParameter("file");
	String writer 	= request.getParameter("writer");
	String regip   	= request.getRemoteAddr();
	
	ArticleDTO dto = new ArticleDTO();
	dto.setCategory(cate);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setWriter(writer);
	dto.setRegip(regip);
	
	ArticleDAO dao = new ArticleDAO();
	dao.insertArticle(dto);
	
	response.sendRedirect("/Farmstory/board/list.jsp?group="+group+"&cate="+cate);
%>