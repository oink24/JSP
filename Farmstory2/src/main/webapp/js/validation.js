/**
 * 사용자 입력데이터 유효성검증
 */

// 폼 데이터 검증결과 상태변수
let isUidOk   = false;
let isPassOk  = false;
let isNameOk  = false;
let isNickOk  = false;
let isEmailOk = false;
let isHpOk    = false;

// 데이터 검증에 사용하는 정규표현식
const reUid   = /^[a-z]+[a-z0-9]{4,19}$/g;
const rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
const reName  = /^[가-힣]{2,10}$/ 
const reNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;

// 유효성검증 (Validation)
$(function(){
	
	// 아이디 입력값 검사 (유효성검증 후 다시 포커스해서 수정 방지)
	$('input[name=uid]').keydown(function(){
		
		$('.resultUid').text('');
		isUidOk = false;
	});
	
	// 비밀번호 입력값 검사
	$('input[name=pass2]').focusout(function(){
		
		const pass1 = $('input[name=pass1]').val();
		const pass2 = $('input[name=pass2]').val();
		
		if (pass1 == pass2)
		{
			if (pass1.match(rePass))
			{
				$('.resultPass').css('color', 'green').text('비밀번호가 일치합니다.');
				isPassOk = true;
			}
			else
			{
				$('.resultPass').css('color', 'red').text('비밀번호는 숫자, 영문, 특수문자 조합 5자리 이상이어야합니다.');
				isPassOk = false;
			}
		}
		else
		{
			$('.resultPass').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
			isPassOk = false;
		}
	});
	
	// 이름 입력값 검사
	$('input[name=name]').focusout(function(){
		
		const name = $(this).val();
		
		if (!name.match(reName))
		{
			$('.resultName').css('color', 'red').text('이름 입력은 한글로만 가능합니다.');
			isNameOk = false;
		}
		else
		{
			$('.resultName').text('');
			isNameOk = true;
		}
	});
	
	// 최종 전송
	$('#formUser').submit(function(){
		
		if (!isUidOk)
		{
			alert('아이디를 확인하십시오.');
			return false; // 폼 전송 취소
		}
		if (!isPassOk)
		{
			alert('비밀번호를 확인하십시오.');
			return false; // 폼 전송 취소
		}
		if (!isNameOk)
		{
			alert('이름을 확인하십시오.');
			return false; // 폼 전송 취소
		}
		if (!isNickOk)
		{
			alert('닉네임을 확인하십시오.');
			return false; // 폼 전송 취소
		}
		if (!isEmailOk)
		{
			alert('이메일을 확인하십시오.');
			return false; // 폼 전송 취소
		}
		if (!isHpOk)
		{
			alert('전화번호를 확인하십시오.');
			return false; // 폼 전송 취소
		}
		
		return true; // 폼 전송 시작
	});
});