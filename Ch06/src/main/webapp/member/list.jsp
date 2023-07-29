<%@ page import="vo.MemberVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터베이스 처리 
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	List<MemberVO> users = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = 	DriverManager.getConnection(host, user, pass);
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `member`");
		
		while(rs.next())
		{
			MemberVO vo = new MemberVO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setPos(rs.getString(4));
			vo.setDep(rs.getString(5));
			
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
		<title>member::list</title>
	</head>
	<body>
		<h3>User4 목록</h3>
		<input type="button" value="처음으로" onclick="location.href='/Ch06/1_JDBC.jsp'">
		<input type="button" value="Member 등록" onclick="location.href='/Ch06/member/register.jsp'">

		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>직급</th>
				<th>부서</th>
			</tr>
			<% for(MemberVO vo : users) { %>
			<tr>
				<td><%= vo.getUid() %></td>
				<td><%= vo.getName() %></td>
				<td><%= vo.getHp() %></td>
				<td><%= vo.getPos() %></td>
				<td><%= vo.getDep() %></td>
				<td>
					<!-- 수정과 삭제를 위한 uid 값 get방식으로 전송 -->
					<input type="button" value="수정" onclick="location.href='/Ch06/member/modify.jsp?uid=<%= vo.getUid() %>'">
					<input type="button" value="삭제" onclick="location.href='/Ch06/member/delete.jsp?uid=<%= vo.getUid() %>'">
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>