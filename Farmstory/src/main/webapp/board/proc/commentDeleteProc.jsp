<%@ page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	String group   = request.getParameter("group");
	String cate	   = request.getParameter("cate");
	String no 	   = request.getParameter("no");
	String parent  = request.getParameter("parent");

	ArticleDAO dao = new ArticleDAO();
	dao.deleteComment(no); // ��� ����
	dao.updateArticleForCommentMinus(parent); // ��� ī��Ʈ ���� (-)
	
	response.sendRedirect("/Farmstory/board/view.jsp?group="+group+"&cate="+cate+"&no="+parent);
%>