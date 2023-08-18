<%@ page import="kr.co.jboard.dto.ArticleDTO"%>
<%@ page import="kr.co.jboard.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String parent  = request.getParameter("parent");
	String writer  = request.getParameter("writer");
	String content = request.getParameter("content");
	String regip   = request.getRemoteAddr();
	
	ArticleDTO dto = new ArticleDTO();
	dto.setParent(parent);
	dto.setContent(content);
	dto.setWriter(writer);
	dto.setRegip(regip);
	
	ArticleDAO dao = new ArticleDAO();
	dao.insertComment(dto); // 댓글 입력
	dao.updateArticleForCommentPlus(parent); // 댓글 카운트 수정 (+)
	
	response.sendRedirect("/Jboard/view.jsp?no="+parent);
%>