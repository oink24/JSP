<%@ page import="kr.co.farmstory.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 현재 사용자 로그인 여부 확인
	UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");

	// 로그인 관련 파라미터값
	String success = request.getParameter("success");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Farmstory::main</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="/Farmstory/css/style.css">
    <link rel="stylesheet" href="/Farmstory/user/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script>
    	const success = <%= success %>;
    	if (success == 100)
   		{
    		alert('로그인에 실패하였습니다. 다시 확인하세요.');
   		}
    	else if (success == 101)
    	{
    		alert('로그인을 먼저 해야합니다.');
    	}
    	
    	$(function(){
    		$('.slider > ul').bxSlider({
                slideWidth: 980,
                pager: false,
                controls: false,
                auto: true
            });
    		
    		$('#tabs').tabs();
    	});
    </script>
</head>
<body>
    <div id="container">
        <header>
            <a href="/Farmstory" class="logo">
                <img src="/Farmstory/images/logo.png" alt="logo">
            </a>
            <p>
                <a href="/Farmstory/index.jsp">HOME |</a>
                <% if (sessUser == null) { %>
                <a href="/Farmstory/user/login.jsp">로그인 |</a>
                <a href="/Farmstory/user/terms.jsp">회원가입 |</a>
                <% } else { %>
                <a href="/Farmstory/user/logout.jsp">로그아웃 |</a>
                	<% if (!sessUser.getRole().equals("USER")) { %>
	                	<a href="/Farmstory/admin/">관리자 |</a>
	                <% } %>
                <% } %>
                <a href="#">고객센터</a>
            </p>
            <img src="/Farmstory/images/head_txt_img.png" alt="3만원 이상 무료배송">
            <ul class="gnb">
		        <li><a href="/Farmstory/introduction/hello.jsp">팜스토리소개</a></li>
		        <li><a href="/Farmstory/market/list.jsp">장보기<img src="/Farmstory/images/head_menu_badge.png"></a></li>
		        <li><a href="/Farmstory/board/list.jsp?group=Croptalk&cate=story">농작물이야기</a></li>
		        <li><a href="/Farmstory/board/list.jsp?group=Event&cate=event">이벤트</a></li>
		        <li><a href="/Farmstory/board/list.jsp?group=Community&cate=notice">커뮤니티</a></li>
		    </ul>
		</header>