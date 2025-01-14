<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Musinsa Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">
<div class="card shadow p-4" style="width: 22rem;">
    <h1 class="text-center mb-4">MUSINSA</h1>
    <form action="Controller?type=login" method="POST">
        <div class="mb-3">
            <input type="text" class="form-control" id="username" name="username" placeholder="아이디">
        </div>
        <div class="mb-3">
            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
        </div>
        <button type="submit" class="btn btn-dark w-100 mb-2">로그인</button>
        <button type="button" class="btn btn-warning w-100 text-dark">
            <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=274018667b4194489ad21f128fe91165&redirect_uri=http://localhost:8080/Controller?type=kakaoCallback"
               class="btn btn-warning">카카오로 로그인</a>
        </button>
    </form>
    <div class="d-flex justify-content-between mt-3">
        <a href="signup.jsp" class="text-decoration-none text-muted">회원가입</a>
        <a href="index.jsp" class="text-decoration-none text-muted">이전 페이지</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
