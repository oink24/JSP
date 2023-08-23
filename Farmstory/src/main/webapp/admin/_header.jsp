<%@ page import="kr.co.farmstory.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");

	if (sessUser == null) // 로그인하지 않고 접근 시도 시
	{
		response.sendRedirect("/Farmstory/user/login.jsp?success=101");
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Farmstory::admin</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <div id="container">
        <header>
            <a href="./index.jsp" class="logo"><img src="./images/admin_logo.jpg" alt="로고"/></a>
            <p>
                <a href="/Farmstory">HOME |</a>
                <a href="/Farmstory/user/logout.jsp">로그아웃 |</a>
                <a href="#">고객센터</a>
            </p>
        </header>