/**
 * 사용자 개인정보 중복체크 (아이디,닉네임,이메일,전화번호)
 */
$(function(){
	// 아이디 중복체크
	$('#btnCheckUid').click(function(){
		const uid = $('input[name=uid]').val();
		const jsonData = {
			"uid": uid
		};
		$.ajax({
			url: '/Jboard/user/checkUid.jsp',
			type: 'GET',
			data: jsonData,
			dataType: 'json',
			success: function(data){
				if (data.result >= 1)
					$('.resultId').css('color', 'red').text('이미 사용중인 아이디입니다.');
				else
					$('.resultId').css('color', 'green').text('사용 가능한 아이디입니다.');
			}
		})
	});
	
	// 닉네임 중복체크
	$('input[name=nickname]').focusout(function(){
		
		// 입력데이터 가져오기
		const nickname = $(this).val();
		
		// JSON 생성
		const jsonData = {
				"nickname": nickname
		};
		
		// 데이터 전송
		$.get('/Jboard/user/checkNick.jsp', jsonData, function(data){
			
			if (data.result >= 1)
				$('.resultNickname').css('color', 'red').text('이미 사용중인 닉네임입니다.');
			else
				$('.resultNickname').css('color', 'green').text('사용 가능한 닉네임입니다.');
		});
	});
	
	// 이메일 중복체크
	const email = document.getElementsByName('email')[0];
	email.onfocusout = function(){
		
		// 입력데이터 가져오기
		const email = this.value;
		
		// 데이터 전송
		const xhr = new XMLHttpRequest();
		xhr.open('GET', '/Jboard/user/checkEmail.jsp?email='+email);
		xhr.send();
		
		xhr.onreadystatechange = function()
		{
			if (xhr.readyState == XMLHttpRequest.DONE)
			{
				if (xhr.status == 200)
				{
					const data = JSON.parse(xhr.response);
					const resultEmail = document.getElementsByClassName('resultEmail')[0];
					
					if (data.result >= 1){
						resultEmail.innerText = '이미 사용중인 이메일입니다.';
						resultEmail.style.color = "red"
					}else{
						resultEmail.innerText = '사용 가능한 이메일입니다.';
						resultEmail.style.color = "green"
					}
				}
			}
		}
	}
	
	// 휴대폰번호 중복체크
	document.getElementsByName('hp')[0].addEventListener('focusout', function(){
		
		// 데이터 전송
		const url = '/Jboard/user/checkHp.jsp?hp='+this.value;
		
		fetch(url)
			.then(response => response.json())
			.then(data => {
				const resultHp = document.getElementsByClassName('resultHp')[0];
				
				if (data.result >= 1){
					resultHp.innerText = '이미 사용중인 전화번호입니다.';
					resultHp.style.color = "red"
				}else{
					resultHp.innerText = '사용 가능한 전화번호입니다.';
					resultHp.style.color = "green"
				}
			});
	});
});