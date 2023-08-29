/**
 * 사용자 중복체크
 */
window.onload = function(){
	
	// 아이디 중복체크
	const inputUid    = document.getElementsByName('uid')[0];
	const uidResult   = document.getElementsByClassName('uidResult')[0];
	const btnCheckUid = document.getElementById('btnCheckUid');
	
	btnCheckUid.onclick = function(){
		
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
						uidResult.innerText = '이미 사용중인 아이디입니다.';
						uidResult.style.color = 'red';
					}
					else
					{
						uidResult.innerText = '사용 가능한 아이디입니다.'
						uidResult.style.color = 'green';
					}
				}
			}
		}
	} // btnCheckUid.onclick end
	
	// 닉네임 중복체크
	$('#btnCheckNick').click(function(){
		
		const nick = $('input[name=nick]').val();
		
		$.ajax({
			url: '/Jboard2/user/checkNick.do?nick='+nick,
			type: 'get',
			dataType: 'json',
			success: function(data){
				
				if (data.result > 0)
					$ ('.nickResult').css('color', 'red').text('이미 사용중인 닉네임입니다.');
				else
					$('.nickResult').css('color', 'green').text('사용 가능한 닉네임입니다.');
			}
		});
	}); // btnCheckNick
	
	// 휴대폰번호 중복체크
	$('input[name=hp]').focusout(function(){
		
		const hp  = $(this).val();
		const url = '/Jboard2/user/checkHp.do?hp='+hp;
		
		$.get(url, function(result){
			
			const data = JSON.parse(result);
			
			if(data.result > 0)
				$('.resultHp').css('color', 'red').text('이미 사용중인 휴대폰입니다.');
			else
				$('.resultHp').css('color', 'green').text('사용 가능한 휴대폰번호입니다.');
		});
	});
} // onload end