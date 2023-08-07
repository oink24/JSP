<%@ page import="kr.co.jboard.vo.UserVO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserVO sessUser = (UserVO) session.getAttribute("sessUser");
	
	if (sessUser == null)
	{
		response.sendRedirect("/Jboard/user/login.jsp?success=101");
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 작성</title>
    <link rel="stylesheet" href="/Jboard/css/style.css">
</head>
<body>
    <div id="container">
        <header>
            <h3>Board System v1.0</h3>
            <p>
                <%= sessUser.getNickname() %>님 반갑습니다.
                <a href="/Jboard/user/logout.jsp" class="logout">[로그아웃]</a>
            </p>
        </header>
        <main>
            <section id="board" class="write">
	          	<h3>글 쓰기</h3>
				<form action="/Jboard/proc/writeProc.jsp" method="post">
					<input type="hidden" name="writer" readonly value="<%= sessUser.getUid() %>">
					<table>
					    <tr>
					        <td>제목</td>
					        <td>
					            <input type="text" name="title" placeholder="제목을 입력하세요.">
					        </td>
					    </tr>
					    <tr>
					        <td>내용</td>
					        <td>
					            <textarea name="content"></textarea>
					        </td>
					    </tr>
					    <tr>
					        <td>첨부</td>
					        <td>
					            <input type="file" name="file">
					        </td>
					    </tr>
					</table>
					<div>
					    <a href="/Jboard/list.jsp" class="btnCancel">취소</a>
					    <input type="submit" class="btnWrite" value="작성완료">
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