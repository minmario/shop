<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <link rel="stylesheet" type="text/css" href="./user/css/error/error.css"/>
</head>
<body>
    <%-- header --%>
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <div class="wrap">
        <div class="row">
            <div class="container">
                <div class="error-message">
                    <i class="bi bi-exclamation-circle"></i>
                    <span class="error-text">오류가 발생했습니다. 다시 로그인하세요.</span>
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
