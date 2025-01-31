<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>무신사</title>

    <%-- Google Font : Gothic A1 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/refundDetails.css"/>
</head>
<body>
    <c:choose>
        <c:when test="${not empty sessionScope.customer_info}">
            <!-- header -->
            <jsp:include page="../layout/header.jsp"></jsp:include>

            <!-- content -->
            <div class="wrap">
                <div class="row">
                    <div class="container">
                        <div class="wrap-title">
                            <span class="title">반품 상세내역</span>
                        </div>

                        <div class="refund-details">
                            <%-- 주문 정보 --%>
                            <div class="order-info">
                                <div class="order-date">2024.12.18 19:54</div>
                                <div class="wrap-order-details">
                                    <div class="order-number">주문번호 202012161492200002</div>
                                    <div class="order-details-link"><a href="Controller?type=orderDetails">주문 상세</a></div>
                                </div>
                            </div>
                            <hr/>

                            <%-- 반품 상품 정보 --%>
                            <div class="refund-product">
                                <h2>반품 상품 1개</h2>
                                <span class="refund-status">반품완료</span>
                                <div class="product-details">
                                    <div class="product-image"></div>
                                    <div class="product-info">
                                        <p class="product-brand">thisisnever</p>
                                        <p class="product-name">Mesh Football Jersey Navy</p>
                                        <p class="product-options">M / 1개</p>
                                        <p class="product-price">26,080원</p>
                                    </div>
                                </div>
                            </div>
                            <div class="wrap-buttons">
                                <button class="btn btn-outline-secondary button" data-toggle="modal" data-target="#repurchaseModal">재구매</button>
                                <button class="btn btn-outline-secondary button">회수 배송 조회</button>
                            </div><hr/>

                            <%-- 반품 신청 정보 --%>
                            <div class="request-info">
                                <h2 class="subtitle">반품 신청 정보</h2>
                                <ul class="info-list">
                                    <li>
                                        <span class="info-label">신청 일시</span>
                                        <span class="info-value">2024-12-18 19:54:17</span>
                                    </li>
                                    <li>
                                        <span class="info-label">완료 일시</span>
                                        <span class="info-value">2024-12-23 14:25:24</span>
                                    </li>
                                    <li>
                                        <span class="info-label">반품 사유</span>
                                        <span class="info-value">상품 불량</span>
                                    </li>
                                    <li>
                                        <span class="info-label">수거 방법</span>
                                        <span class="info-value">회수해 주세요</span>
                                    </li>
                                    <li>
                                        <span class="info-label">반품 회수지</span>
                                        <span class="info-value">
                                    홍**동 / 010-****-1234<br>
                                    (12345) 서울특별시 동작구 보라매로5길 1 ****
                                </span>
                                    </li>
                                    <li>
                                        <span class="info-label">반송지 주소</span>
                                        <span class="info-value">
                                    (04782) 서울 성동구 연무장5가길 7<br>
                                    (성수역 현대테라스타워) w609호
                                </span>
                                    </li>
                                </ul>
                            </div><hr/>

                            <!-- 환불 요청 내역 -->
                            <div class="refund-request">
                                <h3 class="subtitle">환불 정보</h3>
                                <ul class="detail-list">
                                    <li>
                                        <span class="detail-label">상품 결제금액</span>
                                        <span class="detail-value">35,910원</span>
                                    </li>
                                    <li>
                                        <span class="detail-label">통합 적립금 사용</span>
                                        <span class="detail-value">2,793원</span>
                                    </li>
                                    <li>
                                        <span class="detail-label">기본 배송비</span>
                                        <span class="detail-value">0원</span>
                                    </li>
                                    <li>
                                        <span class="detail-label">제주/도서산간 배송비</span>
                                        <span class="detail-value">0원</span>
                                    </li>
                                    <li>
                                        <span class="detail-label">반품 배송비 (제주/도서산간 배송비 포함)</span>
                                        <span class="detail-value">0원</span>
                                    </li>
                                    <li>
                                        <span class="detail-label">추가 배송비</span>
                                        <span class="detail-value">0원</span>
                                    </li>
                                </ul>
                            </div><hr/>

                            <!-- 환불 예정 금액 -->
                            <div class="refund-amount">
                                <h3 class="subtitle">환불 예정 금액</h3>
                                <div class="wrap-p">
                                    <p class="refund-method">카드 - 농협카드(일시불)</p>
                                    <p class="refund-expected">33,117원</p>
                                </div>
                            </div>

                            <%-- 안내사항 --%>
                            <div class="notice">* 주문 시 사용한 적립금 및 할인쿠폰은 취소완료 즉시 반환됩니다.</div>
                        </div>
                    </div>
                </div>

                <!-- footer -->
                <jsp:include page="../layout/footer.jsp"></jsp:include>
            </div>

            <!-- 재구매 모달 -->
            <div class="modal fade" id="repurchaseModal" tabindex="-1" role="dialog" aria-labelledby="repurchaseModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="repurchaseModalLabel">동일한 옵션/수량으로 재구매 하시겠습니까?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>다른 옵션/수량으로 구매하려면 장바구니에 담은 후 변경해 보세요.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-dark button" onclick="location.href='Controller?type=cart'">장바구니 담기</button>
                            <button type="button" class="btn btn-dark button" onclick="location.href='Controller?type=order&action=order'">구매하기</button>
                        </div>
                    </div>
                </div>
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

</body>
</html>
