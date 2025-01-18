<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <%-- Google Font : Gothic A1 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/exchange.css"/>
</head>
<body>
    <!-- header -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <!-- content-->
    <div class="wrap">
        <div class="row">
            <div class="container">

                <div>
                    <span class="exchange-title">교환내역</span>
                </div>

                <div class="wrap-exchange-list">
                    <div class="exchange-summary">
                        <div class="exchange-header">
                            <div class="exchange-date">22.05.16</div>
                            <div class="exchange-details-link">
                                <a href="#">주문 상세</a>
                            </div>
                        </div>
                        <div class="exchange-status">교환완료</div>
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
                            <button type="button" class="btn btn-outline-secondary">교환 상세</button>
                            <button type="button" class="btn btn-outline-secondary">교환 배송 조회</button>
                            <button type="button" class="btn btn-outline-secondary">회수 배송 조회</button>
                        </div>
                    </div><hr/>

                    <div class="exchange-summary">
                        <div class="exchange-header">
                            <div class="exchange-date">22.05.16</div>
                            <div class="exchange-details-link"><a href="#">주문 상세</a></div>
                        </div>
                        <div class="exchange-status">교환완료</div>
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
                            <button type="button" class="btn btn-outline-secondary">교환 상세</button>
                            <button type="button" class="btn btn-outline-secondary">교환 배송 조회</button>
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
