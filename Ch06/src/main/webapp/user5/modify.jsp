<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="vo.User5VO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//인코딩 설정
	request.setCharacterEncoding("UTF-8");

	// 전송데이터 수신
	String uid = request.getParameter("uid");
	
	// 데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	User5VO vo = new User5VO();
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `user5` WHERE `uid`=?");
		psmt.setString(1, uid);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next())
		{
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setBirth(rs.getString(3));
			vo.setGender(rs.getInt(4));
			vo.setAge(rs.getInt(5));
			vo.setAddr(rs.getString(6));
			vo.setHp(rs.getString(7));
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user5::modify</title>
	</head>
	<body>
		<h4>User5 수정</h4>
		<input type="button" value="처음으로" onclick="location.href='/Ch06/1_JDBC.jsp'">
		<input type="button" value="User5 목록" onclick="location.href='/Ch06/user5/list.jsp'">

		<form action="/Ch06/user5/modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" readonly value=<%= uid %>></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value=<%= vo.getName() %>></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" name="birth" value=<%= vo.getBirth() %>></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<label><input type="radio" name="gender" value="1" <%= (vo.getGender()==1)?"checked":"" %>>남</label>
						<label><input type="radio" name="gender" value="2" <%= (vo.getGender()==2)?"checked":"" %>>여</label>
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age" value=<%= vo.getAge() %>></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><textarea name="addr"><%= vo.getAddr() %></textarea></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" readonly value=<%= vo.getHp() %>></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정"></td>
				</tr>
			</table>
		</form>
	</body>
</html>