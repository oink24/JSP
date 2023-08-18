<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	
	// 로그인 여부 확인
	if (sessUser == null)
	{
		response.sendRedirect("/Farmstory/board/list.jsp?success=101&group="+group+"&cate="+cate);
		return;
	}
	
	pageContext.include("./_aside"+group+".jsp");
%>
			<section id="board" class="write">
				<h3>글 쓰기</h3>
				<form action="./proc/writeProc.jsp" method="post">
					<input type="hidden" name="group" readonly value="<%= group %>">
					<input type="hidden" name="cate" readonly value="<%= cate %>">
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
					    <a href="./list.jsp?group=<%= group %>&cate=<%= cate %>" class="btnCancel">취소</a>
					    <input type="submit" class="btnWrite" value="작성완료">
					</div>
				</form>
			</section>
   			<!-- 컨텐츠 종료 -->
		</article>
    </section>
</div>
<%@ include file="../_footer.jsp" %>