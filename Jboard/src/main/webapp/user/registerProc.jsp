<%@ page import="kr.co.jboard.dto.UserDTO"%>
<%@ page import="kr.co.jboard.dao.UserDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인코딩 설정
	request.setCharacterEncoding("UTF-8");

	// 전송데이터 수신
	String uid 		= request.getParameter("uid");
	String pass1 	= request.getParameter("pass1");
	String pass2 	= request.getParameter("pass2");
	String name  	= request.getParameter("name");
	String nickname = request.getParameter("nickname");
	String email 	= request.getParameter("email");
	String hp    	= request.getParameter("hp");
	String zip   	= request.getParameter("zip");
	String addr1 	= request.getParameter("addr1");
	String addr2 	= request.getParameter("addr2");
	String regip 	= request.getRemoteAddr();
	
	UserDTO dto = new UserDTO();
	dto.setUid(uid);
	dto.setPass(pass1);
	dto.setName(name);
	dto.setNickname(nickname);
	dto.setEmail(email);
	dto.setHp(hp);
	dto.setZip(zip);
	dto.setAddr1(addr1);
	dto.setAddr2(addr2);
	dto.setRegip(regip);
	
	UserDAO.getInstance().insertUser(dto);
	
	response.sendRedirect("/Jboard/user/login.jsp");
%>