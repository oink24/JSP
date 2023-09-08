<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 개발/배포에서 ContextPath 포함 여부에 따른 동적처리 -->
<c:set var="ctxPath" value="${pageContext.request.contextPath}"></c:set>

<%@ include file="./_header.jsp" %>
<main>
    <%@ include file="./_aside.jsp" %>
    <section id="productList">
        <nav>
            <h3>상품목록</h3>
        </nav>
        <article>
            <table border="0">
                <tr>
                    <th><input type="checkbox" name="all"/></th>
                    <th>사진</th>
                    <th>상품번호</th>
                    <th>상품명</th>
                    <th>구분</th>
                    <th>가격</th>
                    <th>재고</th>
                    <th>등록일</th>
                </tr>
                <c:forEach var="product" items="${products}">
                <tr>
                    <td><input type="checkbox" name=""/></td>
                    <td><img src="${ctxPath}/thumb/${product.thumb1}" class="thumb" alt="상품이미지"></td>
                    <td>${product.pNo}</td>
                    <td>${product.pName}</td>
                    <td>
                    	<c:choose>
                    		<c:when test="${product.type eq 1}">과일</c:when>
                    		<c:when test="${product.type eq 2}">야채</c:when>
                    		<c:when test="${product.type eq 3}">곡물</c:when>
                    	</c:choose>
                    </td>
                    <td>${product.price}원</td>
                    <td>${product.stock}</td>
                    <td>${product.rdate}</td>
                </tr>
                </c:forEach>
            </table>
            <p>
                <a href="#" class="productDelete">선택삭제</a>
                <a href="./productRegister.do" class="productRegister">상품등록</a>
            </p>
            <p class="paging">
            	<c:if test="${pageGroupStart > 1}">
                	<a href="${ctxPath}/admin/productList.do?pg=${pageGroupStart - 1} class="prev"><</a>
                </c:if>
                
                <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                	<a href="${ctxPath}/admin/productList.do?pg=${i}" class="${currentPage == i?'on':''}">[${i}]</a>
                </c:forEach>
                
                <c:if test="${pageGroupEnd < lastPageNum}">
                	<a href="${ctxPath}/admin/productList.do?pg=${pageGroupEnd + 1}" class="next">></a>
                </c:if>
            </p>
        </article>
    </section>
</main>
<%@ include file="./_footer.jsp" %>