<%@page import="sub1.Account"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>4_Class</title>
		<!-- 
			날짜 : 2023/07/24
			이름 : 강나은
			내용 : JSP 스크립트릿 클래스 실습
		-->
	</head>
	<body>
		<h3>4. 클래스</h3>
		
		<% 
			Account kb = new Account("국민은행", "101-12-1001", "김유신", 10000);
			kb.deposit(30000);
			kb.withDraw(5000);
			kb.show(out);
			
			Account wr = new Account("우리은행", "101-11-1001", "김춘추", 20000);
			wr.deposit(30000);
			wr.withDraw(5000);
			wr.show(out);
		%>
	</body>
</html>