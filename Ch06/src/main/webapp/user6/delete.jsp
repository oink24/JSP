<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인코딩 설정
	request.setCharacterEncoding("UTF-8");

	// 삭제를 위한 아이디 값 수신
	String uid = request.getParameter("uid");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user2::delete</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<script>
			$(function(){
				
				// 삭제데이터 요청하기
				$.get('./user.jsp?uid=<%=uid%>', function(data){
					console.log(data);
					
					// 삭제데이터 가져오기
					const uid = data.uid;
					const name = data.name;
					const hp = data.hp;
					const age = data.age;
					
					// 삭제데이터 전송하기
					$('input[type=submit]').click(function(e){
						e.preventDefault();
						
						//JSON 생성
						const jsonData = {
							"uid": uid,
							"name": name,
							"hp": hp,
							"age": age
						};
						
						$.post('./deleteProc.jsp', jsonData, function(data){
							
							if (data.result >= 1)
							{
								alert('데이터가 삭제되었습니다.');
								location.href = './list.jsp';
							}
							else
							{
								alert('데이터 삭제에 실패했습니다.');
							}
						});
					});
				});
			});
		</script>
	</head>
	<body>
		<form action="#" method="post">
			<table border="1">
				<tr>
					<td>아이디 <b><%= uid %>를 삭제</b>하시겠습니까?</td>
				</tr>
				<tr>
					<td align="right">
						<input type="submit" value="예">
						<input type="button" value="아니오" onclick="location.href='/Ch06/user6/list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>