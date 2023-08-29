/**
 * 이메일 인증
 */
$(function(){
	
	let preventDoubleClick = false;
	
	$('#btnEmailCode').click(function(){
		
		const email = $('input[name=email]').val();
		
		// 이메일 입력값 검사
		if (!email.match(reEmail))
		{
			$('.resultEmail').css('color', 'red').text('유효한 이메일이 아닙니다.');
			isEmailOk = false;
			return;
		}
		
		const jsonData = {
			"email": email
		};
		
		if (preventDoubleClick)
			return;
		
		preventDoubleClick = true;
		$('.resultEmail').css('color', 'red').text('인증코드 전송 중입니다. 잠시만 기다려주세요.');
		
		setTimeout(function(){
			
			$.ajax({
				url: '/Jboard2/user/authEmail.do',
				type: 'GET',
				data: jsonData,
				dataType: 'json',
				success: function(data){
					console.log(data);
					
					if (data.result > 0)
					{
						$('.resultEmail').css('color', 'red').text('이미 사용중인 이메일입니다.');
						isEmailOk = false;
					}
					else
					{
						if (data.status > 0)
						{
							$('.resultEmail').css('color', 'red').text('이메일을 확인 후 인증코드를 입력하세요.');
							$('.auth').show();
							$('input[name=email]').attr('readonly', true);
						}
						else
						{
							$('.resultEmail').css('color', 'red').text('인증코드 전송이 실패했습니다. 잠시후 다시 시도하십시오.');
						}
					}
					
					preventDoubleClick = false;
				}
			});
		}, 1000); // setTimeout end
	});
	
	$('#btnEmailAuth').click(function(){
		
		const code = $('input[name=auth]').val();
		const jsonData = {
			"code": code
		};
		
		$.ajax({
			url: '/Jboard2/user/authEmail.do',
			type: 'POST',
			data: jsonData,
			dataType: 'json',
			success: function(data){
				
				console.log(data);
				
				if (data.result > 0)
				{
					$('.resultEmail').css('color', 'green').text('이메일 인증이 완료되었습니다.');
					isEmailOk = true;
				}
				else
				{
					$('.resultEmail').css('color', 'red').text('이메일 인증이 실패하였습니다.다시 시도하십시오.');
					isEmailOk = false;
				}
			}
		});
	});
});