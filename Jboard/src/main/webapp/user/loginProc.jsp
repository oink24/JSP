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
	UserVO user = null;
	try {
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/Jboard");
		
		Connection conn = ds.getConnection();
		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `user` WHERE `uid`=? AND `PASS`=SHA2(?, 256)");
		psmt.setString(1, uid);
		psmt.setString(2, pass);
		
		ResultSet rs = psmt.executeQuery();
		
		if (rs.next())
		{
			user = new UserVO();
			user.setUid(rs.getString(1));
			user.setPass(rs.getString(2));
			user.setName(rs.getString(3));
			user.setNickname(rs.getString(4));
			user.setEmail(rs.getString(5));
			user.setHp(rs.getString(6));
			user.setRole(rs.getString(7));
			user.setZip(rs.getString(8));
			user.setAddr1(rs.getString(9));
			user.setAddr2(rs.getString(10));
			user.setRegip(rs.getString(11));
			user.setRegDate(rs.getString(12));
			user.setLeaveDate(rs.getString(13));
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// ȸ������ Ȯ��
	if (user != null)
	{
		session.setAttribute("sessUser", user);
		
		// �����̷�Ʈ
		response.sendRedirect("/Jboard/list.jsp");
	}
	else
	{
		// �����̷�Ʈ
		response.sendRedirect("/Jboard/user/login.jsp?success=100");
	}
	
	// ����ó��
	
%>