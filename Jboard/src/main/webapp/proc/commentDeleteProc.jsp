<%@ page import="kr.co.jboard.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no 	  = request.getParameter("no"); // 삭제할 댓글 번호
	String parent = request.getParameter("parent"); // 해당 게시글 번호
	
	ArticleDAO dao = new ArticleDAO();
	dao.deleteComment(no); // 댓글 삭제
	dao.updateArticleForCommentMinus(parent); // 댓글 카운트 수정 (-)
	
	response.sendRedirect("/Jboard/view.jsp?no="+parent);
%>