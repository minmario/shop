<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${requestScope.o_list ne null}">
    <input type="hidden" id="orderCode" value="${requestScope.o_list[0].order_code}">
    <div class="order-details-title">주문 상세 내역</div>
    <div class="delivery-info">
        <div class="info-header">
            <input type="hidden" class="deli-no" name="deli-no" value="${o_list[0].deli_no}">
            <p class="name">${o_list[0].deli_name}</p>
            <c:if test="${requestScope.o_list[0].status == '0' or requestScope.o_list[0].status == '1'}">
                <button class="btn btn-outline-secondary btn-sm change-address-button" data-toggle="modal" data-target="#deliveryModal">배송지 변경
                </button>
            </c:if>
        </div>
        <p class="phone">${o_list[0].phone}</p>
        <div class="address-row">
            <p class="address">${o_list[0].pos_code} ${o_list[0].addr1} ${o_list[0].addr2}</p>
            <p class="request">${o_list[0].deli_request}</p>
        </div>
    </div>
    <div class="payment-info">
        <h5>결제 정보</h5>
        <ul class="payment-list">
            <c:set var="totalPrice" value="${requestScope.totalPrice}"/>
            <c:set var="discountAmount" value="${requestScope.totalPrice - requestScope.totalAmount}"/>
            <c:set var="pointAmount" value="${requestScope.point_amount}"/>
            <c:set var="couponSalePer" value="${requestScope.coupon.sale_per}"/>

            <c:set var="priceAfterDiscount" value="${totalPrice - discountAmount}"/>
            <li><span>상품 금액</span> <span class="item-price"><fmt:formatNumber value="${totalPrice}"/>원</span></li>
            <li><span>할인 금액</span> <span class="discount">-<fmt:formatNumber value="${discountAmount}"/>원</span></li>
            <br/>

            <c:if test="${requestScope.coupon_list ne null}">
                <h5>쿠폰 할인</h5>
                <c:set var="couponDiscount" value="0"/>
                <c:forEach var="coupon" items="${requestScope.coupon_list}">
                    <c:set var="individualDiscount" value="${priceAfterDiscount * (coupon.sale_per / 100)}"/>
                    <c:set var="couponDiscount" value="${couponDiscount + individualDiscount}"/>
                    <li>
                        <span class="coupon_info">${coupon.coupon_name} (${coupon.sale_per}%)</span>
                        <span>-<fmt:formatNumber value="${individualDiscount}" type="number"
                                                 maxFractionDigits="0"/>원</span>
                    </li>
                </c:forEach>
                <li><span>총 쿠폰 할인</span> <span class="coupon-discount discount">-<fmt:formatNumber
                        value="${couponDiscount}" type="number" maxFractionDigits="0"/>원</span></li>
                <br/>
                <li><span>적립금 사용</span> <span class="points-amount discount">-<fmt:formatNumber value="${pointAmount}"/>원</span>
                </li>
            </c:if>
            <li class="total">
                <c:set var="finalPrice" value="${priceAfterDiscount - couponDiscount - pointAmount}"/>
                <span class="payment-price">결제 금액</span>
                <span class="final-price"><fmt:formatNumber value="${finalPrice}" type="number"
                                                            maxFractionDigits="0"/>원</span>
            </li>
            <li><span>결제 수단</span>
                <c:choose>
                    <c:when test="${requestScope.o_list[0].pay_type == '1'}"><span
                            class="payment-method">계좌이체-[${requestScope.o_list[0].order_bank}]${requestScope.o_list[0].order_account}</span></c:when>
                    <c:when test="${requestScope.o_list[0].pay_type == '2'}"><span
                            class="payment-method">토스페이</span></c:when>
                    <c:when test="${requestScope.o_list[0].pay_type == '3'}"><span
                            class="payment-method">카카오페이</span></c:when>
                    <c:when test="${requestScope.o_list[0].pay_type == '4'}"><span
                            class="payment-method">카드-${requestScope.o_list[0].card_name}</span></c:when>
                </c:choose>
            </li>
        </ul>
    </div>
    <div class="benefits-info">
        <div class="benefits-header">
            <h5>이번 주문으로 받은 혜택</h5>
            <span class="svg-icon" data-toggle="modal" data-target="#benefitsModal">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z"/>
                                    </svg>
                                </span>
        </div>
        <ul class="benefits-list">
            <!-- 총 할인 금액 계산 -->
            <c:set var="totalDiscount" value="${totalPrice - finalPrice}"/>

            <!-- 받은 총 혜택 계산 -->
            <c:set var="gradeBenefit" value="${finalPrice * (requestScope.grade.point_condition / 100)}"/>
            <c:set var="totalBenefits" value="${totalDiscount + gradeBenefit}"/>
            <li><span>총 할인 금액</span> <span><fmt:formatNumber value="${totalDiscount}" type="number"
                                                             maxFractionDigits="0"/>원</span></li>
            <li><span>[${requestScope.grade.name}] ${requestScope.grade.point_condition}% 적립</span> <fmt:formatNumber
                    value="${gradeBenefit}" type="number" maxFractionDigits="0"/>원</span></li>
            <li><span>배송비</span> <span>무료</span></li>
            <li class="total-benefits"><span class="result-benefits">받은 총 혜택</span> <span><fmt:formatNumber
                    value="${totalBenefits}" type="number" maxFractionDigits="0"/>원</span></li>
        </ul>
    </div>
    <div class="product-section">
        <h5>주문 상품 ${fn:length(o_list)}개</h5>
        <c:forEach var="item" items="${requestScope.o_list}" varStatus="status">
            <c:choose>
                <c:when test="${item.status == '1'}"><p class="payment-status">결제 완료</p></c:when>
                <c:when test="${item.status == '2'}"><p class="payment-status">배송전</p></c:when>
                <c:when test="${item.status == '3'}"><p class="payment-status">배송중</p></c:when>
                <c:when test="${item.status == '4'}"><p class="payment-status">배송완료</p></c:when>
                <c:when test="${item.status == '5'}"><p class="payment-status">구매확정</p></c:when>
                <c:when test="${item.status == '6'}"><p class="payment-status">취소</p></c:when>
                <c:when test="${item.status == '7'}"><p class="payment-status">반품</p></c:when>
                <c:when test="${item.status == '8'}"><p class="payment-status">교환</p></c:when>
            </c:choose>
            <div class="product-item">
                <img src="${fn:split(item.prod_image, ',')[0]}" alt="상품 이미지" class="product-img">
                <div class="product-details">
                    <div class="product-header">
                        <p class="product-brand"><strong>${item.brand}</strong></p>
                    </div>
                    <p class="product-name">${item.prod_name}<br>${item.option_name} / ${item.count}개</p>
                    <div class="product-price-row">
                        <p class="product-price">
                            <fmt:formatNumber value="${item.amount}"/>원
                        </p>
                    </div>
                </div>
                <c:if test="${item.status == '1'}">
                    <input type="hidden" id="prod-no" class="prod-no" value="${item.prod_no}">
                    <input type="hidden" id="orderId" value="${item.id}">
                    <input type="hidden" id="orderCode" value="${item.order_code}">
                    <input type="hidden" id="inventoryNo" value="">
                    <button class="btn btn-outline-secondary option-button" data-toggle="modal"
                            data-target="#orderDetails_optionModal" onclick="ShowOptionModal(${item.prod_no})">옵션 변경
                    </button>
                </c:if>
            </div>
            <div class="product-actions">
                <button class="btn btn-outline-secondary cancel-button" onclick="location.href='Controller?type=cancelOrder&action=select&order_id=${item.id}&order_code=${item.order_code}&prod_no=${item.prod_no}'">
                    주문 상세
                </button>
                <button class="btn btn-dark cancel-button" onclick="location.href='Controller'">
                    계속 쇼핑하기
                </button>
            </div>
        </c:forEach>
    </div>
</c:if>
