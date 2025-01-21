<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
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
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/retiredReward.css"/>
</head>
<body>
    <!-- header -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <div class="wrap">
        <div class="row">
            <div class="container">
                <div class="retired-header">
                    <h2>회원 탈퇴</h2>
                </div>
                <div class="retired-content">
                    <h4 class="notice-title">지금 탈퇴하시면, 아래 혜택이 모두 사라져요!</h4>
                    <ul class="benefit-list">
                        <li>
                            <span class="benefit-title">회원 등급</span>
                            <span class="benefit-value">LV.3 멤버</span>
                        </li>
                        <li>
                            <span class="benefit-title">적립금</span>
                            <span class="benefit-value">903원</span>
                        </li>
                        <li>
                            <span class="benefit-title">쿠폰</span>
                            <span class="benefit-value">106장</span>
                        </li>
                    </ul>
                    <div class="form-actions">
                        <button type="button" class="btn btn-light" onclick="location.href='Controller?type=retiredNotice'">다음</button>
                        <button type="button" class="btn btn-dark" onclick="location.href='Controller?type=myPage'">탈퇴 그만두기</button>
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

    <script src="./user/js/mypage/retiredReward.js"></script>
</body>
</html>
