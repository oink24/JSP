<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<script>
	$(function(){
		$('a:eq(1)').click(function(e){
			const chk1 = $('.terms');
			const chk2 = $('.privacy');
			
			if (chk1.is(':checked') == false)
			{
				e.preventDefault();
				alert('사이트 이용 약관에 동의를 하셔야 회원가입을 하실 수 있습니다.');
			}
			else if (chk2.is(':checked') == false)
			{
				e.preventDefault();
				alert('개인정보 취급 방침에 동의를 하셔야 회원가입을 하실 수 있습니다.');
			}
		});
	});
</script>
<main id="user">
    <section class="terms">
        <table border="1">
            <caption>사이트 이용약관</caption>
            <tr>
                <td>
                    <textarea name="terms" readonly>${requestScope.dto.getTerms()}</textarea>
                    <label><input type="checkbox" class="terms">&nbsp;동의합니다.</label>
                </td>
            </tr>
        </table>

        <table border="1">
            <caption>개인정보 취급방침</caption>
            <tr>
                <td>
                    <textarea name="privacy" readonly>${dto.privacy}</textarea>
                    <label><input type="checkbox" class="privacy">&nbsp;동의합니다.</label>
                </td>
            </tr>
        </table>
        
        <div>
            <a href="/Jboard2" class="btn btnCancel">취소</a>
            <a href="/Jboard2/user/register.do" class="btn btnNext">다음</a>
        </div>

    </section>
</main>
<%@ include file="./_footer.jsp" %>