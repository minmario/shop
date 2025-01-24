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

    <%-- SummerNote CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/summernote-lite.css"/>

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/writeInquiry.css"/>
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
                        <div class="inquiry-title">
                            <h2 class="title">1:1 문의</h2>
                        </div>
                        <div class="tab-navigation">
                            <button class="btn btn-outline-secondary tab-button active">배송</button>
                            <button class="btn btn-outline-secondary tab-button">주문/결제</button>
                            <button class="btn btn-outline-secondary tab-button">취소/교환/환불</button>
                            <button class="btn btn-outline-secondary tab-button">회원정보</button>
                            <button class="btn btn-outline-secondary tab-button">상품확인</button>
                            <button class="btn btn-outline-secondary tab-button">서비스</button>
                        </div>
                        <div class="inquiry-type">
                            <select class="inquiry-select">
                                <option>문의 유형을 선택해주세요.</option>
                            </select>
                        </div>
                        <div class="inquiry-content">
                            <label>내용</label>
                            <textarea id="content" name="content" cols="50" rows="8"></textarea>
                        </div>
                        <div class="notice">
                            <p>* 제품 사용, 오염, 전용 박스 손상, 라벨 제거, 사은품 및 부속 사용/분실 시, 교환/환불이 불가능합니다.</p>
                            <p>* 교환을 원하시는 상품(사이즈)의 재고가 부족 시, 교환이 불가능합니다.</p>
                            <p>* 고객님의 주문내역을 선택, 질문이 필요한 상품을 선택하시면 1:1 상담이 가능합니다.</p>
                        </div>
                        <div class="action-buttons">
                            <button class="btn btn-secondary cancel-btn">취소</button>
                            <button class="btn btn-dark submit-btn">작성하기</button>
                        </div>
                    </div>
                </div>

                <!-- footer -->
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

    <%-- SummerNote JS --%>
    <script src="./user/js/summernote-lite.js"></script>
    <script src="./user/js/lang/summernote-ko-KR.js"></script>

    <script src="./user/js/mypage/writeInquiry.js"></script>
</body>
</html>
