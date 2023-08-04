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
	// 전송데이터 수신
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	// 사용자 DB 조회
	UserVO user = UserDAO.getInstance().selectUser(uid, pass);
	
	// 회원여부 확인
	if (user != null)
	{
		// 세션처리
		session.setAttribute("sessUser", user);
		
		// 리다이렉트
		response.sendRedirect("/Jboard/list.jsp");
	}
	else
	{
		// 리다이렉트
		response.sendRedirect("/Jboard/user/login.jsp?success=100");
	}
%>