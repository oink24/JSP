<%@ page import="kr.co.jboard.dao.UserDAO"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String nickname = request.getParameter("nickname");
	
	int result = UserDAO.getInstance().selectCountNickname(nickname);
	
	// JSON 생성
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	// JSON 출력
	String jsonData = json.toString();
	out.print(jsonData);
%>