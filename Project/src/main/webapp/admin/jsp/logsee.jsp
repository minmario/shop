<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그 관리</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS, Icons, Google Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #0d6efd;
            --background-color: #f5f6fa;
            --header-bg: #23282c;
            --header-color: #ffffff;
            --sidebar-bg: #2f4050;
            --sidebar-color: #ffffff;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-color);
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: var(--header-bg);
            color: var(--header-color);
            position: fixed;
            top: 0; left: 0; right: 0;
            height: 60px;
            z-index: 1050;
            display: flex;
            align-items: center;
            padding: 0 20px;
        }
        .sidebar {
            background-color: var(--sidebar-bg);
            position: fixed;
            top: 60px;
            left: 0;
            bottom: 0;
            width: 240px;
            padding: 20px;
            overflow-y: auto;
        }
        .sidebar .nav-link {
            color: var(--sidebar-color);
            margin-bottom: 10px;
            font-size: 1rem;
            padding: 10px 15px;
            border-radius: 4px;
            display: block;
        }
        .sidebar .nav-link:hover,
        .sidebar .nav-link.active {
            background-color: var(--primary-color);
            color: #fff;
        }
        .main-content {
            margin-left: 260px;
            padding: 80px 30px 30px;
        }
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .card-header {
            background-color: var(--primary-color);
            color: #fff;
            padding: 15px 20px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }
        .table th, .table td {
            vertical-align: middle;
            text-align: center;
            padding: 8px 20px;
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp" />
<div class="sidebar">
    <nav class="nav flex-column">
        <a class="nav-link active" href="#log0">로그 목록 0 (삭제)</a>
        <!-- 필요 시 추가 로그 유형 링크 -->
    </nav>
</div>
<div class="main-content">
    <div class="card" id="log0">
        <div class="card-header">로그 목록 0 - 삭제</div>
        <div class="card-body">
            <div class="input-group mb-3">
                <span class="input-group-text"><i class="bi bi-search"></i></span>
                <select class="form-select" id="log0_name">
                    <option value="root_no">관리자번호</option>
                    <option value="seller_no">판매자번호</option>
                    <option value="cus_no">고객번호</option>
                    <option value="writer_type">작성자종류</option>
                    <option value="target">대상</option>
                    <option value="prev">이전</option>
                    <option value="current">현재</option>
                    <option value="log_date">로그일자</option>
                </select>
                <input type="text" class="form-control" placeholder="검색할 열 선택" id="log0_word">
                <button class="btn btn-outline-secondary" type="button" id="log0_search_btn">검색</button>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered" id="log0_table">
                    <thead class="table-light">
                    <tr>
                        <th>관리자번호</th>
                        <th>판매자번호</th>
                        <th>고객번호</th>
                        <th>작성자종류</th>
                        <th>대상</th>
                        <th>이전</th>
                        <th>현재</th>
                        <th>로그일자</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="log0l" items="${logList}">
                        <c:if test="${log0l.log_type eq 0}">
                            <tr>
                                <td>${log0l.root_no}</td>
                                <td>${log0l.seller_no}</td>
                                <td>${log0l.cus_no}</td>
                                <td>${log0l.writer_type}</td>
                                <td>${log0l.target}</td>
                                <td>${log0l.prev}</td>
                                <td>${log0l.current}</td>
                                <td>${log0l.log_date}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <button class="btn btn-outline-secondary btn-sm mt-3" onclick="location.href='Controller?type=logsee'">초기화</button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
  // 로그 검색 AJAX 로직 (기존 그대로)
</script>
</body>
</html>
