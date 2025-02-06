<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="card shadow p-4 w-100" style="max-width: 500px;">
        <!-- MUSINSA 로고 -->
        <h1 class="text-center fw-bold mb-4">MUSINSA</h1>


        <form action="${pageContext.request.contextPath}/Controller?type=signup" method="POST">

            <div class="mb-3">
                <label for="cus_id" class="form-label">아이디</label>
                <input type="text" class="form-control" id="cus_id" name="cus_id" placeholder="아이디를 입력하세요" maxlength="30" required>
            </div>


            <div class="mb-3">
                <label for="cus_pw" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="cus_pw" name="cus_pw" placeholder="비밀번호를 입력하세요" maxlength="30" required>
            </div>


            <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요" maxlength="50" required>
            </div>


            <div class="mb-3">
                <label for="nickname" class="form-label">닉네임</label>
                <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력하세요" maxlength="50">
            </div>


            <div class="mb-3">
                <label class="form-label">성별</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="gender_m" value="M" required>
                    <label class="form-check-label" for="gender_m">남성</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="gender_w" value="W" required>
                    <label class="form-check-label" for="gender_w">여성</label>
                </div>
            </div>


            <div class="mb-3">
                <label for="birth_date" class="form-label">생년월일</label>
                <input type="date" class="form-control" id="birth_date" name="birth_date">
            </div>


            <div class="mb-3">
                <label for="phone" class="form-label">전화번호</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력하세요" maxlength="30">
            </div>


            <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" maxlength="100" required>
            </div>


            <div class="mb-3">
                <label for="height" class="form-label">키</label>
                <input type="number" class="form-control" id="height" name="height" placeholder="키(cm)를 입력하세요">
            </div>


            <div class="mb-3">
                <label for="weight" class="form-label">몸무게</label>
                <input type="number" class="form-control" id="weight" name="weight" placeholder="몸무게(kg)를 입력하세요">
            </div>


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
