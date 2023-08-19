/**
 * 사용자 개인정보 중복체크 (아이디,닉네임,이메일,전화번호)
 */
$(function(){
	// 아이디 중복체크
	$('#btnCheckUid').click(function(){
		
		const uid = $('input[name=uid]').val();
		
		// 아이디 입력값 검사
		if (!uid.match(reUid))
		{
			$('.resultId').css('color', 'red').text('아이디는 영소문자로 시작하여 5자리 이상, 숫자와의 조합만 가능합니다.');
			isUidOk = false;
			return;
		}
		
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
				{
					$('.resultId').css('color', 'red').text('이미 사용중인 아이디입니다.');
					isUidOk = false;
				}
				else
				{
					$('.resultId').css('color', 'green').text('사용 가능한 아이디입니다.');
					isUidOk = true;
				}
			}
		})
	});
	
	// 닉네임 중복체크
	$('input[name=nickname]').focusout(function(){
		
		// 입력데이터 가져오기
		const nickname = $(this).val();
		
		// 닉네임 입력값 검사
		if (!nickname.match(reNickname))
		{
			$('.resultNickname').css('color', 'red').text('유효한 닉네임이 아닙니다.');
			isNicknameOk = false;
			return;
		}
		
		// JSON 생성
		const jsonData = {
				"nickname": nickname
		};
		
		// 데이터 전송
		$.get('/Jboard/user/checkNick.jsp', jsonData, function(data){
			
			if (data.result >= 1)
			{
				$('.resultNickname').css('color', 'red').text('이미 사용중인 닉네임입니다.');
				isNicknameOk = false;
			}
			else
			{
				$('.resultNickname').css('color', 'green').text('사용 가능한 닉네임입니다.');
				isNicknameOk = true;
			}
		});
	});
	
	// 이메일 중복체크
	document.getElementsByName('email')[0].onfocusout = function(){
		
		const resultEmail = document.getElementsByClassName('resultEmail')[0];
		
		// 입력데이터 가져오기
		const email = this.value;
		
		// 이메일 입력값 검사
		if (!email.match(reEmail))
		{
			resultEmail.innerText = '유효한 이메일이 아닙니다.';
			resultEmail.style.color = 'red';
			isEmailOk = false;
			return;
		}
		
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
					
					if (data.result >= 1){
						resultEmail.innerText = '이미 사용중인 이메일입니다.';
						resultEmail.style.color = "red"
						isEmailOk = false;
					}else{
						resultEmail.innerText = '사용 가능한 이메일입니다.';
						resultEmail.style.color = "green"
						isEmailOk = true;
					}
				}
			}
		}
	}
	
	// 휴대폰번호 중복체크
	document.getElementsByName('hp')[0].addEventListener('focusout', function(){
		
		const resultHp = document.getElementsByClassName('resultHp')[0];
		const hp = this.value;
		
		// 휴대폰 입력값 검사
		if (!hp.match(reHp))
		{
			resultHp.innerText = '유효한 휴대폰 번호가 아닙니다.';
			resultHp.style.color = "red"
			isHpOk = false;
			return;
		}
		
		// 데이터 전송
		const url = '/Jboard/user/checkHp.jsp?hp='+this.value;
		
		fetch(url)
			.then(response => response.json())
			.then(data => {
				
				if (data.result >= 1){
					resultHp.innerText = '이미 사용중인 휴대폰번호입니다.';
					resultHp.style.color = "red"
					isHpOk = false;
				}else{
					resultHp.innerText = '사용 가능한 휴대폰번호입니다.';
					resultHp.style.color = "green"
					isHpOk = true;
				}
			});
	});
});