<%@ page import="kr.co.jboard.dao.UserDAO"%>
<%@ page import="kr.co.jboard.vo.UserVO"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	// ���۵����� ����
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	// ����� DB ��ȸ
	UserVO user = UserDAO.getInstance().selectUser(uid, pass);
	
	// ȸ������ Ȯ��
	if (user != null)
	{
		// ����ó��
		session.setAttribute("sessUser", user);
		
		// �����̷�Ʈ
		response.sendRedirect("/Jboard/list.jsp");
	}
	else
	{
		// �����̷�Ʈ
		response.sendRedirect("/Jboard/user/login.jsp?success=100");
	}
%>