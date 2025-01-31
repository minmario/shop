<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="order-section">
    <div class="order-header">
        <div class="order-title">주문 목록</div>
    </div>
    <div class="search-bar">
        <label for="order-custom-date-picker">기간 조회</label>
        <div class="date-picker" id="order-custom-date-picker">
            <input type="date" class="form-control" id="order-start-date" name="order-start-date"> ~
            <input type="date" class="form-control" id="order-end-date" name="order-end-date">
        </div>

        <button type="button" class="btn btn-outline-primary search-button" onclick="searchOrder()">검색</button>
    </div>
</div>
<div class="custom-order-container">
    <c:if test="${requestScope.o_list eq null}">
        <div class="custom-order">
            <span>주문 내역이 없습니다.</span>
        </div>
    </c:if>
    <c:if test="${requestScope.o_list ne null}">
        <c:set var="currentDate" value="" />
        <c:set var="currentOrderCode" value="" />
        <c:set var="lastItem" value="${fn:length(requestScope.o_list) - 1}" />

        <c:forEach var="item" items="${requestScope.o_list}" varStatus="status">
            <!-- 날짜가 바뀌었을 때 새로운 날짜 블록 생성 -->
            <c:if test="${currentDate != item.order_date}">
                <c:set var="currentDate" value="${item.order_date}" />
                <div class="custom-order-date-group">
                    <h3 class="custom-order-date">${item.order_date}</h3>
                </div>
            </c:if>

            <!-- 주문 코드가 바뀌었을 때 새로운 주문 코드 블록 생성 -->
            <c:if test="${currentOrderCode != item.order_code}">
                <c:set var="currentOrderCode" value="${item.order_code}" />
                <div class="custom-order-code-group">
                    <h4 class="custom-order-code">주문 코드: ${item.order_code}</h4>
                </div>
            </c:if>

            <!-- 주문 내역 -->
            <div class="custom-order-block">
                <div class="custom-order-header">
                    <c:choose>
                        <c:when test="${item.status == '0'}"><span class="custom-order-status">입금 대기</span></c:when>
                        <c:when test="${item.status == '1'}"><span class="custom-order-status">결제 완료</span></c:when>
                        <c:when test="${item.status == '2'}"><span class="custom-order-status">배송전</span></c:when>
                        <c:when test="${item.status == '3'}"><span class="custom-order-status">배송중</span></c:when>
                        <c:when test="${item.status == '4'}"><span class="custom-order-status">배송완료</span></c:when>
                        <c:when test="${item.status == '5'}"><span class="custom-order-status">구매확정</span></c:when>
                        <c:when test="${item.status == '6'}"><span class="custom-order-status">취소</span></c:when>
                        <c:when test="${item.status == '7'}"><span class="custom-order-status">반품</span></c:when>
                        <c:when test="${item.status == '8'}"><span class="custom-order-status">교환</span></c:when>
                    </c:choose>
                    <a href="Controller?type=orderDetails&action=select&order_code=${item.order_code}" class="custom-details-link">주문 상세</a>
                </div>
                <div class="custom-order-content">
                    <div class="custom-product-image">
                        <img src="${item.prod_image != null && not empty item.prod_image && fn:split(item.prod_image, ',')[0]}" alt="상품 이미지">
                    </div>
                    <div class="custom-product-details">
                        <p class="custom-product-name">${item.brand}</p>
                        <p class="custom-product-description">${item.prod_name}</p>
                        <p class="custom-product-size">${not empty item.option_name ? item.option_name : '기본 옵션'} / ${item.count}개</p>
                        <p class="custom-product-price"><fmt:formatNumber value="${not empty item.prod_saled_price ? item.prod_saled_price : item.prod_price}"/>원</p>
                    </div>
                </div>
                <c:if test="${item.status == '5'}">
                    <button type="button" class="btn btn-outline-secondary custom-review-button" data-toggle="modal" data-target="#reviewModal">후기 작성 (최대 52,500원 적립)</button>
                </c:if>
                <div class="custom-product-actions">
                    <button type="button" class="btn btn-outline-secondary custom-action-button">배송 조회</button>
                    <button type="button" class="btn btn-outline-secondary custom-action-button" data-toggle="modal" data-target="#repurchaseModal">재구매</button>
                </div>
            </div>

            <!-- 날짜의 마지막 항목인지 확인 -->
            <c:if test="${status.index == lastItem || currentDate != requestScope.o_list[status.index + 1].order_date}">
                <hr class="custom-order-separator" />
            </c:if>
        </c:forEach>
    </c:if>
</div>