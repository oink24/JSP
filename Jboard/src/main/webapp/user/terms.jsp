<%@ page import="kr.co.jboard.dao.UserDAO"%>
<%@ page import="kr.co.jboard.dto.TermsDTO"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	TermsDTO vo = UserDAO.getInstance().selectTerms();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>약관</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script>
    	$(function(){
    		
    		$('a:eq(1)').click(function(e){
    			
    			const chk1 = $('input:checkbox[name="chk1"]');
    			const chk2 = $('input:checkbox[name="chk2"]');
    			
    			if (chk1.is(':checked') == false)
       			{
    				e.preventDefault();
       				alert('사이트 이용 약관에 동의를 하셔야 회원가입 하실 수 있습니다.');
       			}
    			else if (chk2.is(':checked') == false)
   				{
    				e.preventDefault();
    				alert('개인정보 취급 방침에 동의를 하셔야 회원가입 하실 수 있습니다.');
   				}
    		}); // a:eq(1) click end
    	});
    </script>
</head>
<body>
    <div id="container">
        <header>
            <h3>Board System v1.0</h3>
        </header>
        <main>
            <section class="terms">
                <form action="#">
                    <table>
                        <caption>사이트 이용 약관</caption>
                        <tbody>
                            <tr>
                                <td>
                                    <textarea readonly><%= vo.getTerms() %></textarea>
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
                                    <textarea readonly><%= vo.getPrivacy() %></textarea>
                                    <label><input type="checkbox" name="chk2">동의합니다.</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div>
                        <a href="/Jboard/user/login.jsp">취소</a>
                        <a href="/Jboard/user/register.jsp">다음</a>
                    </div>
                </form>
            </section>
        </main>
        <footer>
            <p>ⓒCopyright github.com/oink24</p>
        </footer>
    </div>
</body>
</html>