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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/customer/css/signup/signup.css"/>
</head>
<body class="bg-light">
<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="card shadow p-4 w-100" style="max-width: 500px;">
        <!-- MUSINSA 로고 -->
        <h1 class="text-center fw-bold mb-4">MUSINSA</h1>

        <!-- 회원가입 폼 -->
        <form action="Controller?type=signup&action=insert" method="POST">
            <!-- 아이디 -->
            <div class="mb-3">
                <label for="cus_id" class="form-label">아이디</label>
                <input type="text" class="form-control" id="cus_id" name="cus_id" placeholder="아이디를 입력하세요" maxlength="30" required>
            </div>

            <!-- 비밀번호 -->
            <div class="mb-3">
                <label for="cus_pw" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="cus_pw" name="cus_pw" placeholder="비밀번호를 입력하세요" maxlength="30" required>
            </div>

            <!-- 이름 -->
            <div class="mb-3">
                <label for="cus_name" class="form-label">이름</label>
                <input type="text" class="form-control" id="cus_name" name="cus_name" placeholder="이름을 입력하세요" maxlength="50" required>
            </div>

            <!-- 닉네임 -->
            <div class="mb-3">
                <label for="cus_nickname" class="form-label">닉네임</label>
                <input type="text" class="form-control" id="cus_nickname" name="cus_nickname" placeholder="닉네임을 입력하세요" maxlength="50">
            </div>

            <!-- 성별 -->
            <div class="mb-3">
                <label class="form-label">성별</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="cus_gender" id="gender_m" value="1" required>
                    <label class="form-check-label" for="gender_m">남성</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="cus_gender" id="gender_w" value="2" required>
                    <label class="form-check-label" for="gender_w">여성</label>
                </div>
            </div>

            <!-- 생년월일 -->
            <div class="mb-3">
                <label for="cus_birth" class="form-label">생년월일</label>
                <input type="date" class="form-control" id="cus_birth" name="cus_birth">
            </div>

            <!-- 전화번호 -->
            <div class="mb-3">
                <label for="cus_phone" class="form-label">전화번호</label>
                <input type="text" class="form-control" id="cus_phone" name="cus_phone" placeholder="전화번호를 입력하세요" maxlength="30">
            </div>

            <!-- 이메일 -->
            <div class="mb-3">
                <label for="cus_email" class="form-label">이메일</label>
                <input type="email" class="form-control" id="cus_email" name="cus_email" placeholder="이메일을 입력하세요" maxlength="100" required>
            </div>

            <!-- 키 -->
            <div class="mb-3">
                <label for="height" class="form-label">키</label>
                <input type="number" class="form-control" id="height" name="height" placeholder="키(cm)를 입력하세요">
            </div>

            <!-- 몸무게 -->
            <div class="mb-3">
                <label for="weight" class="form-label">몸무게</label>
                <input type="number" class="form-control" id="weight" name="weight" placeholder="몸무게(kg)를 입력하세요">
            </div>

            <!-- 회원가입 버튼 -->
            <button type="submit" class="btn btn-dark w-100">회원가입</button>
        </form>
        <div class="d-flex justify-content-center mt-3">
            <a href="../index.jsp" class="text-decoration-none text-muted">이전 페이지</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
