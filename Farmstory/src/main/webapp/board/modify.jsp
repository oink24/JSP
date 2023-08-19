<%@ page import="kr.co.farmstory.dto.ArticleDTO"%>
<%@ page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String no    = request.getParameter("no");
	
	ArticleDAO dao = new ArticleDAO();
	ArticleDTO dto = dao.selectArticle(no);
	
	pageContext.include("./_aside"+group+".jsp");
%>
			<section id="board" class="modify">
			   <h3>글 수정</h3>
			   <form action="/Farmstory/board/proc/modifyProc.jsp" method="post">
			   		<input type="hidden" name="group" value="<%= group %>">
			   		<input type="hidden" name="cate" value="<%= cate %>">
					<input type="hidden" name="no" value="<%= no %>">
					<table>
					    <tr>
					        <td>제목</td>
					        <td>
					            <input type="text" name="title" value="<%= dto.getTitle() %>" placeholder="제목을 입력하세요.">
					        </td>
					    </tr>
					    <tr>
					        <td>내용</td>
					        <td>
					            <textarea name="content"><%= dto.getContent() %></textarea>
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
					    <a href="/Farmstory/board/view.jsp?group=<%= group %>&cate=<%= cate %>&no=<%= no %>" class="btnCancel">취소</a>
					    <input type="submit" class="btnWrite" value="수정완료">
					</div>
			   </form>
			</section>
			<!-- 컨텐츠 종료 -->
		</article>
    </section>
</div>
<%@ include file="../_footer.jsp" %>