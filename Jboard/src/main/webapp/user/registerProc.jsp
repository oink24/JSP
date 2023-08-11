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
	
	UserDTO vo = new UserDTO();
	vo.setUid(uid);
	vo.setPass(pass1);
	vo.setName(name);
	vo.setNickname(nickname);
	vo.setEmail(email);
	vo.setHp(hp);
	vo.setZip(zip);
	vo.setAddr1(addr1);
	vo.setAddr2(addr2);
	vo.setRegip(regip);
	
	UserDAO.getInstance().insertUser(vo);
	
	response.sendRedirect("/Jboard/user/login.jsp");
%>