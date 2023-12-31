<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3_Loop</title>
		<!-- 
			날짜 : 2023/07/24
			이름 : 강나은
			내용 : JSP 스크립트릿 반복문 실습
		-->
	</head>
	<body>
		<h3>3. 반복문</h3>
		
		<h4>for</h4>
		<%
			for(int i=1 ; i<=3 ; i++)
				out.println("<p>i : " + i + "</p>");
		%>
		
		<% for(int i=1 ; i<=3 ; i++) { %>
			<p>i : <%= i %></p>
		<% } %>
		
		<h4>while</h4>
		<%
			int j = 1;
			while(j <= 3)
			{
				out.println("<p>j : " + j + "</p>");
				j++;
			}
		%>
		
		<h4>구구단</h4>
		<table border="1">
			<tr>
				<th>2단</th>
				<th>3단</th>
				<th>4단</th>
				<th>5단</th>
				<th>6단</th>
				<th>7단</th>
				<th>8단</th>
				<th>9단</th>
			</tr>
			<tr>
				<td>2 x 1 = 2</td>
				<td>3 x 1 = 3</td>
				<td>4 x 1 = 4</td>
				<td>5 x 1 = 5</td>
				<td>6 x 1 = 6</td>
				<td>7 x 1 = 7</td>
				<td>8 x 1 = 8</td>
				<td>9 x 1 = 9</td>
			</tr>
			<tr>
			<%
				for (int i=2 ; i<=9 ; i++)
				{
					out.println("<tr>");
					for (int k=2 ; k<=9 ; k++)
					{
						out.println("<td>" + k + " x " + i + " = " + k*i + "</td>");
					}
					out.println("</tr>");
				}					
			%>
			</tr>
		</table>
	</body>
</html>