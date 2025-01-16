<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String nickname = (String) session.getAttribute("nickname");
    System.out.println("nick : " + nickname);
    boolean isLoggedIn = (nickname != null);
%>
<html>
<header>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="./user/css/common/header.css" rel="stylesheet" type="text/css">

    <nav class="navbar navbar-expand-lg bg-dark navbar-dark">
        <div class="container-fluid">
            <!-- 로고 -->
            <a class="navbar-brand fw-bold text-white" href="${pageContext.request.contextPath}/Controller?type=main" style="font-size: 1.8rem;">MUSINSA</a>

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
                                onclick="location.href='Controller?type=login';">로그인</button>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="d-flex gap-3 align-items-center user-header-menu">
                <%-- 좋아요 --%>
                <a href="#" class="text-decoration-none text-danger">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
                    </svg>
                    <span class="like_title">좋아요</span>
                </a>

                <%-- 알림 --%>
                <a href="#" class="text-decoration-none text-dark position-relative">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
                        <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2m.995-14.901a1 1 0 1 0-1.99 0A5 5 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901"/>
                    </svg>
                    <span>알림</span>
                    <span class="new_alert"></span>
                </a>

                <%-- 장바구니 --%>
                <a href="#" class="text-decoration-none text-dark position-relative">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket-fill" viewBox="0 0 16 16">
                        <path d="M5.071 1.243a.5.5 0 0 1 .858.514L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H15v5a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 6h1.717zM3.5 10.5a.5.5 0 1 0-1 0v3a.5.5 0 0 0 1 0zm2.5 0a.5.5 0 1 0-1 0v3a.5.5 0 0 0 1 0zm2.5 0a.5.5 0 1 0-1 0v3a.5.5 0 0 0 1 0zm2.5 0a.5.5 0 1 0-1 0v3a.5.5 0 0 0 1 0zm2.5 0a.5.5 0 1 0-1 0v3a.5.5 0 0 0 1 0z"/>
                    </svg>
                    <span>장바구니</span>
                    <span class="badge bg-primary rounded-pill cart_count">0</span>
                </a>

                <%-- 주문배송조회 --%>
                <a href="#" class="text-decoration-none text-dark">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-seam-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M15.528 2.973a.75.75 0 0 1 .472.696v8.662a.75.75 0 0 1-.472.696l-7.25 2.9a.75.75 0 0 1-.557 0l-7.25-2.9A.75.75 0 0 1 0 12.331V3.669a.75.75 0 0 1 .471-.696L7.443.184l.01-.003.268-.108a.75.75 0 0 1 .558 0l.269.108.01.003zM10.404 2 4.25 4.461 1.846 3.5 1 3.839v.4l6.5 2.6v7.922l.5.2.5-.2V6.84l6.5-2.6v-.4l-.846-.339L8 5.961 5.596 5l6.154-2.461z"/>
                    </svg>
                    <span>주문배송조회</span>
                </a>

                <%-- 마이페이지 --%>
                <a href="Controller?type=myPage" class="text-decoration-none text-dark">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                    </svg>
                    <span>마이페이지</span>
                </a>
            </div>
        </div>
    </div>
</header>
</html>
