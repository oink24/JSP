<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.Context"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String nickname = request.getParameter("nickname");
	
	int result = 0;
	
	try {
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/Jboard");
		
		Connection conn = ds.getConnection();
		PreparedStatement psmt = conn.prepareStatement("SELECT COUNT(*) FROM `User` WHERE `nickname`=?");
		psmt.setString(1, nickname);
		
		ResultSet rs = psmt.executeQuery();
		
		if (rs.next())
			result = rs.getInt(1);
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// JSON 생성
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	// JSON 출력
	String jsonData = json.toString();
	out.print(jsonData);
%>