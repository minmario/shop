<%--
  Created by IntelliJ IDEA.
  User: gjcks
  Date: 2025-01-11
  Time: 오전 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String nickname = (String) session.getAttribute("nickname");
    boolean isLoggedIn = (nickname != null);
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
            <a class="navbar-brand fw-bold text-white" href="#" style="font-size: 1.8rem;">MUSINSA</a>

            <!-- 검색창 -->
            <form class="d-flex align-items-center" role="search">
                <input class="form-control me-2" type="search" placeholder="무신사 틱톡버스터 체험 🔥" aria-label="Search"
                       style="width: 300px; border-radius: 20px; padding: 0.5rem;">
                <i class="bi bi-camera text-white me-2" style="font-size: 1.5rem;"></i>
                <i class="bi bi-search text-white" style="font-size: 1.5rem;"></i>
            </form>

            <!-- 네비게이션 메뉴 -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-center">
                    <li class="nav-item">
                        <a class="nav-link text-success fw-bold" href="#">쿨탠다드</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger fw-bold" href="#">블록버스터</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-primary fw-bold" href="#">플레이어</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">랭킹</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">업데이트</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">코디</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">세일</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">스페셜</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">매거진</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">TV</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">이벤트</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">브랜드</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div>

        <div class="index header d-flex justify-content-between align-items-center p-3 bg-light border-bottom">

            <div>
                <c:choose>
                    <c:when test="${isLoggedIn}">
                        <span class="me-3">환영합니다, <strong>${nickname}님</strong></span>
                        <button type="button" class="btn btn-outline-secondary"
                                onclick="location.href='Controller?type=logout';">로그아웃</button>
                    </c:when>
                    <c:otherwise>
                        <button type="button" class="btn btn-outline-primary"
                                onclick="location.href='./user/jsp/login/login.jsp';">로그인</button>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="d-flex gap-3 align-items-center">
                <a href="#" class="text-decoration-none text-dark">바로접속 ON</a>
                <a href="./user/jsp/mypage/mypage.jsp" class="text-decoration-none text-dark">마이페이지</a>
                <a href="#" class="text-decoration-none text-dark">최근 본 상품</a>
                <a href="#" class="text-decoration-none text-danger">좋아요</a>
                <a href="#" class="text-decoration-none text-dark position-relative">
                    장바구니 <span class="badge bg-primary rounded-pill">0</span>
                </a>
                <a href="#" class="text-decoration-none text-dark">주문배송조회</a>
                <a href="#" class="text-decoration-none text-dark">고객센터</a>
            </div>
        </div>
    </div>
</header>
</html>
