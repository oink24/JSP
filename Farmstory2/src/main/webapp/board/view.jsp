<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../_header.jsp" %>
<jsp:include page="./_aside${group}.jsp"/>
			<section class="view">
			    <h3>글보기</h3>
			    <table>
			        <tr>
			            <td>제목</td>
			            <td><input type="text" name="title" value="${article.title}" readonly/></td>
			        </tr>
			        <c:if test="${article.file > 0}">
			        <tr>
			            <td>첨부파일</td>
			            <td>
							<a href="${ctxPath}/board/fileDownload.do?fno=${article.fileDto.fno}">${article.fileDto.ofile}</a>
		                	<span>${article.fileDto.download}</span>회 다운로드
		                </td>
			        </tr>
			        </c:if>
			        <tr>
			            <td>내용</td>
			            <td>
			                <textarea name="content" readonly>${article.content}</textarea>
			            </td>
			        </tr>
			    </table>
			    <div>
			        <a href="${ctxPath}/board/delete.do?group=${group}&cate=${cate}" class="btnDelete">삭제</a>
			        <a href="${ctxPath}/board/modify.do?group=${group}&cate=${cate}" class="btnModify">수정</a>
			        <a href="${ctxPath}/board/list.do?group=${group}&cate=${cate}" class="btnList">목록</a>
			    </div>
			    
			    <!-- 댓글리스트 -->
			    <section class="commentList">
			        <h3>댓글목록</h3>
			        <c:forEach var="comment" items="${comments}">
			        <article>
						<span class="nick">${comment.nick}</span>
		                <span class="date">${comment.rdate}</span>
		                <textarea readonly class="content">${comment.content}</textarea>  
						<div>
							<a href="#" class="remove" data-no="${comment.no}">삭제</a>
							<a href="#" class="modify">수정</a>
						</div>                
			        </article>
			        </c:forEach>
			        <c:if test="${empty comments}">
			        <p class="empty">등록된 댓글이 없습니다.</p>
			        </c:if>
			    </section>
			
			    <!-- 댓글입력폼 -->
			    <section class="commentForm">
			        <h3>댓글쓰기</h3>
			        <form action="#" method="post" enctype="multipart/form-data">
		            	<input type="hidden" name="parent" value="${no}"/>
		            	<input type="hidden" name="writer" value="${sessUser.uid}"/>
		            	<input type="hidden" name="nick" value="${sessUser.nick}"/>
			            <textarea name="content"></textarea>
			            <div>
			                <a href="#" class="btnCancel">취소</a>
			                <input type="submit" class="btnWrite" value="작성완료"/>
			            </div>
			        </form>
			    </section>
			</section>
			<!-- 내용 끝 -->
        </article>
    </section>
</div>			
<%@ include file="../_footer.jsp" %>