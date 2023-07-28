<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user4::register</title>
	</head>
	<body>
		<h4>User4 등록</h4>
		<input type="button" value="처음으로" onclick="location.href='/Ch06/1_JDBC.jsp'">
		<input type="button" value="User4 목록" onclick="location.href='/Ch06/user4/list.jsp'">
		
		<form action="/Ch06/user4/registerProc.jsp" method="post">
			<table border="1">	
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<label><input type="radio" name="gender" value="1">남</label>
						<label><input type="radio" name="gender" value="2">여</label>
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><textarea name="addr"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
	</body>
</html>