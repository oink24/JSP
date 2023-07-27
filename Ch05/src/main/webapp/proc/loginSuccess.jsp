<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sessId = (String)session.getAttribute("sessId"); //Object클래스니까 다운캐스팅
	
	if (sessId == null)
	{
		response.sendRedirect("../2_session.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginSuccess</title>
	</head>
	<body>
		<h3>로그인 성공</h3>
		<p>
			<%= sessId %>님 반갑습니다.<br>
			<a href="./logout.jsp">로그아웃</a>
		</p>
	</body>
</html>