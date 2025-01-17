<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="order-section">
    <div class="order-header">
        <span class="order-title">주문 목록</span>
    </div>
</div>
<table id="order-table" class="table">
    <thead>
        <tr>
            <th>상품 정보</th>
            <th>주문 일자</th>
            <th>주문 상태</th>
            <th>주문 상세</th>
            <th>배송 조회</th>
            <%--<c:if test="${requestScope.is_review ne null and requestScope.is_review}">
                <th>후기 작성</th>
            </c:if>
            <c:if test="${requestScope.is_review ne null and requestScope.is_review ne false}">
                <th>스냅 보기</th>
            </c:if>--%>
            <th>후기 작성</th>
            <th>스냅 보기</th>
            <th>재구매</th>
        </tr>
    </thead>
    <tbody>
    <c:set var="cnt" value="5"/>
    <c:forEach begin="1" end="${cnt}" varStatus="st">
        <tr>
            <td class="product-info">
                <div class="prod_info">
                    <div class="prod_img">
                        <img src="./user/images/product${st.index}.jpg"/>
                    </div>
                    <div class="prod_details">
                        <div class="prod_brand">
                            [페이퍼리즘]
                        </div>
                        <div class="prod_name">
                            ZIGGY LIGHTING 3/4 SLV T-SHIRT
                        </div>
                        <div class="prod_option">
                            L&nbsp;/&nbsp;${st.index}
                        </div>
                        <div class="prod_price">
                            17,700원
                        </div>
                    </div>
                </div>
            </td>
            <td>2025-01-${st.index + 5}</td>
            <td>구매 확정</td>
            <td>
                <a href="">주문 상세</a>
            </td>
            <td>
                <button type="button" class="btn btn-outline-secondary" onclick="onShowDeliveryModal()">배송 조회</button>
            </td>
            <%--<c:if test="${requestScope.is_review ne null and requestScope.is_review}">
                <td>
                    <button type="button" class="btn btn-outline-secondary text-blue">후기 작성 (최대 2,500원 적립)</button>
                </td>
            </c:if>
            <c:if test="${requestScope.is_review ne null and requestScope.is_review ne false}">
                <td>
                    <button type="button" class="btn btn-outline-secondary">스냅 보기</button>
                </td>
            </c:if>--%>
            <td>
                <button type="button" class="btn btn-outline-secondary text-blue">후기 작성 (최대 2,500원 적립)</button>
            </td>
            <td>
                <button type="button" class="btn btn-outline-secondary">스냅 보기</button>
            </td>
            <td>
                <button type="button" class="btn btn-outline-secondary">재구매</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<nav aria-label="Page navigation" class="navigation">
    <ul class="pagination">
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>