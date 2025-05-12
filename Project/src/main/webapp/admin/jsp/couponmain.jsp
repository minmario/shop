<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쿠폰 관리</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts: Poppins -->
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
            display: flex;
            align-items: center;
        }
        .sidebar .nav-link i { margin-right: 8px; }
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
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
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
<!-- 공통 헤더 -->
<jsp:include page="layout/header.jsp" />

<!-- 좌측 사이드바 (쿠폰 관리 전용 메뉴 필요시 링크 추가) -->
<div class="sidebar">
    <nav class="nav flex-column">
        <a class="nav-link active" href="#couponSection">
            <i class="bi bi-ticket-perforated-fill"></i> 쿠폰 관리
        </a>
    </nav>
</div>

<!-- 메인 콘텐츠 영역 -->
<div class="main-content">
    <h2 class="mb-4">쿠폰 관리</h2>

    <div class="card">
        <div class="card-body">
            <!-- 검색 영역 -->
            <div class="input-group mb-3">
                <span class="input-group-text"><i class="bi bi-search"></i></span>
                <select class="form-select" id="coupon_name">
                    <option value="root_no">관리자번호</option>
                    <option value="category_no">카테고리번호</option>
                    <option value="seller_no">판매자번호</option>
                    <option value="grade_no">등급번호</option>
                    <option value="type">종류</option>
                    <option value="name">이름</option>
                    <option value="sale_per">할인율</option>
                    <option value="start_date">시작일자</option>
                    <option value="end_date">끝일자</option>
                    <option value="status">상태</option>
                </select>
                <input type="text" class="form-control" placeholder="검색할 열 선택" id="coupon_word">
                <button class="btn btn-outline-secondary btn-sm" id="coupon_search_btn">검색</button>
            </div>
            <!-- 쿠폰 목록 테이블 -->
            <div class="table-responsive">
                <table class="table table-bordered" id="coupon_table">
                    <thead class="table-light">
                    <tr>
                        <th>관리자번호</th>
                        <th>카테고리번호</th>
                        <th>판매자번호</th>
                        <th>등급번호</th>
                        <th>종류</th>
                        <th>이름</th>
                        <th>할인율</th>
                        <th>할인금액</th>
                        <th>시작일자</th>
                        <th>끝일자</th>
                        <th>상태</th>
                        <th>액션</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="coul" items="${couponList}">
                        <tr id="row-${coul.id}">
                            <td>${coul.root_no}</td>
                            <td>${coul.category_no}</td>
                            <td>${coul.seller_no}</td>
                            <td>${coul.grade_no}</td>
                            <td>${coul.type}</td>
                            <td>${coul.name}</td>
                            <td>${coul.sale_per}</td>
                            <td>${coul.sale_price}</td>
                            <td>${coul.start_date}</td>
                            <td>${coul.end_date}</td>
                            <td>${coul.status}</td>
                            <td>
                                <button class="btn btn-outline-secondary btn-sm">수정</button>
                                <button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#deleteCouponModal"
                                        onclick="setCouponId('${coul.id}')">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <button class="btn btn-outline-secondary btn-sm mt-3" onclick="location.href='Controller?type=couponmain'">초기화</button>
        </div>
    </div>
    <!-- (쿠폰 추가/삭제 모달 등 필요한 모달은 기존 마크업 그대로 유지) -->
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
  // 쿠폰 검색 AJAX (기존 기능 그대로)
  $("#coupon_search_btn").click(function () {
    let searchType = $("#coupon_name").val();
    let searchValue = $("#coupon_word").val();
    let param = "type=searchCoupon&searchType=" + encodeURIComponent(searchType) +
        "&searchValue=" + encodeURIComponent(searchValue);
    $.ajax({
      url: "Controller",
      type: "POST",
      data: param
    }).done(function (data) {
      $("#coupon_table tbody").html(data);
    });
  });
  function setCouponId(couponId) {
    console.log("쿠폰 삭제를 위한 ID:", couponId);
    // 추가 AJAX 로직 구현 가능
  }
</script>
</body>
</html>
