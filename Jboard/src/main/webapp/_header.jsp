<%@ page import="kr.co.jboard.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");

	if (sessUser == null)
	{
		response.sendRedirect("/Jboard/user/login.jsp?success=101");
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board System v1.0</title>
    <link rel="stylesheet" href="/Jboard/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
    <div id="container"></div>
	    <header>
	        <h3><a href="/Jboard">Board System v1.0</a></h3>
	        <p>
	            <%= sessUser.getNickname() %>님 반갑습니다.
	            <a href="/Jboard/user/logout.jsp" class="logout">[로그아웃]</a>
	        </p>
	    </header>