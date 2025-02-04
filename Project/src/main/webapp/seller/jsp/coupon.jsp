<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    /* 쿠폰 관리 페이지 스타일 */
    .header-spacing {
      margin-top: 30px;
    }

    .section-title {
      font-size: 24px;
      font-weight: bold;
    }

    .d-flex-between {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .coupon-btn-container {
      display: flex;
      justify-content: flex-end;
    }

    .table-container {
      margin-top: 30px;
    }
    .search-container select,
    .search-container input,
    .search-container button {
      height: 40px; /* 콤보박스와 버튼 높이를 동일하게 */
      margin-right: 10px; /* 필드 간 간격 */
      padding: 6px 12px; /* 내부 여백 */
      font-size: 14px; /* 글자 크기 조정 */
      box-sizing: border-box; /* 크기 계산에 패딩 포함 */
    }

    .search-container {
      display: flex;
      align-items: center;
      gap: 10px; /* 요소 간 간격 */
      margin-bottom: 10px; /* 기존 20px에서 10px로 줄임 */
    }
    .search-container .form-select,
    .search-container .form-control,
    .search-container .btn {
      width: auto; /* 자동 너비 */
      flex-shrink: 0; /* 요소 크기 고정 */
    }

    .search-input {
      width: 250px !important;
      margin-right: 10px;
    }

    .table {
      width: 90%;
      margin: 0 auto; /* 테이블을 중앙 정렬 */
      table-layout: fixed; /* 열 너비를 균등하게 분배 */
    }

    .table-bordered {
      border: 1px solid #dee2e6;
    }

    .table-light {
      background-color: #f8f9fa;
    }
    .table th, .table td {
      padding: 8px; /* 셀의 패딩을 줄여서 테이블 크기 축소 */
      font-size: 14px; /* 글자 크기를 줄여 테이블 압축 */
      text-align: center;        /* 수평 정렬 */
      vertical-align: middle;    /* 수직 정렬 */
      overflow: hidden; /* 내용이 길 경우 숨김 */
      text-overflow: ellipsis; /* 긴 내용은 '...'으로 표시 */
      white-space: nowrap; /* 줄바꿈 방지 */
    }
    .table th:nth-child(1), .table td:nth-child(1) {
      width: 4%; /* 번호 열 (작게 설정) */
    }
    .table th:nth-child(2), .table td:nth-child(2), /* 쿠폰 이름 */
    .table th:nth-child(3), .table td:nth-child(3), /* 발급일자 */
    .table th:nth-child(4), .table td:nth-child(4), /* 만료일자 */
    .table th:nth-child(5), .table td:nth-child(5), /* 할인율 */
    .table th:nth-child(6), .table td:nth-child(6), /* 등급 */
    .table th:nth-child(7), .table td:nth-child(7) { /* 카테고리 */
      width: 14%;
    }
    .table th:nth-child(8), .table td:nth-child(8) {
      width: 12%; /* 수정/삭제 버튼이 있는 열 (충분히 넓게 설정) */
    }
    .table td input, .table td select {
      text-align: center;        /* 수평 정렬 */
      vertical-align: middle;    /* 수직 정렬 */
      font-size: 12px; /* 입력 필드의 글자 크기 축소 */
      width: 100%;               /* 입력 필드가 셀에 꽉 차도록 설정 */
      box-sizing: border-box;    /* 셀의 여백이나 패딩을 고려하여 입력 필드 크기 조정 */
      margin: 0 auto;            /* 자동 마진 추가 (세로 중앙 정렬을 위한 추가) */
      padding: 4px; /* 필드 안쪽 여백 조정 */
    }
    .table td:last-child {
      white-space: nowrap; /* 버튼들이 한 줄로 유지되도록 설정 */
    }
    .text-center {
      text-align: center;        /* 수평 정렬 */
      vertical-align: middle;    /* 수직 정렬 */
    }
    .page-item .page-link {
      cursor: pointer;
    }

    /* 모달 */
    .modal-dialog-centered {
      max-width: 600px;
    }

    .modal-header {
      background-color: #f8f9fa;
    }

    .form-label {
      font-weight: bold;
    }

    .btn, .form-control, .form-select {
      height: 40px; /* 높이 통일 */
      font-size: 14px; /* 글자 크기 통일 */
      margin-bottom: 10px;
    }

    .btn-primary {
      background-color: #007bff;
    }

    .btn-close {
      background: none;
      border: none;
    }
    .table-container input[type="text"],
    .table-container input[type="number"],
    .table-container input[type="date"] {
      text-align: center; /* 수평 중앙 정렬 */
      vertical-align: middle; /* 수직 중앙 정렬 */
      padding: 0; /* 불필요한 여백 제거 */
      height: 30px; /* 텍스트 필드의 높이를 적당하게 설정 */
    }
    .search-container input[type="text"] {
      height: 40px; /* 콤보박스와 버튼과 동일한 높이 */
      padding: 6px 12px; /* 내부 여백 조정 */
      font-size: 14px; /* 글자 크기 동일 */
      box-sizing: border-box; /* 크기 계산 정확하게 */
    }
  </style>
</head>
<body>
<%@ include file="header.jsp" %>
<!-- 네비게이션 바 -->

<div class="container header-spacing">
  <h2 class="section-title">쿠폰 관리</h2>



  <div class="table-container">

    <div class="search-container" style="display: flex; justify-content: space-between; align-items: center;">
      <!-- 왼쪽: 검색 필드, 콤보박스, 검색 버튼 -->
      <div style="display: flex; align-items: center; gap: 10px;">
        <select class="form-select search-criteria" aria-label="검색 기준" style="width: 150px;">
          <option value="all">전체</option>
          <option value="name">쿠폰 이름</option>
          <option value="number">번호</option>
          <option value="discount">할인율</option>
          <option value="category">카테고리</option>
        </select>

        <input type="text" class="form-control search-input" placeholder="검색어를 입력하세요" aria-label="검색어">

        <select class="form-select search-category" style="display: none; width: 150px;">
          <option value="all">전체</option>
          <option value="outer">아우터</option>
          <option value="top">상의</option>
          <option value="pants">바지</option>
          <option value="dress_skirt">원피스/스커트</option>
        </select>

        <button type="button" class="btn btn-outline-secondary search-button">검색</button>
      </div>

      <!-- 오른쪽: 신규 쿠폰 발급 버튼 -->
      <div>
        <button type="button" class="btn btn-primary btn-new" data-bs-toggle="modal" data-bs-target="#newCouponModal">
          신규 쿠폰 발급
        </button>
      </div>
    </div>

    <table class="table table-bordered" id="table1">
      <thead class="table-light">
      <tr>
        <th>번호</th>
        <th>쿠폰 이름</th>
        <th>발급일</th>
        <th>만료일</th>
        <th>할인율</th>
        <th>등급</th>
        <th>카테고리</th>
        <th>관리</th>
      </tr>
      </thead>
      <tbody id="couponTableBody">
      <c:forEach var="coupon" items="${coupons}" varStatus="status">
        <tr data-id="${coupon.id}">
          <td>${coupon.id}</td>
          <td><input type="text" class="form-control text-center" id="name-${coupon.id}" value="${coupon.name}" disabled></td>
          <td><input type="date" class="form-control text-center" id="start-${coupon.id}" value="${coupon.start_date}" disabled></td>
          <td><input type="date" class="form-control text-center" id="end-${coupon.id}" value="${coupon.end_date}" disabled></td>
          <td><input type="number" class="form-control text-center" id="discount-${coupon.id}" value="${coupon.sale_per}" disabled></td>
          <td><input type="number" class="form-control text-center" id="grade-${coupon.id}" value="${coupon.grade_no}" disabled></td>
          <td><input type="text" class="form-control text-center" id="category-${coupon.id}" value="${coupon.category_no}" disabled></td>
          <td>
            <button class="btn btn-warning btn-sm edit-button" data-id="${coupon.id}">수정</button>
            <button class="btn btn-primary btn-sm save-button" data-id="${coupon.id}" style="display: none;">저장</button>
            <button class="btn btn-danger btn-sm delete-button" data-id="${coupon.id}">삭제</button>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>

    <nav>
      <ul class="pagination">
        <li class="page-item"><a class="page-link" href="#">이전</a></li>
        <li class="page-item"><a class="page-link" href="#">다음</a></li>
      </ul>
    </nav>
  </div>

  <!-- 신규 쿠폰 발급 모달 -->
  <div class="modal fade" id="newCouponModal" tabindex="-1" aria-labelledby="newCouponModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="newCouponModalLabel">신규 쿠폰 발급</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form>
            <div class="mb-3">
              <label for="couponName" class="form-label">쿠폰 이름</label>
              <input type="text" class="form-control" id="couponName" required>
            </div>
            <div class="mb-3">
              <label for="validityStartDate" class="form-label">쿠폰 발급일자</label>
              <input type="date" class="form-control" id="validityStartDate" required>
            </div>
            <div class="mb-3">
              <label for="validityEndDate" class="form-label">쿠폰 만료일자</label>
              <input type="date" class="form-control" id="validityEndDate" required>
            </div>
            <div class="mb-3">
              <label for="discount" class="form-label">할인율 (%)</label>
              <input type="number" class="form-control" id="discount" required>
            </div>
            <div class="mb-3">
              <label for="category" class="form-label">카테고리</label>
              <select class="form-select" id="category" required>
                <option value="" disabled selected>카테고리를 선택하세요</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="remaining" class="form-label">등급</label>
              <input type="number" class="form-control" id="remaining" required>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary" id="addCouponButton">발급</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 만료된 쿠폰 -->
  <div class="table-container">
    <h2 class="section-title">만료된 쿠폰</h2>
    <table class="table table-bordered">
      <thead class="table-light">
      <tr>
        <th>번호</th>
        <th>쿠폰 이름</th>
        <th>쿠폰 발급일자</th>
        <th>쿠폰 만료일자</th>
        <th>할인율</th>
        <th>등급</th>
        <th>카테고리</th>
      </tr>
      </thead>
      <tbody id="EndcouponTableBody">
      <c:choose>
        <c:when test="${not empty coupons}">
          <c:forEach var="expiredCoupons" items="${expiredCoupons}" varStatus="status">
            <tr>
              <td>${expiredCoupons.id}</td> <!-- 번호 -->
              <td>${expiredCoupons.name}</td> <!-- 쿠폰 이름 -->
              <td>${expiredCoupons.start_date}</td> <!-- 발급일자 -->
              <td>${expiredCoupons.end_date}</td> <!-- 만료일자 -->
              <td>${expiredCoupons.sale_per}%</td> <!-- 할인율 -->
              <td>${expiredCoupons.grade_no}</td> <!-- 등급 -->
              <td>${expiredCoupons.category_no}</td> <!-- 카테고리 -->
            </tr>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <tr>
            <td colspan="7">사용 가능한 쿠폰이 없습니다.</td>
          </tr>
        </c:otherwise>
      </c:choose>
      </tbody>
    </table>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" crossorigin="anonymous"></script>

<script>
  document.querySelector(".search-criteria").addEventListener("change", function () {
    const criteria = this.value;

    // 입력 필드 전환
    if (criteria === "category") {
      document.querySelector(".search-input").style.display = "none"; // 텍스트 입력 숨김
      document.querySelector(".search-category").style.display = "block"; // 카테고리 선택 표시
    } else {
      document.querySelector(".search-input").style.display = "block"; // 텍스트 입력 표시
      document.querySelector(".search-category").style.display = "none"; // 카테고리 숨김
    }
  });

  document.querySelector(".search-button").addEventListener("click", function () {
    const criteria = document.querySelector(".search-criteria").value; // 선택된 검색 기준
    const rows = document.querySelectorAll("#couponTableBody tr"); // 쿠폰 테이블의 모든 행

    // 검색 기준에 따른 필터링
    let keyword = "";
    if (criteria === "all") {
      // 전체 검색 시 모든 행 표시
      rows.forEach(row => row.style.display = "");
      return;
    } else if (criteria === "category") {
      keyword = document.querySelector(".search-category").value.toLowerCase(); // 카테고리 드롭다운 값
      if (keyword === "all") {
        rows.forEach(row => row.style.display = ""); // 카테고리 전체 선택 시 모든 행 표시
        return;
      }
    } else {
      keyword = document.querySelector(".search-input").value.toLowerCase(); // 텍스트 입력 값
    }


    rows.forEach(row => {
      let cellValue = "";
      switch (criteria) {
        case "name": // 쿠폰 이름
          cellValue = row.children[1].querySelector("input").value.toLowerCase();
          break;
        case "number": // 번호
          cellValue = row.children[0].textContent.trim();
          break;
        case "discount": // 할인율
          cellValue = row.children[4].querySelector("input").value.toLowerCase();
          break;
        case "category": // 카테고리
          cellValue = row.children[6].querySelector("input").value.toLowerCase(); // 카테고리 검색
          break;
      }

      if (cellValue.includes(keyword)) {
        row.style.display = ""; // 행 표시
      } else {
        row.style.display = "none"; // 행 숨김
      }
    });
  });

  // 신규 쿠폰 발급 버튼 클릭 시 AJAX 요청
  $("#addCouponButton").on("click", function () {
    const name = $("#couponName").val();
    const start_date = $("#validityStartDate").val();
    const end_date = $("#validityEndDate").val();
    const sale_per = $("#discount").val();
    const category_no = $("#category").val();
    const grade_no = $("#remaining").val();

    // 입력값 검증
    if (!name || !start_date || !end_date || !sale_per || !category_no || !grade_no) {
      alert("모든 필드를 채워주세요.");
      return;
    }

    if (new Date(start_date) > new Date(end_date)) {
      alert("발급일자와 만료일자를 다시 확인해주세요.");
      return;
    }

    if (sale_per < 0 || sale_per > 99) {
      alert("할인율을 0~99 사이로 입력해주세요.");
      return;
    }

    // AJAX 요청으로 서버에 데이터 전송
    $.ajax({
      url: "/shop/Controller?type=insertCoupon",
      type: "POST",
      data: {
        name: name,
        start_date: start_date,
        end_date: end_date,
        sale_per: sale_per,
        category_no: category_no,
        grade_no: grade_no
      },
      success: function (response) {
        alert("쿠폰이 정상적으로 발급되었습니다.");
        $("#newCouponModal").modal("hide");  // 모달 닫기

        // 테이블에 새 쿠폰 추가
        const newRow = `
                <tr>
                    <td>신규</td>
                    <td><input type="text" class="form-control text-center" value= "${coupon.name}" disabled></td>
                    <td><input type="date" class="form-control text-center" value="${coupon.start_date}" disabled></td>
                    <td><input type="date" class="form-control text-center" value="${coupon.end_date}" disabled></td>
                    <td><input type="number" class="form-control text-center" value="${coupon.sale_per}" disabled></td>
                    <td><input type="number" class="form-control text-center" value="${coupon.grade_no}" disabled></td>
                    <td><input type="text" class="form-control text-center" value="${coupon.category_no}" disabled></td>
                    <td>
                        <button class="btn btn-warning btn-sm edit-button">수정</button>
                        <button class="btn btn-primary btn-sm save-button" style="display: none;">asd저장</button>
                        <button class="btn btn-danger btn-sm delete-button">삭제</button>
                    </td>
                </tr>`;

        $("#couponTableBody").append(newRow); // 테이블에 추가
        location.reload(); // 테이블에 추가

      },
      error: function () {
        alert("쿠폰 발급 중 오류가 발생했습니다.");
      }
    });


  // 모달 닫기
    $('#newCouponModal').modal('hide');

    // 모달 초기화 (입력된 값 초기화)
    document.getElementById("couponName").value = '';
    document.getElementById("validityStartDate").value = '';
    document.getElementById("validityEndDate").value = '';
    document.getElementById("discount").value = '';
    document.getElementById("category").value = '';
    document.getElementById("remaining").value = '';
  });

  // 테이블에서 쿠폰 수정, 저장, 삭제 버튼 기능 추가
  $(document).on('click', '.edit-button', function() {
    const row = $(this).closest('tr');
    row.find("input").prop("disabled", false);
    row.find(".edit-button").hide();
    row.find(".save-button").show();
  });

  $(document).on('click', '.save-button', function() {
    const row = $(this).closest('tr');
    row.find("input").prop("disabled", true);
    row.find(".save-button").hide();
    row.find(".edit-button").show();
  });

  $(document).on('click', '.delete-button', function() {
    $(this).closest('tr').remove();
  });
  $(document).ready(function () {

    // 수정 버튼 클릭 시
    $(".edit-button").on("click", function () {
      const couponId = $(this).attr("data-id") || $(this).data("id");
      const couponIdString = String(couponId).trim();
      console.log("couponIdString:", couponIdString, "Length:", couponIdString.length);
      console.log("data-id 값:", $(this).attr("data-id"));
      console.log("data() 값:", $(this).data("id"));
      console.log(`#name-`+ couponIdString);

      $(`#name-`+couponIdString,`#start-`+couponIdString, `#end-`+couponIdString, `#discount-`+couponIdString, `#grade-`+couponIdString, `#category-`+couponIdString).prop("disabled", false);
      $(this).hide();
      $(`.save-button[data-id='${couponId}']`).show();
    });

    // 저장 버튼 클릭 시 (AJAX 요청으로 수정된 데이터 전송)
    $(".save-button").on("click", function () {
      const couponId = $(this).data("id");
      const couponIdString = String(couponId).trim();
      console.log(couponId);
      const name = $(`#name-`+couponIdString).val();
      console.log(name);
      const start = $(`#start-`+couponIdString).val();
      const end = $(`#end-`+couponIdString).val();
      const discount = $(`#discount-`+couponIdString).val();
      const grade = $(`#grade-`+couponIdString).val();
      const category = $(`#category-`+couponIdString).val();

      $.ajax({
        url: "/shop/Controller?type=updateCoupon",
        type: "POST",
        data: {
          id: couponId,
          name: name,
          start_date: start,
          end_date: end,
          sale_per: discount,
          grade_no: grade,
          category_no: category
        },
        success: function (response) {
          alert("쿠폰이 수정되었습니다.");
          $(`#name-${couponId}, #start-${couponId}, #end-${couponId}, #discount-${couponId}, #grade-${couponId}, #category-${couponId}`).prop("disabled", true);
          $(`.save-button[data-id='${couponId}']`).hide();
          $(`.edit-button[data-id='${couponId}']`).show();
        },
        error: function () {
          alert("수정 중 오류가 발생했습니다.");
        }
      });
    });

    // 삭제 버튼 클릭 시 (AJAX 요청으로 삭제)
    $(".delete-button").on("click", function () {
      const couponId = $(this).data("id");
      console.log(couponId);

      if (!confirm("정말 삭제하시겠습니까?")) return;

      $.ajax({
        url: "/shop/Controller?type=deleteCoupon",
        type: "POST",
        data: { id: couponId },
        success: function () {
          alert("쿠폰이 삭제되었습니다.");
          $(`tr[data-id='${couponId}']`).remove();
        },
        error: function () {
          alert("삭제 중 오류가 발생했습니다.");
        }
      });
    });
  });
</script>
</body>
</html>