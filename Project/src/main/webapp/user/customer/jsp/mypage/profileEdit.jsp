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
    <link rel="stylesheet" type="text/css" href="./user/customer/css/mypage/profileEdit.css"/>
</head>
<body>
    <c:choose>
        <c:when test="${not empty sessionScope.customer_info}">
            <!-- header -->
            <jsp:include page="../layout/header.jsp"></jsp:include>

            <div class="wrap">
                <div class="row">
                    <div class="container">
                        <div class="edit-header">
                            <h2>회원 정보 변경</h2>
                        </div>
                        <div class="profile-container" id="profile-acticle">
                            <jsp:include page="./components/profile.jsp"></jsp:include>
                        </div>
                        <div class="retired-link-container">
                            <a href="Controller?type=retiredReason">회원탈퇴</a>
                        </div>
                    </div>
                </div>

                <%-- footer --%>
                <jsp:include page="../layout/footer.jsp"></jsp:include>
            </div>

            <%-- 회원정보 변경 모달 --%>
            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">회원정보 변경</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="email-change-form">
                                <div class="form-group">
                                    <label>이메일</label>
                                    <input type="email" class="form-control email-input" id="email" name="email" placeholder="이메일" autoComplete="off" value="${sessionScope.customer_info.email}"/>
                                </div>
                                <div class="form-group">
                                    <label>휴대폰 번호</label>
                                    <input type="text" class="form-control verification-input" id="phone" name="phone" placeholder="휴대폰 번호" autoComplete="off" value="${sessionScope.customer_info.phone}"/>
                                </div>
                                <div class="change-button-container">
                                    <button type="button" class="btn btn-dark" id="btn-change" onclick="updateCustomer()">변경</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <script>
                alert("세션이 만료되었습니다. 다시 로그인해 주세요.");
                window.location.href = 'Controller?type=login';
            </script>
        </c:otherwise>
    </c:choose>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="./user/customer/js/mypage/profileEdit.js"></script>
</body>
</html>