<%@ page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@ page import="kr.co.farmstory.dto.ArticleDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String group   = request.getParameter("group");
	String cate	   = request.getParameter("cate");
	String parent  = request.getParameter("parent");
	String writer  = request.getParameter("writer");
	String content = request.getParameter("content");
	String regip   = request.getRemoteAddr();
	
	ArticleDTO dto = new ArticleDTO();
	dto.setCategory(cate);
	dto.setParent(parent);
	dto.setContent(content);
	dto.setWriter(writer);
	dto.setRegip(regip);
	
	ArticleDAO dao = new ArticleDAO();
	dao.insertComment(dto); // 댓글 입력
	dao.updateArticleForCommentPlus(parent, cate); // 댓글 카운트 수정 (+)
	
	response.sendRedirect("/Farmstory/board/view.jsp?group="+group+"&cate="+cate+"&no="+parent);
%>