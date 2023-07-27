<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그인 폼 띄우기 전에
	// 자동 로그인 체크여부에 따라 로그인 처리
	Cookie[] cookies = request.getCookies(); // loginProc에서 전송한 쿠키 수신
	
	for (Cookie cookie : cookies)
	{
		if(cookie.getName().equals("cid"))
		{
			String id = cookie.getValue();
			session.setAttribute("sessId", id);
		}
	}
	
	// 로그인 여부
	String sessId = (String) session.getAttribute("sessId");
	
	if (sessId != null)
	{
		response.sendRedirect("./loginSuccess.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginForm</title>
	</head>
	<body>
		<h3>로그인</h3>
		<form action="./loginProc.jsp" method="post">
			<input type="text" name="id" placeholder="아이디 입력"><br>
			<input type="password" name="pw" placeholder="비밀번호 입력"><br>
			<label><input type="checkbox" name="auto" value="1">자동 로그인</label>
			<input type="submit" value="로그인">
		</form>
	</body>
</html>