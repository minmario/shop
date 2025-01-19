<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%-- Google Font : Gothic A1 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <%-- Bootstrap CSS --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="../../css/mypage/refundDetails.css"/>
</head>
<body>
    <!-- header -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <!-- content -->
    <div class="wrap">
        <div class="row">
            <div class="container">

                <div class="wrap-title">
                    <span class="title">반품 상세내역</span>
                </div>

                <div class="exchange-details">

                    <%-- 주문 정보 --%>
                    <div class="order-info">
                        <div class="order-date">2024.12.18 19:54</div>
                        <div class="wrap-order-details">
                            <div class="order-number">주문번호 202012161492200002</div>
                            <div class="order-details-link"><a href="#">주문 상세</a></div>
                        </div>
                    </div>
                    <hr/>

                    <%-- 반품 상품 정보 --%>
                    <div class="exchange-product">
                        <h2>반품 상품 1개</h2>
                        <span class="exchange-status">반품완료</span>
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
                        <button class="btn btn-outline-secondary">재구매</button>
                        <button class="btn btn-outline-secondary">회수 배송 조회</button>
                    </div><hr/>

                    <%-- 반품 신청 정보 --%>
                    <div class="request-info">
                        <h2 class="refund-subtitle">반품 신청 정보</h2>
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
                    <div class="refund-details">
                        <h3 class="refund-subtitle">환불 정보</h3>
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
                        <h3 class="refund-subtitle">환불 예정 금액</h3>
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

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
