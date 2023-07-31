<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2_DBCP</title>
		<!-- 
			날짜 : 2023/07/31
			이름 : 강나은
			내용 : JSP DBCP 실습
			
			DBCP(DataBase Connection Pool)
			 - 데이터베이스 접속 커넥션 객체를 미리 생성해서 풀(pool)에 저장해놓고 사용하는 방식
			 - 일반 접속 커넥션(JDBC)의 사용자가 많아지면 시스템 성능이 느려지는 단점을 보완
		-->
	</head>
	<body>
		<h3>2. DBCP 실습</h3>
		
		<input type="button" value="User2 CRUD 실습" onclick="location.href='/Ch06/user2/register.jsp'">
	</body>
</html>