<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<section id="board" class="modify">
   <h3>글 수정</h3>
   <form action="/Jboard/proc/updateProc.jsp" method="post">
       <input type="hidden" name="no" value="3">
       <table>
           <tr>
               <td>제목</td>
               <td>
                   <input type="text" name="title" value="제목" placeholder="제목을 입력하세요.">
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
           <a href="#" class="btnCancel">취소</a>
           <input type="submit" class="btnWrite" value="수정완료">
       </div>
   </form>
</section>