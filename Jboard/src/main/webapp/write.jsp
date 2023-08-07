<%@ page import="kr.co.jboard.vo.UserVO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
        <main>
            <section id="board" class="write">
	          	<h3>글 쓰기</h3>
				<form action="/Jboard/proc/writeProc.jsp" method="post">
					<input type="hidden" name="writer" readonly value="<%= sessUser.getUid() %>">
					<table>
					    <tr>
					        <td>제목</td>
					        <td>
					            <input type="text" name="title" required placeholder="제목을 입력하세요.">
					        </td>
					    </tr>
					    <tr>
					        <td>내용</td>
					        <td>
					            <textarea name="content" required></textarea>
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
        <%@ include file="./_footer.jsp" %>