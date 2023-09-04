<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<script>
	$(function(){
		$('.next').click(function(e){
			
			const chk1 = $('input:checkbox[name="chk1"]');
			const chk2 = $('input:checkbox[name="chk2"]');
			
			if (chk1.is(':checked') == false)
				{
				e.preventDefault();
					alert('사이트 이용 약관에 동의를 하셔야 회원가입하실 수 있습니다.');
				}
			else if (chk2.is(':checked') == false)
			{
				e.preventDefault();
				alert('개인정보 취급 방침에 동의를 하셔야 회원가입하실 수 있습니다.');
			}
		});
	});
</script>
<div id="user">
    <section class="terms">
        <form action="#">
            <table>
                <caption>사이트 이용 약관</caption>
                <tbody>
                    <tr>
                        <td>
                            <textarea readonly>${requestScope.dto.getTerms()}</textarea>
                            <label><input type="checkbox" name="chk1">동의합니다.</label>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table>
                <caption>개인정보 취급방침</caption>
                <tbody>
                    <tr>
                        <td>
                            <textarea readonly>${dto.privacy}</textarea>
                            <label><input type="checkbox" name="chk2">동의합니다.</label>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div>
                <a href="${ctxPath}/user/login.do">취소</a>
                <a href="${ctxPath}/user/register.do" class="next">다음</a>
            </div>
        </form>
    </section>
</div>
<%@ include file="../_footer.jsp" %>