<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2025-01-14
  Time: 오후 2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    session.setAttribute("seller_no","1");
%>


</style>

<html>
<header>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <%--    <link rel="stylesheet" href="css/styles.css">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <nav class="navbar navbar-expand-lg bg-dark navbar-dark">
        <div class="container-fluid">
            <!-- 로고 -->
            <a class="navbar-brand fw-bold text-white" href="./shop/seller/jsp/index.jsp" style="font-size: 1.8rem;">MUSINSA Partner Center</a>

            <!-- 검색창 -->


            <!-- 네비게이션 메뉴 -->

        </div>
    </nav>
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
                            onclick="location.href='user/jsp/login/login.jsp';">로그인</button>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- 중앙: 상품 관리 ~ 브랜드 관리-->
        <div class="d-flex gap-3 align-items-center justify-content-center flex-grow-1">
            <a href="Controller?type=productList" id="nav_product" class="text-decoration-none text-dark">상품 관리</a>
            <a href="Controller?type=orderList" class="text-decoration-none text-dark">주문/배송</a>
            <a href="Controller?type=question" class="text-decoration-none text-dark">문의</a>
            <a href="#" class="text-decoration-none text-dark">정산</a>

            <a href="#" class="text-decoration-none text-dark">쿠폰관리</a>
            <a href="#" class="text-decoration-none text-dark">브랜드 관리</a>
        </div>
    </div>
</header>
</html>
