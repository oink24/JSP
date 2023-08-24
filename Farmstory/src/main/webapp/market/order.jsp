<%@ page import="kr.co.farmstory.db.Utils"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	// 로그인 여부 확인
	if (sessUser == null)
	{
		response.sendRedirect("/Farmstory/user/login.jsp?success=101");
		return;
	}

	request.setCharacterEncoding("UTF-8");
	String thumb2     = request.getParameter("thumb2");
	String pName      = request.getParameter("pName");
	String pNo        = request.getParameter("pNo");
	String delivery   = request.getParameter("delivery");
	String price      = request.getParameter("price");
	String count      = request.getParameter("count");
	String total	  = request.getParameter("total");
	String finalPrice = request.getParameter("final");
%>
<script>
	$(function(){
		$('#btnBuy').click(function(e){
			e.preventDefault();
			$('#formOrder').submit();
		});
		
		$('#btnShopping').click(function(e){
			e.preventDefault();
			if(confirm("주문을 취소하시겠습니까?"))
				location.href='/Farmstory/market/list.jsp';
		});
	});
</script>
<div id="sub"> <!-- main -->
    <div class="bg"><img src="../images/sub_top_tit3.png" alt="MARKET"></div>
    <section class="market">
        <aside>
            <img src="../images/sub_aside_cate2_tit.png" alt="농작물이야기">
            <ol class="lnb">
                <li class="on"><a href="/Farmstory/market/list.jsp">장보기</a></li>
            </ol>
        </aside>
        <article class="order">
            <nav>
                <img src="../images/sub_nav_tit_cate2_tit1.png" alt="장보기">
                <p>
                    HOME > 장보기 > <strong>장보기</strong>
                </p>
            </nav>
            <!-- 컨텐츠 시작 -->
            <h3>주문상품 확인</h3>
            <div class="info">
                <img src="/Farmstory/thumb/<%= thumb2 %>" alt="상품이미지">

                <table border="0">                            
                    <tr>
                        <td>상품명</td>
                        <td><%= pName %></td>
                    </tr>
                    <tr>
                        <td>상품코드</td>
                        <td><%= pNo %></td>
                    </tr>
                    <tr>
                        <td>배송비</td>
                        <td class="delivery"><%= Utils.comma(delivery) %>원</td>
                    </tr>
                    <tr>
                        <td>판매가격</td>
                        <td><%= Utils.comma(price) %>원</td>
                    </tr>
                    <tr>
                        <td>구매수량</td>
                        <td class="count"><%= count %>개</td>
                    </tr>
                    <tr>
                        <td>합계</td>
                        <td class="total"><%= Utils.comma(finalPrice) %>원</td>
                    </tr>
                </table>
            </div>
            <h3>주문정보 입력</h3>
            <div class="shipping">
            <form id="formOrder" action="/Farmstory/market/proc/orderProc.jsp" method="post">
            	<input type="hidden" name="orderProduct"  value="<%= pNo %>"/>
                <input type="hidden" name="orderCount"    value="<%= count %>"/>
                <input type="hidden" name="orderDelivery" value="<%= delivery %>"/>
                <input type="hidden" name="orderPrice"    value="<%= price %>"/>
                <input type="hidden" name="orderTotal"    value="<%= finalPrice %>"/>
                <input type="hidden" name="orderUser"     value="<%= sessUser.getUid() %>"/>
                <input type="hidden" name="orderProduct"  value="<%= pNo %>"/>
                <table>
                    <tr>
                        <td>받는분</td>
                        <td><input type="text" name="receiver" value="<%= sessUser.getName() %>"></td>
                    </tr>
                    <tr>
                        <td>휴대폰</td>
                        <td><input type="text" name="hp" value="<%= sessUser.getHp() %>"></td>
                    </tr>
                    <tr>
                        <td>배송주소</td>
                        <td>
                            <input type="text" name="zip" readonly value="<%= sessUser.getZip() %>"><button id="btnZip">우편번호 검색</button>
                            <input type="text" name="addr1" placeholder="기본주소 검색" value="<%= sessUser.getAddr1() %>">
                            <input type="text" name="addr2" placeholder="상세주소 입력" value="<%= sessUser.getAddr2() %>">
                        </td>
                    </tr>
                    <tr>
                        <td>기타</td>
                        <td>
                            <textarea name="etc"></textarea>
                        </td>
                    </tr>
                </table>
            </form>
            </div>
            <p>
                <a href="#" id="btnBuy"><img src="../images/market_btn_buy.gif" alt="구매하기"></a>
                <a href="./list.jsp" id="btnShopping"><img src="../images/market_btn_shopping.gif" alt="계속쇼핑하기"></a>
            </p>
            <!-- 컨텐츠 끝 -->
        </article>
    </section>
</div>
<%@ include file="../_footer.jsp" %>