<%--
  Created by IntelliJ IDEA.
  User: gjcks
  Date: 2025-01-22
  Time: 오후 8:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="d-flex flex-column flex-shrink-0 p-3">
    <h5 class="text-center mb-4">로고</h5>
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="/Controller?type=snap" class="nav-link text-dark d-flex align-items-center">
                <i class="bi bi-house fs-4 me-2"></i>
                <span>홈</span>
            </a>
        </li>
        <li>
            <a href="#" class="nav-link text-dark d-flex align-items-center">
                <i class="bi bi-search fs-4 me-2"></i>
                <span>검색</span>
            </a>
        </li>
        <%--                    <li>--%>
        <%--                        <a href="#" class="nav-link text-dark d-flex align-items-center">--%>
        <%--                            <i class="bi bi-compass fs-4 me-2"></i>--%>
        <%--                            <span>탐색 탭</span>--%>
        <%--                        </a>--%>
        <%--                    </li>--%>
        <%--                    <li>--%>
        <%--                        <a href="#" class="nav-link text-dark d-flex align-items-center">--%>
        <%--                            <i class="bi bi-camera-reels fs-4 me-2"></i>--%>
        <%--                            <span>릴스</span>--%>
        <%--                        </a>--%>
        <%--                    </li>--%>
        <li>
            <a href="/Controller?type=dm" class="nav-link text-dark d-flex align-items-center">
                <i class="bi bi-chat-dots fs-4 me-2"></i>
                <span>메시지</span>
            </a>
        </li>
        <li>
            <a href="#" class="nav-link text-dark d-flex align-items-center">
                <i class="bi bi-bell fs-4 me-2"></i>
                <span>알림</span>
            </a>
        </li>
        <li>
            <a href="#" class="nav-link text-dark d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#snapModal">
                <i class="bi bi-plus-circle fs-4 me-2"></i>
                <span>만들기</span>
            </a>
        </li>
        <li>
            <a href="/Controller?type=profile&cus_no=${sessionScope.cus_id}" class="nav-link text-dark d-flex align-items-center">
                <i class="bi bi-person-circle fs-4 me-2"></i>
                <span>프로필</span>
            </a>
        </li>
    </ul>
</div>