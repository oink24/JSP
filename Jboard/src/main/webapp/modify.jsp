<%@ page import="kr.co.jboard.dto.ArticleDTO"%>
<%@ page import="kr.co.jboard.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	
	ArticleDAO dao = new ArticleDAO();
	ArticleDTO dto = dao.selectArticle(no);
%>
<main>
    <section id="board" class="modify">
       <h3>글 수정</h3>
       <form action="/Jboard/proc/modifyProc.jsp" method="post">
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
               <a href="/Jboard/view.jsp?no=<%= no %>" class="btnCancel">취소</a>
               <input type="submit" class="btnWrite" value="수정완료">
           </div>
       </form>
    </section>
</main>
<%@ include file="./_footer.jsp" %>