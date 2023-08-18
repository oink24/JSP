<%@ page import="kr.co.farmstory.dao.UserDAO"%>
<%@ page import="kr.co.farmstory.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid	  = request.getParameter("uid");
	String pass	  = request.getParameter("pass");
	String target = request.getParameter("target");
	String group  = request.getParameter("group");
	String cate   = request.getParameter("cate");
	String no     = request.getParameter("no");
	
	UserDTO user = UserDAO.getInstance().selectUser(uid, pass);
	
	if (user != null)
	{
		// 세션처리
		session.setAttribute("sessUser", user);
		
		if (!target.equals("null"))
		{
			if (target.equals("write"))
				response.sendRedirect("/Farmstory/board/write.jsp?group="+group+"&cate="+cate);
			else if (target.equals("view"))
				response.sendRedirect("/Farmstory/board/view.jsp?group="+group+"&cate="+cate+"&no="+no);
		}
		else
		{
			response.sendRedirect("/Farmstory");
		}
	}
	else
	{
		response.sendRedirect("/Farmstory/user/login.jsp?success=100");
	}
%>