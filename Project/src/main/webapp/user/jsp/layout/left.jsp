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
            <a href="#" id="searchBtn" class="nav-link text-dark d-flex align-items-center">
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



<!-- 검색 패널 (기본적으로 숨김) -->
<div id="searchPanel" class="search-panel">
    <div class="search-header">
        <input type="text" id="searchInput" placeholder="검색" onkeyup="searchUsers()">
        <button id="closeSearch" onclick="closeSearchPanel()">✕</button>
    </div>
    <ul id="searchResults"></ul>
</div>


<!-- 스타일 -->
<style>
    .search-panel {
        position: fixed;
        top: 0;
        left: 60px; /* LEFT 메뉴 옆 */
        width: 350px;
        height: 100%;
        background: white;
        box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        display: none;
        flex-direction: column;
        padding: 15px;
    }
    .search-header {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 15px;
    }
    #searchInput {
        flex: 1;
        padding: 8px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    #searchResults {
        list-style: none;
        padding: 0;
        max-height: 500px;
        overflow-y: auto;
    }
    #searchResults li {
        display: flex;
        align-items: center;
        padding: 8px;
        cursor: pointer;
        transition: background 0.2s;
    }
    #searchResults li:hover {
        background: #f0f0f0;
    }
    #searchResults img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        margin-right: 10px;
    }
    #closeSearch {
        background: none;
        border: none;
        font-size: 18px;
        cursor: pointer;
    }
</style>

<!-- JavaScript -->
<script>
  document.getElementById("searchBtn").addEventListener("click", function() {
    document.getElementById("searchPanel").style.display = "flex";
    document.getElementById("searchInput").focus();
  });

  function closeSearchPanel() {
    document.getElementById("searchPanel").style.display = "none";
  }

  function searchUsers() {
    let query = document.getElementById("searchInput").value.trim();
    if (query.length === 0) {
      document.getElementById("searchResults").innerHTML = "";
      return;
    }

    fetch(`/Controller?type=searchUsers&query=`+query+``)
        .then(response => response.json())
        .then(data => {
          let results = document.getElementById("searchResults");
          results.innerHTML = "";
          data.forEach(user => {
            let li = document.createElement("li");
            li.innerHTML = `
                        <img src="${user.profileImage}" alt="Profile">
                        <div>
                            <strong>${user.username}</strong><br>
                            <span>${user.followerCount}명 팔로워</span>
                        </div>
                    `;
            li.addEventListener("click", () => window.location.href = "/profile?user=" + user.username);
            results.appendChild(li);
          });
        })
        .catch(error => console.error("검색 오류:", error));
  }

  // ESC 키로 닫기
  document.addEventListener("keydown", function(event) {
    if (event.key === "Escape") closeSearchPanel();
  });
</script>