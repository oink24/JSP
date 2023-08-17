<%@ page import="kr.co.farmstory.dao.UserDAO"%>
<%@ page import="kr.co.farmstory.dto.TermsDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
		}); // a:eq(1) click end
	});
</script>
<%
	TermsDTO dto = UserDAO.getInstance().selectTerms();
%>
<div id="user"> <!-- main -->
    <section class="terms">
        <form action="#">
            <table>
                <caption>사이트 이용 약관</caption>
                <tbody>
                    <tr>
                        <td>
                            <textarea readonly><%= dto.getTerms() %></textarea>
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
                            <textarea readonly><%= dto.getPrivacy() %></textarea>
                            <label><input type="checkbox" name="chk2">동의합니다.</label>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div>
                <a href="/Farmstory/user/login.jsp">취소</a>
                <a href="/Farmstory/user/register.jsp" class="next">다음</a>
            </div>
        </form>
    </section>
</div>
<%@ include file="../_footer.jsp" %>