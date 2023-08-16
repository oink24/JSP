<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<div id="sub"> <!-- main -->
    <div class="bg"><img src="../images/sub_top_tit3.png" alt="MARKET"></div>
    <section class="market">
        <aside>
            <img src="../images/sub_aside_cate2_tit.png" alt="농작물이야기">
            <ol class="lnb">
                <li class="on"><a href="/Farmstory/market/list.jsp">장보기</a></li>
            </ol>
        </aside>
        <article class="list">
            <nav>
                <img src="../images/sub_nav_tit_cate2_tit1.png" alt="장보기">
                <p>
                    HOME > 장보기 > <strong>장보기</strong>
                </p>
            </nav>
            <!-- 컨텐츠 시작 -->
            <p class="sort">
                <a href="#" class="on">전체(10) |</a>
                <a href="#">과일 |</a>
                <a href="#">야채 |</a>
                <a href="#">곡류</a>
            </p>
            <table border="0">
                <tr>
                    <td>
                        <a href="./view.jsp"><img src="../images/market_item1.jpg" alt="사과 500g"></a>
                    </td>
                    <td>과일</td>
                    <td><a href="#">사과 500g</a></td>
                    <td><strong>4,000</strong>원</td>
                </tr>
                <tr>
                    <td>
                        <a href="./view.jsp"><img src="../images/market_item2.jpg" alt="배 5kg"></a>
                    </td>
                    <td>과일</td>
                    <td><a href="#">배 5kg</a></td>
                    <td><strong>30,000</strong>원</td>
                </tr>
                <tr>
                    <td>
                        <a href="./view.jsp"><img src="../images/market_item3.jpg" alt="방울토마토"></a>
                    </td>
                    <td>야채</td>
                    <td><a href="#">방울토마토</a></td>
                    <td><strong>5,000</strong>원</td>
                </tr>
                <tr>
                    <td>
                        <a href="./view.jsp"><img src="../images/market_item4.jpg" alt="딸기 500g"></a>
                    </td>
                    <td>과일</td>
                    <td><a href="#">딸기 500g</a></td>
                    <td><strong>4,000</strong>원</td>
                </tr>
                <tr>
                    <td>
                        <a href="./view.jsp"><img src="../images/market_item5.jpg" alt="ㅊ"></a>
                    </td>
                    <td>과일</td>
                    <td><a href="#">오렌지</a></td>
                    <td><strong>8,000</strong>원</td>
                </tr>
                <tr>
                    <td>
                        <a href="./view.jsp"><img src="../images/market_item6.jpg" alt="무농약현미"></a>
                    </td>
                    <td>곡류</td>
                    <td><a href="#">무농약현미</a></td>
                    <td><strong>39,000</strong>원</td>
                </tr>
                <tr>
                    <td>
                        <a href="./view.jsp"><img src="../images/market_item7.jpg" alt="팜스토리 하루야채 샐러드"></a>
                    </td>
                    <td>야채</td>
                    <td><a href="#">팜스토리 하루야채 샐러드</a></td>
                    <td><strong>9,900</strong>원</td>
                </tr>
                <tr>
                    <td>
                        <a href="./view.jsp"><img src="../images/market_item8.jpg" alt="바나나"></a>
                    </td>
                    <td>과일</td>
                    <td><a href="#">바나나</a></td>
                    <td><strong>3,000</strong>원</td>
                </tr>
            </table>
            <p class="paging">
                <a href="#"><</a>
                <a href="#" class="on">[1]</a>
                <a href="#">[2]</a>
                <a href="#">[3]</a>
                <a href="#">[4]</a>
                <a href="#">[5]</a>
                <a href="#">></a>
            </p>
            <!-- 컨텐츠 끝 -->
        </article>
    </section>
</div>
<%@ include file="../_footer.jsp" %>