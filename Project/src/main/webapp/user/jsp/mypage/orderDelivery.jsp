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
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/orderDelivery.css"/>
</head>
<body>
    <%-- header --%>
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <!-- content -->
    <div class="wrap">
        <div class="row">
            <div class="container">

                <!-- Order Section -->
                <div class="order-container">
                    <div class="order-status">
                        <h2 class="order-title">진행 중 주문 현황</h2>
                        <div class="wrap-order-item">
                            <div class="order-item" onclick="location.href='Controller?type=deliveryStatus'">
                                <img src="./user/images/product5.jpg" alt="Product Image" class="product-image">
                                <div class="order-details">
                                    <div class="payment-status">결제완료</div>
                                    <div class="product-name">커버낫</div>
                                    <div class="product-description">
                                        [2PACK] 쿨 코튼 티셔츠 블랙+화이트<br>M
                                    </div>
                                </div>
                            </div>
                            <div class="order-item" onclick="location.href='Controller?type=deliveryStatus'">
                                <img src="./user/images/product5.jpg" alt="Product Image" class="product-image">
                                <div class="order-details">
                                    <div class="payment-status">결제완료</div>
                                    <div class="product-name">커버낫</div>
                                    <div class="product-description">
                                        [2PACK] 쿨 코튼 티셔츠 블랙+화이트<br>M
                                    </div>
                                </div>
                            </div>
                            <div class="order-item" onclick="location.href='Controller?type=deliveryStatus'">
                                <img src="./user/images/product5.jpg" alt="Product Image" class="product-image">
                                <div class="order-details">
                                    <div class="payment-status">결제완료</div>
                                    <div class="product-name">커버낫</div>
                                    <div class="product-description">
                                        [2PACK] 쿨 코튼 티셔츠 블랙+화이트<br>M
                                    </div>
                                </div>
                            </div>
                        </div>
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
