<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>무신사</title>

    <%-- Google Font : Gothic A1 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/customer/css/mypage/cancelOrder.css"/>
</head>
<body>
    <c:choose>
        <c:when test="${not empty sessionScope.customer_info}">
            <%-- header --%>
            <jsp:include page="../layout/header.jsp"></jsp:include>

            <c:if test="${requestScope.o_vo eq null}">
                <script>
                    // alert("해당 주문의 정보를 불러올 수 없습니다.");
                    // window.location.href = "Controller?type=mypage";
                </script>
            </c:if>

            <div class="wrap">
                <div class="row">
                    <div class="container">
                        <c:if test="${requestScope.o_vo ne null}">
                        <c:set var="o_vo" value="${requestScope.o_vo}"/>
                            <div class="cancel-order-title">주문 취소</div>
                            <div class="cancel-order-container">
                                <h5>취소 상품</h5>
                                <div class="product-item">
                                    <input type="hidden" name="order_id" value="${o_vo.id}">
                                    <input type="hidden" id="orderCode" value="${o_vo.order_code}">
                                    <input type="hidden" name="prod_no" value="${o_vo.prod_no}"/>
                                    <input type="hidden" id="cancel-point-used" value="${o_vo.point_amount}"/>
                                    <img src="${fn:split(o_vo.prod_image, ',')[0]}" alt="상품 이미지" class="product-img">
                                    <div class="product-details">
                                        <p class="product-brand">${o_vo.brand}</p>
                                        <p class="product-name">${o_vo.prod_name}<br>${o_vo.option_name} / <span class="product-count">${o_vo.count}</span>개</p>
                                        <p class="product-price" data-price="${o_vo.amount}">
                                            <fmt:formatNumber value="${o_vo.amount}"/>원
                                        </p>
                                    </div>
                                </div>
                                <div class="cancel-reason">
                                    <h5>취소 사유</h5>
                                    <div class="reason-item">
                                        <input type="radio" id="reason1" name="cancelReason" value="reason1">
                                        <label for="reason1">단순 변심 (상품이 필요 없어짐)</label>
                                    </div>
                                    <div class="reason-item">
                                        <input type="radio" id="reason2" name="cancelReason" value="reason2">
                                        <label for="reason2">주문 실수 (상품 또는 수량 잘못 선택, 추가 재주문)</label>
                                    </div>
                                    <div class="reason-item">
                                        <input type="radio" id="reason3" name="cancelReason" value="reason3">
                                        <label for="reason3">다른 결제 수단으로 변경</label>
                                    </div>
                                    <div class="reason-item">
                                        <input type="radio" id="reason4" name="cancelReason" value="reason4">
                                        <label for="reason4">기타</label>
                                        <!-- 직접 입력 필드 -->
                                        <div id="custom-reason-input" class="custom-reason" style="display: none;">
                                            <input type="text" class="form-control" placeholder="취소 사유를 직접 입력하세요" name="customCancelReason">
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${o_vo.status != '0'}">
                                    <div class="refund-account">
                                        <h5>취소 계좌 정보</h5>

                                        <!-- 은행 선택 -->
                                        <div class="margin">
                                            <label for="cancel-bank-select" class="bold">은행 선택</label><br>
                                            <select class="form-select select" id="cancel-bank-select" name="bank">
                                                <option value="" selected disabled>:: 은행을 선택하세요 ::</option>
                                                <option value="KB국민은행">KB국민은행</option>
                                                <option value="신한은행">신한은행</option>
                                                <option value="우리은행">우리은행</option>
                                                <option value="NH농협은행">NH농협은행</option>
                                            </select>
                                        </div>

                                        <!-- 계좌 번호 입력 -->
                                        <div class="margin">
                                            <label for="account-number" class="bold">계좌번호</label><br>
                                            <input type="text" class="toggle" id="account-number" name="account-number" placeholder="계좌번호를 입력하세요"/><br/>
                                        </div>
                                    </div>

                                    <div class="cancel-refund-info">
                                        <h5>환불 정보</h5>
                                        <ul>
                                                <%-- 상품 결제 금액 및 적립금 사용 값 변환 및 계산 --%>
                                            <c:set var="prodPrice" value="${o_vo.amount}" />
                                            <c:set var="pointUsed" value="${not empty o_vo.point_amount ? o_vo.point_amount : '0'}" />
                                            <c:set var="prodCount" value="${o_vo.count}" />
                                            <c:set var="coupon" value="${requestScope.coupon}"/>

                                                <%-- 숫자만 추출하여 int형으로 변환 --%>
                                            <c:set var="prodPriceInt" value="${fn:replace(prodPrice, ',', '')}" />
                                            <c:set var="pointUsedInt" value="${fn:replace(pointUsed, ',', '')}" />

                                            <!-- 상품 가격에 수량을 곱하여 총 결제 금액 계산 -->
                                            <c:set var="totalPrice" value="${prodPriceInt * prodCount}" />

                                            <li><span>상품 결제 금액</span><span class="cancel-item-price"><fmt:formatNumber value="${totalPrice}"/>원</span></li>

                                            <c:if test="${o_vo.point_amount ne null}">
                                                <li><span>적립금 사용</span><span class="cancel-item-price"><fmt:formatNumber value="${pointUsed}"/>원</span></li>
                                            </c:if>

                                            <c:if test="${coupon ne null}">
                                            <li>
                                                <c:set var="couponDiscount" value="${totalPrice * (coupon.sale_per / 100)}" />
                                                <span>쿠폰 사용</span><br/>
                                                <span class="cancel-coupon-info">${coupon.coupon_name} (${coupon.sale_per}%)</span>
                                                <span class="cancel-coupon">-<fmt:formatNumber value="${couponDiscount}" type="number" maxFractionDigits="0"/>원</span>
                                            </li>
                                            </c:if>

                                            <!-- 환불 예정 금액 계산 (총 결제 금액 - 적립금 - 쿠폰) -->
                                            <c:set var="refundAmount" value="${totalPrice - pointUsedInt - couponDiscount}" />
                                            <li><span>환불 예정 금액</span><span class="cancel-refund-amount"><fmt:formatNumber value="${refundAmount}" type="number" maxFractionDigits="0"/>원</span></li>
                                        </ul>
                                    </div>
                                </c:if>
                                <div class="notice">
                                    <p>결제 시 사용한 적립금 및 할인 쿠폰은 취소 완료 즉시 반환됩니다.</p>
                                </div>
                                <div class="cancel-button-container">
                                    <button type="button" class="btn btn-dark cancel-request-btn" onclick="cancelRequest()">취소 요청하기</button>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>

                <%-- footer --%>
                <jsp:include page="../layout/footer.jsp"></jsp:include>
            </div>
        </c:when>
        <c:otherwise>
            <script>
                alert("세션이 만료되었습니다. 다시 로그인해 주세요.");
                window.location.href = 'Controller?type=login';
            </script>
        </c:otherwise>
    </c:choose>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <%-- JS --%>
    <script src="./user/customer/js/mypage/cancelOrder.js"></script>
</body>
</html>
