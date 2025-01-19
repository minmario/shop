<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>Musinsa</title>

    <%-- Google Font : Gothic A1 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/exchangeDetails.css"/>
</head>
<body>
    <!-- header -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <!-- content -->
    <div class="wrap">
        <div class="row">
            <div class="container">

                <div class="wrap-title">
                    <span class="title">교환 상세내역</span>
                </div>

                <div class="exchange-details">

                    <%-- 주문 정보 --%>
                    <div class="order-info">
                        <div class="order-date">2024.12.18 19:54</div>
                        <div class="wrap-order-details">
                            <div class="order-number">주문번호 202012161492200002</div>
                            <div class="order-details-link"><a href="Controller?type=orderDetails">주문 상세</a></div>
                        </div>
                    </div>
                    <hr/>

                    <%-- 교환 상품 정보 --%>
                    <div class="exchange-product">
                        <h2>교환 상품 1개</h2>
                        <span class="exchange-status">교환완료</span>
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

                    <%-- 버튼 --%>
                    <div class="wrap-buttons">
                        <button class="btn btn-outline-secondary button">교환 배송 조회</button>
                        <button class="btn btn-outline-secondary button">회수 배송 조회</button>
                    </div><hr/>

                    <%-- 교환 신청 정보 --%>
                    <div class="request-info">
                        <h2 class="subtitle">교환 신청 정보</h2>
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
                                <span class="info-label">교환 사유</span>
                                <span class="info-value">기타</span>
                            </li>
                            <li>
                                <span class="info-label">수거 방법</span>
                                <span class="info-value">회수해 주세요</span>
                            </li>
                            <li>
                                <span class="info-label">교환 회수지</span>
                                <span class="info-value">
                                    홍**동 / 010-****-1234<br>
                                    (12345) 서울특별시 동작구 보라매로5길 1 ****
                                </span>
                            </li>
                            <li>
                                <span class="info-label">교환상품 배송</span>
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

                    <!-- 교환 배송비 결제 정보 -->
                    <div class="payment-info">
                        <h2 class="subtitle">교환배송비 결제정보</h2>
                        <div class="wrap-p">
                            <p class="payment-method">결제내역</p>
                            <p class="payment-expected">0원</p>
                        </div>
                        <p class="notice">* 주문 시 사용한 적립금 및 할인쿠폰은 취소완료 즉시 반환됩니다.</p>
                    </div>
                </div>

            </div>
        </div>

        <!-- footer -->
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
