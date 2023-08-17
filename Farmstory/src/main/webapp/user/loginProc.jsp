<%@ page import="kr.co.farmstory.dao.UserDAO"%>
<%@ page import="kr.co.farmstory.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid  = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	UserDTO user = UserDAO.getInstance().selectUser(uid, pass);
	
	if (user != null)
	{
		// 세션처리
		session.setAttribute("sessUser", user);
		
		response.sendRedirect("/Farmstory");
	}
	else
	{
		response.sendRedirect("/Farmstory/user/login.jsp?success=100");
	}
%>