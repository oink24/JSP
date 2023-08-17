<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="kr.co.farmstory.dao.UserDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	
	int result = UserDAO.getInstance().selectCountEmail(email);
	
	// JSON 생성
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	// JSON 출력
	String jsonData = json.toString();
	out.print(jsonData);
%>