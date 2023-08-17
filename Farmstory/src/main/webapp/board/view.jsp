<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
    <section id="board" class="view">
       <h3>글 보기</h3>
       <table>
           <tr>
               <td>제목</td>
               <td>
                   <input type="text" readonly name="title" value=>
               </td>
           </tr>
           <tr>
               <td>첨부파일</td>
               <td>
                   <a href="#">2020년 상반기 매출자료.xls</a>
                   <span>7회 다운로드</span>
               </td>
           </tr>
           <tr>
               <td>내용</td>
               <td>
                   <textarea name="content" readonly></textarea>
               </td>
           </tr>
       </table>
       <div>
           <a href="#" class="btnDelete">삭제</a>
           <a href="#" class="btnModify">수정</a>
           <a href="#" class="btnList">목록</a>
       </div>

       <!-- 댓글 리스트 -->
       <section class="commentList">
           <h3>댓글 목록</h3>
           <article class="comment">
               <form action="#" method="post">
	               	<span>
	                   <span>nick</span>
	                   <span>23-08-17</span>
	               </span>
	               <textarea name="comment" readonly></textarea>
	               
	               <div>
	                   <a href="#" class="del">삭제</a>
	                   <a href="#" class="can">취소</a> <!-- 댓글 수정시에만 나타남 -->
	                   <a href="#" class="modi">수정</a>
	               </div>
               </form>
           </article>
           
           <p class="empty">등록된 댓글이 없습니다.</p>
       </section>

       <!-- 댓글 입력폼 -->
       <section class="commentForm">
           <h3>댓글 쓰기</h3>
           <form action="#" method="post">
           	<input type="hidden" name="parent" value="">
           	<input type="hidden" name="writer" value="">
               <textarea name="content" class="content"></textarea>
               <div>
                   <a href="#" class="btnCancel">취소</a>
                   <input type="submit" class="btnWrite" value="작성완료">
               </div>
           </form>
       </section>
    </section>