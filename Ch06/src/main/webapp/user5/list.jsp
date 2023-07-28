<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="vo.User5VO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터베이스 처리 
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	List<User5VO> users = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = 	DriverManager.getConnection(host, user, pass);
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `user5`");
		
		while(rs.next())
		{
			User5VO vo = new User5VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setBirth(rs.getString(3));
			vo.setGender(rs.getInt(4));
			vo.setAge(rs.getInt(5));
			vo.setAddr(rs.getString(6));
			vo.setHp(rs.getString(7));
			
			users.add(vo);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user5::list</title>
	</head>
	<body>
		<h3>User5 목록</h3>
		<input type="button" value="처음으로" onclick="location.href='/Ch06/1_JDBC.jsp'">
		<input type="button" value="User5 등록" onclick="location.href='/Ch06/user5/register.jsp'">
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
				<th>휴대폰</th>
				<th>관리</th>
			</tr>
			<% for(User5VO vo : users) { %>
			<tr>
				<td><%= vo.getUid() %></td>
				<td><%= vo.getName() %></td>
				<td><%= vo.getBirth() %></td>
				<td><%= (vo.getGender()==1)?"남":"여" %></td>
				<td><%= vo.getAge() %></td>
				<td><%= vo.getAddr() %></td>
				<td><%= vo.getHp() %></td>
				<td>
					<!-- 수정과 삭제를 위한 uid 값 get방식으로 전송 -->
					<input type="button" value="수정" onclick="location.href='/Ch06/user5/modify.jsp?uid=<%= vo.getUid() %>'">
					<input type="button" value="삭제" onclick="location.href='/Ch06/user5/delete.jsp?uid=<%= vo.getUid() %>'">
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>