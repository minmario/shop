<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String nickname = (String) session.getAttribute("nickname");
%>
<style>
    /* 수정된 헤더 스타일 */
    .header {
        background-color: var(--header-bg, #23282c);
        color: var(--header-color, #ffffff);
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        height: 60px;
        display: flex;
        align-items: center;
        flex-wrap: nowrap;  /* 항목 줄바꿈 방지 */
        padding: 0 20px;
        z-index: 1050;
    }
    .header .logo {
        font-size: 1.8rem;
        font-weight: 600;
        margin-right: 2rem;
    }
    /* nav를 flex 컨테이너로 설정 */
    .header nav {
        display: flex;
        align-items: center;
        flex-wrap: nowrap;
    }
    .header nav a {
        color: var(--header-color, #ffffff);
        margin-right: 1.5rem;
        text-decoration: none;
        font-weight: 500;
        white-space: nowrap; /* 텍스트 줄바꿈 방지 */
    }
    .header nav a:hover,
    .header nav a.active {
        color: var(--primary-color, #0d6efd);
    }
    .header .auth {
        margin-left: auto;
    }
</style>
<header class="header">
    <div class="logo">
        <a href="${pageContext.request.contextPath}/shop/admin/jsp/index.jsp" style="color:inherit; text-decoration:none;">
            MUSINSA
        </a>
    </div>
    <%
        String currentType = request.getParameter("type");
        request.setAttribute("currentType", currentType);
    %>
    <nav>
        <a href="${pageContext.request.contextPath}/Controller?type=adminindex"
           class="nav-link ${currentType == 'adminindex' ? 'active' : ''}">대시보드</a>
        <a href="${pageContext.request.contextPath}/Controller?type=sellermain"
           class="nav-link ${currentType == 'sellermain' ? 'active' : ''}">판매자관리</a>
        <a href="${pageContext.request.contextPath}/Controller?type=customermain"
           class="nav-link ${currentType == 'customermain' ? 'active' : ''}">구매자관리</a>
        <a href="${pageContext.request.contextPath}/Controller?type=categorymain"
           class="nav-link ${currentType == 'categorymain' ? 'active' : ''}">카테고리관리</a>
        <a href="${pageContext.request.contextPath}/Controller?type=boardmain"
           class="nav-link ${currentType == 'boardmain' ? 'active' : ''}">게시판관리</a>
        <a href="${pageContext.request.contextPath}/Controller?type=couponmain"
           class="nav-link ${currentType == 'couponmain' ? 'active' : ''}">쿠폰관리</a>
        <a href="${pageContext.request.contextPath}/Controller?type=logsee"
           class="nav-link ${currentType == 'logsee' ? 'active' : ''}">로그확인</a>
    </nav>
    <div class="auth">
        <c:choose>
            <c:when test="${not empty sessionScope.name}">
                <span>환영합니다, <strong>${sessionScope.name}님</strong></span>
                <button type="button" class="btn btn-outline-light btn-sm ms-2" onclick="location.href='Controller?type=adminlogout';">로그아웃</button>
            </c:when>
            <c:otherwise>
                <button type="button" class="btn btn-outline-light btn-sm" onclick="location.href='Controller?type=adminlogin';">로그인</button>
            </c:otherwise>
        </c:choose>
    </div>
</header>
