<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쇼핑몰 관리자 대시보드</title>
    <!-- Bootstrap CSS, Icons, Google Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #0d6efd;
            --sidebar-bg: #2f4050;
            --header-bg: #23282c;
            --header-color: #ffffff;
            --background-color: #f5f6fa;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-color);
            margin: 0;
            padding: 0;
        }
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 60px;
            background-color: var(--header-bg);
            color: var(--header-color);
            display: flex;
            align-items: center;
            padding: 0 20px;
            z-index: 1050;
        }
        .sidebar {
            position: fixed;
            top: 60px;
            left: 0;
            bottom: 0;
            width: 240px;
            background-color: var(--sidebar-bg);
            color: #fff;
            padding: 20px;
            overflow-y: auto;
        }
        .sidebar .nav-link {
            color: #fff;
            margin-bottom: 10px;
            padding: 10px 15px;
            border-radius: 4px;
            display: block;
        }
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            background-color: var(--primary-color);
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
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp" />
<div class="sidebar">
    <a href="#dashboard" class="nav-link active">대시보드</a>
    <a href="#active" class="nav-link">구매자 목록</a>
    <a href="#withdrawn" class="nav-link">탈퇴 목록</a>
    <a href="#stopped" class="nav-link">정지 목록</a>
</div>
<div class="main-content">
    <h1 class="mb-4" id="dashboard">대시보드</h1>
    <!-- 요약 카드 -->
    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card text-white bg-primary">
                <div class="card-body">
                    <h5 class="card-title">구매자 수</h5>
                    <p class="card-text display-6"><c:out value="${activeCount}" default="0"/></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-success">
                <div class="card-body">
                    <h5 class="card-title">탈퇴 수</h5>
                    <p class="card-text display-6"><c:out value="${withdrawnCount}" default="0"/></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-danger">
                <div class="card-body">
                    <h5 class="card-title">정지 수</h5>
                    <p class="card-text display-6"><c:out value="${stoppedCount}" default="0"/></p>
                </div>
            </div>
        </div>
    </div>
    <!-- 구매자, 탈퇴, 정지 목록 섹션은 기존 테이블 마크업을 카드로 감싸 동일한 스타일 적용 -->
    <!-- (테이블 및 검색바 마크업은 필요에 따라 동일하게 업데이트) -->
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
  // 기존 구매자 목록 관련 AJAX 로직 그대로 유지
</script>
</body>
</html>
