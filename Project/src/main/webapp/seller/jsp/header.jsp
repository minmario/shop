<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String nickname = (String) session.getAttribute("nickname");
    boolean isLoggedIn = (nickname != null);
%>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        /* 기본 스타일 */
        .navbar .nav-link {
            color: #000; /* 기본 텍스트 색상 */
            text-decoration: none;
            transition: all 0.2s ease-in-out; /* 부드러운 전환 효과 */
        }

        /* 선택된 메뉴 항목 스타일 */
         .nav-link.active {
            font-weight: bold; /* 굵은 글씨 */
            color: #007bff !important; /* 강조된 텍스트 색상 */
            background-color: rgba(0, 123, 255, 0.1); /* 배경색 강조 */
            border-radius: 5px; /* 둥근 모서리 */
        }

        /* hover 효과 */
        .navbar .nav-link:hover {
            color: #0056b3; /* 강조된 텍스트 색상 */
        }
    </style>
</head>
<body>
<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
    <div class="container-fluid">
        <!-- 로고 -->
        <a class="navbar-brand fw-bold text-white" href="./shop/seller/jsp/index.jsp" style="font-size: 1.8rem;">MUSINSA</a>
    </div>
</nav>

<!-- 메뉴 섹션 -->
<div class="index header d-flex align-items-center p-3 bg-light border-bottom">
    <!-- 왼쪽: 로그인 버튼 -->
    <div class="d-flex align-items-center">
        <c:choose>
            <c:when test="${isLoggedIn}">
                <span class="me-2">환영합니다, <strong>${nickname}님</strong></span>
                <button type="button" class="btn btn-outline-secondary"
                        onclick="location.href='Controller?type=logout';">로그아웃</button>
            </c:when>
            <c:otherwise>
                <button type="button" class="btn btn-outline-primary"
                        onclick="location.href='../../user/jsp/login/login.jsp';">로그인</button>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- 중앙: 메뉴 -->
    <div class="d-flex gap-3 align-items-center justify-content-center flex-grow-1">
        <a href="#" class="text-decoration-none nav-link" id="productManagement">상품/재고관리</a>
        <a href="#" class="text-decoration-none nav-link" id="orderManagement">주문/배송</a>
        <a href="#" class="text-decoration-none nav-link" id="inquiry">문의</a>
        <a href="#" class="text-decoration-none nav-link" id="salesManagement">매출/정산</a>
        <a href="#" class="text-decoration-none nav-link" id="couponManagement">쿠폰관리</a>
        <a href="#" class="text-decoration-none nav-link" id="brandManagement">브랜드관리</a>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        // 모든 네비게이션 링크 가져오기
        const navLinks = document.querySelectorAll(".nav-link");

        // 클릭 이벤트 추가
        navLinks.forEach(link => {
            link.addEventListener("click", function () {
                // 모든 링크에서 active 클래스 제거
                navLinks.forEach(nav => nav.classList.remove("active"));
                // 클릭된 링크에 active 클래스 추가
                this.classList.add("active");
            });
        });
    });
</script>
</body>
</html>