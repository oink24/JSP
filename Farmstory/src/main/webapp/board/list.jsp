<%@ page import="kr.co.farmstory.dto.ArticleDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String pg 	 = request.getParameter("pg");
	
	ArticleDAO dao = new ArticleDAO();
	
	// 페이지 관련 변수
	int currentPage = 1;		// 현재 페이지
	int start = 0;				// 현재 페이지 게시물 LIMIT 시작번호
	int total = 0;				// 전체 게시글 갯수
	int lastPageNum = 0;		// 페이지번호 계산 (총 페이지 / 10)
	int pageGroupCurrent = 1;	// 페이지 그룹 계산
	int pageGroupStart = 1;		// 각 페이지그룹의 스타트 페이지 번호
	int pageGroupEnd = 0;		// 페이지그룹 내 마지막 번호
	int pageStartNum = 0;		// 페이지 게시글 시작번호
	
	// 현재 페이지 계산
	if (pg != null)
		currentPage = Integer.parseInt(pg);
	
	// 현재 페이지 게시물 LIMIT 시작번호
	start = (currentPage - 1) * 10;
	
	// 전체 게시글 갯수 조회
	total = dao.selectCountTotal(cate);
	
	// 페이지 번호 계산
	if (total % 10 == 0)
		lastPageNum = (total / 10);
	else
		lastPageNum = (total / 10) + 1;
	
	// 페이지 그룹 계산
	pageGroupCurrent = (int) Math.ceil(currentPage / 10.0);
	pageGroupStart	 = (pageGroupCurrent - 1) * 10 + 1;
	pageGroupEnd	 = pageGroupCurrent * 10;
	
	if (pageGroupEnd > lastPageNum)
		pageGroupEnd = lastPageNum;
	
	// 페이지 게시글 시작번호 계산
	pageStartNum = total - start;
	
	// 현재 페이지 네비게이션 내 게시글 조회
	List<ArticleDTO> articles = dao.selectArticles(cate, start);
	
	pageContext.include("./_aside"+group+".jsp");
%>
			<section id="board" class="list">
			    <h3>글 목록</h3>
			    <article>
			        <table>
			            <tr>
			                <th>번호</th>
			                <th>제목</th>
			                <th>글쓴이</th>
			                <th>날짜</th>
			                <th>조회</th>
			            </tr>
			            <% for (ArticleDTO article : articles) { %>
			            <tr>
			                <td><%= pageStartNum-- %></td>
			                <td>
			                    <a href="./view.jsp?group=<%= group %>&cate=<%= cate %>&no=<%= article.getNo() %>"><%= article.getTitle() %></a> [<%= article.getComment() %>]
			                </td>
			                <td><%= article.getNickname() %></td>
			                <td><%= article.getRdate() %></td>
			                <td><%= article.getHit() %></td>
			            </tr>
			            <% } %>
			        </table>
			    </article>
			    
			    <!-- 페이지 내비게이션 -->
			    <div class="paging">
			    	<% if (pageGroupStart > 1) { %>
			        <a href="/Farmstory/board/list.jsp?pg=<%= pageGroupStart - 1 %>" class="prev">이전</a>
			        <% } %>
			        
			        <% for (int i=pageGroupStart ; i<=pageGroupEnd ; i++) { %>
			        <a href="/Farmstory/board/list.jsp?pg=<%= i %>" class="num <%= (currentPage == i)?"current":"" %>"><%= i %></a>
			        <% } %>
			        
			        <% if (pageGroupEnd < lastPageNum) { %>
			        <a href="/Farmstory/board/list.jsp?pg=<%= pageGroupEnd + 1 %>" class="next">다음</a>
			        <% } %>
			    </div>
			
			    <!-- 글쓰기 버튼 -->
			    <a href="./write.jsp?group=<%= group %>&cate=<%= cate %>" class="btnWrite">글쓰기</a>
			</section>
			<!-- 컨텐츠 종료 -->
		</article>
    </section>
</div>
<%@ include file="../_footer.jsp" %>