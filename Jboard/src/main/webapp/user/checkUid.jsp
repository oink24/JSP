<%@ page import="kr.co.jboard.dao.UserDAO"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	
	// uid는 PK이므로 결과값 항상 1(이미존재) or 0(존재X)
	int result = UserDAO.getInstance().selectCountUid(uid);
	
	// JSON 생성
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	// JSON 출력
	String jsonData = json.toString();
	out.print(jsonData);
%>