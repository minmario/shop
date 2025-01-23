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
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/retiredReason.css"/>
</head>
<body>
    <c:choose>
        <c:when test="${not empty sessionScope.customer_info}">
            <!-- header -->
            <jsp:include page="../layout/header.jsp"></jsp:include>

            <div class="wrap">
                <div class="row">
                    <div class="container">
                        <div class="retired-header">
                            <h2>회원 탈퇴</h2>
                        </div>
                        <div class="account-withdrawal">
                            <h3 class="title">홍*동님, 무신사를 떠나시는 이유를 알려주세요</h3>
                            <form>
                                <div class="form-group">
                                    <label for="reason-select" class="form-label">이유</label>
                                    <select id="reason-select" class="form-control">
                                        <option value="">:: 선택하세요 ::</option>
                                        <option value="구매할 만한 상품이 없어요.">구매할 만한 상품이 없어요.</option>
                                        <option value="상품의 가격이 비싸요.">상품의 가격이 비싸요.</option>
                                        <option value="배송이 느려요.">배송이 느려요.</option>
                                        <option value="교환 / 반품 / 환불이 불편해요.">교환 / 반품 / 환불이 불편해요.</option>
                                        <option value="회원 / 쇼핑 혜택이 부족해요.">회원 / 쇼핑 혜택이 부족해요.</option>
                                        <option value="쇼핑 기능이 어려워요.">쇼핑 기능이 어려워요.</option>
                                        <option value="상품 탐색이 어려워요.">상품 탐색이 어려워요.</option>
                                        <option value="기타">기타</option>
                                    </select>
                                </div>
                                <div class="form-group feedback" style="display: none;">
                                    <label for="feedback-textarea" class="form-label">더 나은 무신사가 될 수 있도록 의견을 남겨주세요.</label>
                                    <textarea id="feedback-textarea" class="form-control" rows="5" placeholder="10자 이상 입력해 주세요."></textarea>
                                </div>
                                <div class="form-actions">
                                    <button type="button" class="btn btn-light" onclick="location.href='Controller?type=retiredReward'">다음</button>
                                    <button type="button" class="btn btn-dark" onclick="location.href='Controller?type=myPage'">탈퇴 그만두기</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                    <%-- footer --%>
                <jsp:include page="../layout/footer.jsp"></jsp:include>
            </div>
        </c:when>
        <c:otherwise>
            <script>
                window.location.href = "Controller?type=error";
            </script>
        </c:otherwise>
    </c:choose>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="./user/js/mypage/retiredReason.js"></script>
</body>
</html>
