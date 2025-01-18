<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%-- Google Font : Gothic A1 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <title>Title</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/refund.css"/>
</head>
<body>
    <!-- header -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <!-- content-->
    <div class="wrap">
        <div class="row">
            <div class="container">

                <div>
                    <span class="refund-title">반품/취소 내역</span>
                </div>

                <div class="wrap-refund-list">
                    <div class="refund-summary">
                        <div class="refund-header">
                            <div class="refund-date">24.12.16</div>
                            <div class="refund-details-link">
                                <a href="#">주문 상세</a>
                            </div>
                        </div>
                        <div class="refund-status">취소완료</div>
                        <div class="order-product">
                            <div class="product-image"></div>
                            <div class="product-info">
                                <p class="product-brand">thisisnever</p>
                                <p class="product-name">Mesh Football Jersey Navy</p>
                                <p class="product-options">M / 1개</p>
                                <p class="product-price">25,770원</p>
                            </div>
                        </div>
                        <div class="wrap-buttons">
                            <button type="button" class="btn btn-outline-secondary">취소 상세</button>
                            <button type="button" class="btn btn-outline-secondary">재구매</button>
                        </div>
                    </div><hr/>

                    <div class="refund-summary">
                        <div class="refund-header">
                            <div class="refund-date">24.12.16</div>
                            <div class="refund-details-link"><a href="#">주문 상세</a></div>
                        </div>
                        <div class="refund-status">반품완료</div>
                        <div class="order-product">
                            <div class="product-image"></div>
                            <div class="product-info">
                                <p class="product-brand">thisisnever</p>
                                <p class="product-name">Mesh Football Jersey Navy</p>
                                <p class="product-options">M / 1개</p>
                                <p class="product-price">25,770원</p>
                            </div>
                        </div>
                        <div class="wrap-buttons">
                            <button type="button" class="btn btn-outline-secondary">반품 상세</button>
                            <button type="button" class="btn btn-outline-secondary">재구매</button>
                            <button type="button" class="btn btn-outline-secondary">회수 배송 조회</button>
                        </div>
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
