<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cate = request.getParameter("cate");
%>
<div id="sub"> <!-- main -->
    <div class="bg"><img src="/Farmstory/images/sub_top_tit5.png" alt="COMMUNITY"></div>
    <section class="community">
        <aside>
            <img src="/Farmstory/images/sub_aside_cate5_tit.png" alt="공지사항">
            <ol class="lnb">
                <li class="<%= cate.equals("notice")?"on":"" %>"><a href="/Farmstory/board/list.jsp?group=Community&cate=notice">공지사항</a></li>
                <li class="<%= cate.equals("menu")?"on":"" %>"><a href="/Farmstory/board/list.jsp?group=Community&cate=menu">오늘의식단</a></li>
                <li class="<%= cate.equals("chef")?"on":"" %>"><a href="/Farmstory/board/list.jsp?group=Community&cate=chef">나도요리사</a></li>
                <li class="<%= cate.equals("qna")?"on":"" %>"><a href="/Farmstory/board/list.jsp?group=Community&cate=qna">1:1고객문의</a></li>
                <li class="<%= cate.equals("faq")?"on":"" %>"><a href="/Farmstory/board/list.jsp?group=Community&cate=faq">자주묻는질문</a></li>
            </ol>
        </aside>
        <article class="content">
            <nav>
                <img src="/Farmstory/images/sub_nav_tit_cate5_<%= cate %>.png" alt="공지사항">
                <p>
                    HOME > 커뮤니티 >
                    <% if(cate.equals("notice")) { %>
                    <strong>공지사항</strong>
                    <% } else if(cate.equals("menu")) { %>
                    <strong>오늘의식단</strong>
                    <% } else if(cate.equals("chef")) { %>
                    <strong>나도요리사</strong>
                    <% } else if(cate.equals("qna")) { %>
                    <strong>1:1고객문의</strong>
                    <% } else if(cate.equals("faq")) { %>
                    <strong>자주묻는질문</strong>
                    <% } %>
                </p>
            </nav>
            <!-- 컨텐츠 시작 -->