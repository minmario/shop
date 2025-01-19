<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>Musinsa</title>

    <%-- Google Font : Gothic A1 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/cancelOrder.css"/>
</head>
<body>
    <%-- header --%>
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <div class="wrap">
        <div class="row">
            <div class="container">
                <div class="cancel-order-title">주문 취소</div>
                <div class="cancel-order-container">
                    <div class="select-all">
                        <input type="checkbox" id="select-all">
                        <label for="select-all">전체 선택</label>
                    </div>
                    <div class="product-item">
                        <input type="checkbox" id="product1">
                        <label for="product1" class="product-label">
                            <img src="./user/images/product8.jpg" alt="상품 이미지" class="product-img">
                            <div class="product-details">
                                <p class="product-brand">커버낫</p>
                                <p class="product-name">[2PACK] 쿨 코튼 티셔츠 블랙+화이트<br>M / 1개</p>
                                <p class="product-price">28,137원</p>
                            </div>
                        </label>
                    </div>
                    <div class="cancel-reason">
                        <h5>취소 사유</h5>
                        <div class="reason-item">
                            <input type="radio" id="reason1" name="cancelReason">
                            <label for="reason1">단순 변심 (상품이 필요 없어짐)</label>
                        </div>
                        <div class="reason-item">
                            <input type="radio" id="reason2" name="cancelReason">
                            <label for="reason2">주문 실수 (상품 또는 수량 잘못 선택, 추가 재주문)</label>
                        </div>
                        <div class="reason-item">
                            <input type="radio" id="reason3" name="cancelReason">
                            <label for="reason3">다른 결제 수단으로 변경</label>
                        </div>
                        <div class="reason-item">
                            <input type="radio" id="reason4" name="cancelReason">
                            <label for="reason4">기타</label>
                        </div>
                    </div>
                    <div class="refund-info">
                        <h5>환불 정보</h5>
                        <ul>
                            <li><span>상품 결제 금액</span><span>0원</span></li>
                            <li><span>적립금 사용</span><span>0원</span></li>
                            <li><span>기본 배송비</span><span>0원</span></li>
                            <li><span>제주/도서산간 배송비</span><span>0원</span></li>
                            <li><span>환불 예정 금액</span><span>0원</span></li>
                        </ul>
                    </div>
                    <div class="notice">
                        <p>결제 시 사용한 적립금 및 할인 쿠폰은 취소 완료 즉시 반환됩니다.</p>
                        <p>가상계좌(무통장입금)의 경우 최근 7일 이내 3회 이상 주문취소 시 결제수단 이용에 제한이 될 수 있습니다.</p>
                    </div>
                    <div class="cancel-button-container">
                        <button class="btn btn-dark cancel-request-btn">취소 요청하기 (1개)</button>
                    </div>
                </div>
            </div>
        </div>

        <%-- footer --%>
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
