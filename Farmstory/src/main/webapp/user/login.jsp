<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String success = request.getParameter("success");
	
	if (sessUser != null)
	{
		response.sendRedirect("/Farmstory");
		return; // 로그인페이지 강제로 이동하고 싶어도 이동 불가
	}
%>
<script>
if (<%= success %> == 100) // 로그인 실패
	alert('로그인에 실패하였습니다. 다시 확인하세요.');
</script>
<div id="user"> <!-- main -->
    <section class="login">
         <form action="/Farmstory/user/loginProc.jsp" method="post">
             <table>
                 <tr>
                     <td><img src="/Farmstory/images/login_ico_id.png" alt="id"></td>
                     <td><input type="text" name="uid" placeholder="아이디 입력"></td>
                 </tr>
                 <tr>
                     <td><img src="/Farmstory/images/login_ico_pw.png" alt="pw"></td>
                     <td><input type="password" name="pass" placeholder="비밀번호 입력"></td>
                 </tr>
             </table>
             <input type="submit" value="로그인" class="btnLogin">
         </form>
         <div>
             <h3>회원 로그인 안내</h3>
             <p>
                 아직 회원이 아니시면 회원으로 가입하세요.
             </p>
             <a href="/Farmstory/user/terms.jsp">회원가입</a>
         </div>
     </section>
</div>
<%@ include file="../_footer.jsp" %>