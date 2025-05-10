<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>판매자 관리</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS, Icons, Google Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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
            font-size: 1.1rem;
            padding: 15px 20px;
        }
        .input-group .form-select,
        .input-group .form-control {
            border: 1px solid #ced4da;
        }
        .table th, .table td {
            vertical-align: middle;
            text-align: center;
            padding: 8px 20px;
        }
    </style>
</head>
<body>
<!-- 상단 헤더 (공통 헤더 include) -->
<jsp:include page="layout/header.jsp" />

<!-- 좌측 사이드바 -->
<div class="sidebar">
    <nav class="nav flex-column">
        <!-- 판매자 관리 전용 메뉴 -->
        <a class="nav-link active" href="#seller1">승인대기</a>
        <a class="nav-link" href="#seller0">현재 판매자</a>
        <!-- 필요시 추가 모달 링크 -->
    </nav>
</div>

<div class="main-content">
    <h2 class="mb-4">판매자 관리</h2>

    <!-- 승인대기 판매자 섹션 -->
    <div class="card mb-4" id="seller1">
        <div class="card-header">승인대기</div>
        <div class="card-body">
            <div class="input-group mb-3">
                <span class="input-group-text"><i class="bi bi-search"></i></span>
                <select class="form-select" id="seller1_name">
                    <c:forEach var="name" items="${sellerName}">
                        <c:if test="${name ne 'id' and name ne 'seller_pw' and name ne 'is_del' and name ne 'seller_icon'}">
                            <option class="column-name" value="${name}">${name}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <input type="text" class="form-control" placeholder="검색할 열 선택" id="seller1_word">
                <button class="btn btn-outline-secondary" type="button" id="seller1_search_btn">검색</button>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered" id="seller1_table">
                    <thead class="table-light">
                    <tr>
                        <c:forEach var="name" items="${sellerName}">
                            <c:if test="${name ne 'id' and name ne 'seller_pw' and name ne 'is_del' and name ne 'seller_icon'}">
                                <th class="column-name">${name}</th>
                            </c:if>
                        </c:forEach>
                        <th>액션</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="sl1" items="${sellerList}">
                        <c:if test="${sl1.active eq 1}">
                            <tr id="row-${sl1.id}">
                                <td>${sl1.seller_id}</td>
                                <td>${sl1.name}</td>
                                <td>${sl1.phone}</td>
                                <td>${sl1.email}</td>
                                <td>${sl1.desc}</td>
                                <td>${sl1.courier}</td>
                                <td>${sl1.address}</td>
                                <td>${sl1.active}</td>
                                <td>
                                    <button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#rejectSellerModal"
                                            onclick="setSellerId('${sl1.id}')">거절</button>
                                    <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#admitSellerModal"
                                            onclick="setSellerId('${sl1.id}')">승인</button>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- 현재 판매자 섹션 -->
    <div class="card mb-4" id="seller0">
        <div class="card-header">현재 판매자</div>
        <div class="card-body">
            <div class="input-group mb-3">
                <span class="input-group-text"><i class="bi bi-search"></i></span>
                <select class="form-select" id="seller0_name">
                    <c:forEach var="name" items="${sellerName}">
                        <c:if test="${name ne 'id' and name ne 'seller_pw' and name ne 'is_del' and name ne 'seller_icon'}">
                            <option class="column-name" value="${name}">${name}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <input type="text" class="form-control" placeholder="검색할 열 선택" id="seller0_word">
                <button class="btn btn-outline-secondary" type="button" id="seller0_search_btn">검색</button>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered" id="seller0_table">
                    <thead class="table-light">
                    <tr>
                        <c:forEach var="name" items="${sellerName}">
                            <c:if test="${name ne 'id' and name ne 'seller_pw' and name ne 'is_del' and name ne 'seller_icon'}">
                                <th class="column-name">${name}</th>
                            </c:if>
                        </c:forEach>
                        <th>액션</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="sl0" items="${sellerList}">
                        <c:if test="${sl0.active eq 0}">
                            <tr id="row-${sl0.id}">
                                <td>${sl0.seller_id}</td>
                                <td>${sl0.name}</td>
                                <td>${sl0.phone}</td>
                                <td>${sl0.email}</td>
                                <td>${sl0.desc}</td>
                                <td>${sl0.courier}</td>
                                <td>${sl0.address}</td>
                                <td>${sl0.active}</td>
                                <td>
                                    <button class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#stopSellerModal"
                                            onclick="setSellerId('${sl0.id}')">판매정지</button>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
  // 기존 판매자 관련 AJAX 및 setSellerId 함수 등은 그대로 유지
</script>
</body>
</html>
