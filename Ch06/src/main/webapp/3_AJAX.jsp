<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3_AJAX</title>
		<!-- 
			날짜 : 2023/07/31
			이름 : 강나은
			내용 : JSP AJAX 실습
		-->
		<script>
			window.onload = function(){
				
				const btn1 = document.getElementById("btn1");
				const spans = document.getElementsByTagName('span');
				
				btn1.onclick = function(){
					
					const xhr = new XMLHttpRequest();
					xhr.open('GET', '/Ch06/data/json1.jsp');
					xhr.send();
					
					xhr.onreadystatechange = function(){
						
						if(xhr.readyState == XMLHttpRequest.DONE)
						{
							if(xhr.status == 200)
							{
								const data = JSON.parse(xhr.response);
								console.log('data : ' + data);
								
								spans[0].innerText = data.uid;
								spans[1].innerText = data.name;
								spans[2].innerText = data.hp;
								spans[3].innerText = data.age;
							}
						}
						
					} // onreadystatechange end
					
				} // btn1 onclick end
				
				
				const btn2 = document.getElementById('btn2');
				const table = document.getElementsByTagName('table')[0];
				
				btn2.addEventListener('click', function(){

					fetch('/Ch06/data/json2.jsp')
						.then((response)=>{
							console.log(response);							
							return response.json();							
						})
						.then((data)=>{
							console.log(data);
							
							for(let user of data)
							{
	                            console.log(user);
	                            
								const tr = document.createElement('tr');
	                            const td1 = document.createElement('td');
	                            const td2 = document.createElement('td');
	                            const td3 = document.createElement('td');
	                            const td4 = document.createElement('td');
	                            
	                            td1.innerText = user.uid;
	                            td2.innerText = user.name;
	                            td3.innerText = user.hp;
	                            td4.innerText = user.age;
	
	                            tr.appendChild(td1);
	                            tr.appendChild(td2);
	                            tr.appendChild(td3);
	                            tr.appendChild(td4);
	
	                            table.appendChild(tr);   
							}
							
						}); // fetch end
					
				}); // btn2 addEventListener end
				
			} // window.onload end
		</script>
	</head>
	<body>
		<h3>3. AJAX 실습</h3>
		
		<h4>JSON/XML 실습</h4>
		<input type="button" value="JSON1 데이터 생성" onclick="location.href='./data/json1.jsp'"><br>
		<input type="button" value="JSON2 데이터 생성" onclick="location.href='./data/json2.jsp'"><br>
		<input type="button" value="xml1 데이터 생성" onclick="location.href='./data/xml1.jsp'"><br>
		<input type="button" value="xml2 데이터 생성" onclick="location.href='./data/xml2.jsp'">
	
		<h4>AJAX 실습</h4>
		<button id="btn1">데이터 요청</button>
		<p>
			아이디 : <span></span><br>
			이름 : <span></span><br>
			휴대폰 : <span></span><br>
			나이 : <span></span><br>
		</p>
		
		<button id="btn2">데이터 요청</button>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>휴대폰</td>
				<td>나이</td>
			</tr>
		</table>
	</body>
</html>