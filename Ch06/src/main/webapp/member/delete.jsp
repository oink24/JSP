<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인코딩 설정
	request.setCharacterEncoding("UTF-8");

	// 전송데이터 수신
	String uid = request.getParameter("uid");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>member::delete</title>
	</head>
	<body>
		<form action="/Ch06/member/deleteProc.jsp?uid=<%= uid %>" method="post">
			<table border="1">
				<tr>
					<td>아이디 <b><%= uid %>를 삭제</b>하는게 확실합니까?</td>
				</tr>
				<tr>
					<td align="right">
						<input type="submit" value="예">
						<input type="button" value="아니오" onclick="location.href='/Ch06/member/list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>