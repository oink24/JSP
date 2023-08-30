/**
 * 사용자 중복체크
 */
$(function(){
	
	// 아이디 중복체크
	const inputUid    = document.getElementsByName('uid')[0];
	const resultUid   = document.getElementsByClassName('resultUid')[0];
	const btnCheckUid = document.getElementById('btnCheckUid');
	
	if (btnCheckUid != null)
	{
		btnCheckUid.onclick = function(){
			
			const uid = inputUid.value;
			
			// 아이디 입력값 검사
			if (!uid.match(reUid))
			{
				resultUid.innerText = '아이디는 영소문자로 시작하여 5자리 이상, 숫자와의 조합만 가능합니다.';
				resultUid.style.color = 'red';
				isUidOk = false;
				return;
			}
			
			// 서버 전송
			const xhr = new XMLHttpRequest();
			xhr.open('GET', '/Jboard2/user/checkUid.do?uid='+inputUid.value);
			xhr.send();
			
			xhr.onreadystatechange = function(){
				if (xhr.readyState == XMLHttpRequest.DONE)
				{
					if (xhr.status == 200)
					{
						const data = JSON.parse(xhr.response);
						
						if (data.result > 0)
						{
							resultUid.innerText = '이미 사용중인 아이디입니다.';
							resultUid.style.color = 'red';
							isUidOk = false;
						}
						else
						{
							resultUid.innerText = '사용 가능한 아이디입니다.'
							resultUid.style.color = 'green';
							isUidOk = true;
						}
					}
				}
			}
		} // btnCheckUid.onclick end
	}
	
	// 닉네임 중복체크
	$('#btnCheckNick').click(function(){
		
		const nick = $('input[name=nick]').val();
		
		// 닉네임 입력값 검사
		if (!nick.match(reNick))
		{
			$('.resultNick').css('color', 'red').text('유효한 닉네임이 아닙니다.');
			isNickOk = false;
			return;
		}
		
		$.ajax({
			url: '/Jboard2/user/checkNick.do?nick='+nick,
			type: 'get',
			dataType: 'json',
			success: function(data){
				
				if (data.result > 0)
				{
					$('.resultNick').css('color', 'red').text('이미 사용중인 닉네임입니다.');
					isNickOk = false;
				}
				else
				{
					$('.resultNick').css('color', 'green').text('사용 가능한 닉네임입니다.');
					isNickOk = true;
				}
			}
		});
	}); // btnCheckNick
	
	// 휴대폰번호 중복체크
	$('input[name=hp]').focusout(function(){
		
		const hp  = $(this).val();
		
		// 휴대폰번호 입력값 검사
		if(!hp.match(reHp))
		{
			$('.resultHp').css('color', 'red').text('유효한 휴대폰번호가 아닙니다.');
			isHpOk = false;
			return;	
		}
		
		// 데이터 전송
		const url = '/Jboard2/user/checkHp.do?hp='+hp;
		
		$.get(url, function(result){
			
			const data = JSON.parse(result);
			
			if(data.result > 0)
			{
				$('.resultHp').css('color', 'red').text('이미 사용중인 휴대폰입니다.');
				isHpOk = false;
			}
			else
			{
				$('.resultHp').css('color', 'green').text('사용 가능한 휴대폰번호입니다.');
				isHpOk = true;
			}
		});
	});
});