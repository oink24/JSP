<%@ page import="java.util.List"%>
<%@ page import="kr.co.jboard.dto.ArticleDTO"%>
<%@ page import="kr.co.jboard.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	
	ArticleDAO dao = new ArticleDAO();
	ArticleDTO dto = dao.selectArticle(no); // 해당 게시글 조회
	List<ArticleDTO> comments = dao.selectComments(no); // 해당 게시글의 댓글 조회
%>
<script>
	$(function(){
		// 댓글 삭제
		$('.del').click(function(){
			const result = confirm('댓글을 삭제하시겠습니까?');
			
			if (result)
				return true;
			else
				return false;
		});
		
		// 댓글 작성 취소 버튼
		$('.btnCancel').click(function(e){
			e.preventDefault();
			$('form > textarea[name=content]').val('');
		});
		
		// 게시글 삭제
		const btnDelete = document.getElementsByClassName('btnDelete')[0];
		btnDelete.onclick = function(){
			if (confirm('게시글을 삭제하시겠습니까?'))
				return true;
			else
				return false;
		}
	});
</script>
<main>
    <section id="board" class="view">
       <h3>글 보기</h3>
       <table>
           <tr>
               <td>제목</td>
               <td>
                   <input type="text" readonly name="title" value=<%= dto.getTitle() %>>
               </td>
           </tr>
           <% if (dto.getFile() > 0) { %> <!-- 파일이 포함된 글이므로 -->
           <tr>
               <td>첨부파일</td>
               <td>
                   <a href="#">2020년 상반기 매출자료.xls</a>
                   <span>7회 다운로드</span>
               </td>
           </tr>
           <% } %>
           <tr>
               <td>내용</td>
               <td>
                   <textarea name="content" readonly><%= dto.getContent() %></textarea>
               </td>
           </tr>
       </table>
       <div>
       	   <% if (sessUser.getUid().equals(dto.getWriter())) { %>
           <a href="/Jboard/delete.jsp?no=<%= no %>" class="btnDelete">삭제</a>
           <a href="/Jboard/modify.jsp?no=<%= no %>" class="btnModify">수정</a>
           <% } %>
           <a href="/Jboard/list.jsp" class="btnList">목록</a>
       </div>

       <!-- 댓글 리스트 -->
       <section class="commentList">
           <h3>댓글 목록</h3>
           <% for (ArticleDTO comment : comments) { %>
           <article class="comment">
               <span>
                   <span><%= comment.getNickname() %></span>
                   <span><%= comment.getRdate() %></span>
               </span>
               <textarea name="comment" readonly><%= comment.getContent() %></textarea>
               
               <% if (sessUser.getUid().equals(comment.getWriter())) { %>
               <div>
                   <a href="/Jboard/proc/commentDeleteProc.jsp?no=<%= comment.getNo() %>&parent=<%= comment.getParent() %>" class="del">삭제</a>
                   <a href="#" class="modi">수정</a> <!-- 추후에 AJAX 통해 구현 예정 -->
               </div>
               <% } %>
           </article>
           <% } %>
           
           <% if (comments.isEmpty()) { %>
           <p class="empty">등록된 댓글이 없습니다.</p>
           <% } %>
       </section>

       <!-- 댓글 입력폼 -->
       <section class="commentForm">
           <h3>댓글 쓰기</h3>
           <form action="/Jboard/proc/commentProc.jsp" method="post">
           	<input type="hidden" name="parent" value="<%= no %>">
           	<input type="hidden" name="writer" value="<%= sessUser.getUid() %>">
               <textarea name="content" class="content"></textarea>
               <div>
                   <a href="#" class="btnCancel">취소</a>
                   <input type="submit" class="btnWrite" value="작성완료">
               </div>
           </form>
       </section>
    </section>
</main>
<%@ include file="./_footer.jsp" %>