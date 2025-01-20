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
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/profileEdit.css"/>
</head>
<body>
    <!-- header -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <div class="wrap">
        <div class="row">
            <div class="container">
                <div class="edit-header">
                    <h2>회원 정보 변경</h2>
                </div>
                <div class="profile-container">
                    <table class="profile-table">
                        <tbody>
                            <tr>
                                <th>이름</th>
                                <td>홍길동</td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td>2001.**.**</td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                <td>010-****-1234</td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>test****@*****.com</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="button-container">
                        <button type="button" class="btn btn-outline-secondary">회원정보 변경</button>
                        <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#emailModal">이메일 변경</button>
                    </div>
                </div>
                <div class="retired-link-container">
                    <a href="Controller?type=retired">회원탈퇴</a>
                </div>
            </div>
        </div>

        <%-- footer --%>
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>

    <%-- 이메일 변경 모달 --%>
    <div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="emailModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">이메일 변경</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="email-change-form">
                        <div class="form-group d-flex align-items-center">
                            <input type="email" class="form-control email-input" placeholder="이메일" />
                            <button type="button" class="btn btn-outline-secondary request-btn">인증요청</button>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control verification-input" placeholder="인증번호" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark">변경</button>
                </div>
            </div>
        </div>
    </div>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
