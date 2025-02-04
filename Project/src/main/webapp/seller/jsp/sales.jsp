<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      margin: 20px;
      font-family: Arial, sans-serif;
    }
    .header-spacing {
      margin-top: 30px;
    }
    .section-title {
      font-size: 1.5rem;
      font-weight: bold;
      margin-bottom: 20px;
    }
    .table-container {
      margin-bottom: 40px;
    }
    table th, table td {
      text-align: center;
      vertical-align: middle;
    }
    .d-flex-between {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .search-container {
      display: flex;
      gap: 10px;
      align-items: center;
      margin-bottom: 20px;
    }

    .search-container input {
      max-width: 300px; /* 원하는 크기로 설정 */
      width: 100%;
    }
    .summary-card {
      border: 1px solid #ddd;
      border-radius: 10px;
      padding: 20px;
      margin-bottom: 20px;
      background-color: #f8f9fa;
    }
  </style>
</head>
<%@ include file="header.jsp" %>
<body>
<div class="container header-spacing">
  <h1 class="section-title">매출/정산 관리</h1>

  <!-- 매출 요약 -->
  <c:set var="totalFinalPrice" value="0" />
  <c:forEach var="sale" items="${salesList}">
    <c:set var="totalFinalPrice" value="${totalFinalPrice + sale.final_price}" />
  </c:forEach>

  <div class="summary-card d-flex-between">
    <div>
      <h5>기간 별 매출</h5>
      <p class="text-primary fw-bold" id="totalSalesAmount">₩ 0</p>  <%-- ✅ JS에서 동적으로 업데이트됨 --%>
    </div>
    <div>
      <h5>총 주문 수</h5>
      <p class="text-success fw-bold">${totalSalesCount}건</p>
    </div>
    <div>
      <h5>총 정산 금액</h5>
      <p class="text-danger fw-bold">₩ ${totalFinalPrice}</p>  <%-- ✅ JSP에서 합산 후 출력 --%>
    </div>
  </div>
  <div class="search-container"> <!-- 날짜 설정 버튼 -->
    <label for="startDate">시작일:</label>
    <input type="date" class="form-control" id="startDate">

    <label for="endDate">종료일:</label>
    <input type="date" class="form-control" id="endDate">

    <button type="button" class="btn btn-outline-secondary" id="dateSearchBtn">기간 검색</button>
  </div>
  <!-- 검색 필드 -->
  <div class="search-container">
    <select class="form-select" id="searchCategory" aria-label="검색 카테고리" style="max-width: 200px;">
      <option value="orderId">주문 ID</option>
      <option value="productName">상품명</option>
      <option value="category">카테고리</option>
      <option value="status">상태</option> <!-- 상태 옵션 추가 -->
    </select>
    <input type="text" class="form-control" id="searchInput" placeholder="검색어를 입력하세요" aria-label="검색어" style="max-width: 200px;">
    <select class="form-select" id="categorySelect" style="display: none; max-width: 200px;">
      <option value="전체">전체</option>
      <option value="아우터">아우터</option>
      <option value="상의">상의</option>
      <option value="바지">바지</option>
      <option value="원피스/스커트">원피스/스커트</option>
    </select>
    <select class="form-select" id="statusSelect" style="display: none; max-width: 200px;"> <!-- 상태 선택 콤보박스 -->
      <option value="전체">전체</option>
      <option value="완료">완료</option>
      <option value="처리 중">처리 중</option>
      <option value="취소">취소</option>
    </select>
    <button type="button" class="btn btn-outline-secondary" id="totalSearch">검색</button>
  </div>

  <!-- 매출 테이블 -->
  <div class="table-container">
    <table class="table table-bordered">
      <thead class="table-light">
      <tr>
        <th>주문 ID</th>
        <th>주문일</th>
        <th>상품명</th>
        <th>카테고리</th>
        <th>판매 금액</th>
        <th>정산 금액</th>
        <th>상태</th>
        <th>관리</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="sale" items="${salesList}">
        <tr>
          <td>${sale.order_id}</td>
          <td>${sale.order_date}</td>
          <td>${sale.product_name}</td>
          <td>${sale.category_name}</td>
          <td>₩${sale.discount_value}</td>
          <td>₩${sale.final_price}</td>
          <td>
            <c:choose>
              <c:when test="${sale.status eq 0}">
                <span class="badge bg-success">완료</span>
              </c:when>
              <c:when test="${sale.status eq 1}">
                <span class="badge bg-warning text-dark">처리 중</span>
              </c:when>
              <c:when test="${sale.status eq 4}">
                <span class="badge bg-danger">취소</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-secondary">미정</span>
              </c:otherwise>
            </c:choose>
          </td>
          <td>
            <button class="btn btn-sm btn-warning detail-button" data-order-id="${sale.order_id}">상세</button>
          </td>
        </tr>
      </c:forEach>
      </tbody>

    </table>
  </div>
</div>

<!-- 주문 상세 모달 -->
<div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="orderDetailModalLabel">주문 상세 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- 주문 정보 -->
        <h6 class="fw-bold mb-3">주문 정보</h6>
        <table class="table table-bordered">
          <tbody>
          <tr>
            <th>주문 ID</th>
            <td id="detailOrderId">-</td>
          </tr>
          <tr>
            <th>주문일</th>
            <td id="detailOrderDate">-</td>
          </tr>
          <tr>
            <th>주문 상태</th>
            <td>
              <select class="form-select" id="detailOrderStatus">
                <option value="완료">완료</option>
                <option value="처리 중">처리 중</option>
                <option value="취소">취소</option>
              </select>
            </td>
          </tr>
          </tbody>
        </table>

        <!-- 고객 정보 -->
        <h6 class="fw-bold mb-3">고객 정보</h6>
        <table class="table table-bordered">
          <tbody>
          <tr>
            <th>고객명</th>
            <td id="detailCustomerName">-</td>
          </tr>
          <tr>
            <th>연락처</th>
            <td id="detailCustomerPhone">-</td>
          </tr>
          <tr>
            <th>배송 주소</th>
            <td id="detailCustomerAddress">-</td>
          </tr>
          </tbody>
        </table>

        <!-- 상품 정보 -->
        <h6 class="fw-bold mb-3">상품 정보</h6>
        <table class="table table-bordered">
          <thead class="table-light">
          <tr>
            <th>상품명</th>
            <th>카테고리</th>
            <th>수량</th>
            <th>판매 금액</th>
            <th>할인률</th>
            <th>합계</th>
          </tr>
          </thead>
          <tbody id="detailProductList">
          <td id="detailProductName">-</td>
          <td id="detailCategoryName">-</td>
          <td id="detailQuantity">-</td>
          <td id="detailPrice">-</td>
          <td id="detailCoupon">-</td>
          <td id="detailTotalPrice">-</td>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="saveButton">저장</button>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<script>
  // 카테고리 선택에 따라 검색 필드 변경
  document.getElementById("searchCategory").addEventListener("change", function () {
    const selectedValue = this.value; // 현재 선택된 검색 기준
    const searchInput = document.getElementById("searchInput"); // 텍스트 필드
    const categorySelect = document.getElementById("categorySelect"); // 카테고리 선택
    const statusSelect = document.getElementById("statusSelect"); // 상태 선택

    if (selectedValue === "category") {
      // 카테고리 선택 시

      searchInput.style.display = "none";
      categorySelect.style.display = "block";
      statusSelect.style.display = "none";
    } else if (selectedValue === "status") {
      // 상태 선택 시
      searchInput.style.display = "none";
      categorySelect.style.display = "none";
      statusSelect.style.display = "block";
    } else {
      // 그 외 (주문 ID, 상품명 등)
      searchInput.style.display = "block";
      categorySelect.style.display = "none";
      statusSelect.style.display = "none";
    }
    console.log("선택된 값:", selectedValue);
  });
  // 매출 데이터 샘플
  const salesData = [
    { orderId: "ORD001", date: "2025-01-15", productName: "기본 티셔츠", category: "상의", price: 29000 },
    { orderId: "ORD002", date: "2025-01-16", productName: "청바지", category: "바지", price: 59000 },
    { orderId: "ORD003", date: "2025-01-17", productName: "겨울 코트", category: "아우터", price: 150000 },
  ];

  // 총 매출 계산 함수
  function calculateTotalSales() {
    return salesData.reduce((sum, sale) => sum + sale.price, 0);
  }

  // 페이지 로드 시 총매출 업데이트
  document.addEventListener("DOMContentLoaded", () => {
    const totalSales = calculateTotalSales();
    const totalSalesElement = document.querySelector(".summary-card .text-primary");
    if (totalSalesElement) {
      totalSalesElement.textContent = `₩ ${totalSales.toLocaleString()}`;
    }
  });

  


  document.querySelectorAll(".detail-button").forEach(button => {
    button.addEventListener("click", function () {
      const orderId = this.getAttribute("data-order-id");
      console.log("🔹 요청할 주문 ID:", orderId);

      fetch('/shop/Controller?type=salesModal&orderId=' + orderId)
              .then(response => response.json())
              .then(data => {
                if (data.length === 0) {
                  alert("❌ 주문 정보를 불러올 수 없습니다.");
                  return;
                }

                console.log("🟢 받은 데이터:", data);

                document.getElementById("detailOrderId").innerText = data[0].order_id;
                document.getElementById("detailOrderDate").innerText = data[0].order_date;
                document.getElementById("detailOrderStatus").value = data[0].status;
                document.getElementById("detailCustomerName").innerText = data[0].customer_name;
                document.getElementById("detailCustomerPhone").innerText = data[0].customer_phone;
                document.getElementById("detailCustomerAddress").innerText = data[0].customer_address;
                document.getElementById("detailProductName").innerText = data[0].product_name;
                document.getElementById("detailCategoryName").innerText = data[0].category_name;
                document.getElementById("detailQuantity").innerText = data[0].quantity;
                document.getElementById("detailPrice").innerText = data[0].price;
                document.getElementById("detailCoupon").innerText = data[0].discount_value;
                document.getElementById("detailTotalPrice").innerText = data[0].total_price;


                // 모달 표시
                const modal = new bootstrap.Modal(document.getElementById("orderDetailModal"));
                modal.show();
              })
              .catch(error => {
                console.error("❌ AJAX 오류:", error);
                alert("데이터를 불러오는 중 오류가 발생했습니다.");
              });
    });
  });

  document.addEventListener("DOMContentLoaded", () => {
    document.getElementById("saveButton").addEventListener("click", function () {
      const status = document.querySelector("#orderDetailModal #detailOrderStatus").value;
      const orderId = document.getElementById("detailOrderId").innerText;

      if (status) {
        // 테이블에서 해당 주문 ID를 가진 행 찾기
        const tableRows = document.querySelectorAll(".table-container table tbody tr");
        tableRows.forEach(row => {
          const rowOrderId = row.children[0].innerText; // 첫 번째 칼럼이 주문 ID
          if (rowOrderId === orderId) {
            // 상태 칼럼 업데이트 (6번째 칼럼)
            const statusCell = row.children[6];
            if (status == 1) {
              statusCell.innerHTML = `<span class="badge bg-success">완료</span>`;
            } else if (status == 2) {
              statusCell.innerHTML = `<span class="badge bg-warning text-dark">처리 중</span>`;
            } else if (status == 3) {
              statusCell.innerHTML = `<span class="badge bg-danger">취소</span>`;
            }
          }
        });

        // 기존 알림 로직 유지
        alert("주문 상태가 " + status + "로 저장되었습니다.")
        const modal = bootstrap.Modal.getInstance(document.getElementById("orderDetailModal"));
        modal.hide();

      } else {
        alert("주문 상태를 가져올 수 없습니다!");
      }
    });
  });
  document.getElementById("totalSearch").addEventListener("click", function () {
    const criteria = document.querySelector("#searchCategory").value; // 검색 기준
    const keyword = document.querySelector("#searchInput").value.toLowerCase();
    const selectedCategory = document.querySelector("#categorySelect").value.toLowerCase();
    const selectedStatus = document.querySelector("#statusSelect").value; // 선택된 상태 값

    const rows = document.querySelectorAll(".table tbody tr");

    rows.forEach(row => {
      let isVisible = false;

      switch (criteria) {
        case "orderId":
          const orderId = row.children[0].textContent.toLowerCase();
          isVisible = orderId.includes(keyword);
          break;
        case "productName":
          const productName = row.children[2].textContent.toLowerCase();
          isVisible = productName.includes(keyword);
          break;
        case "category":
          const categoryName = row.children[3].textContent.trim();
          isVisible = selectedCategory === "전체" || categoryName === selectedCategory;
          break;
        case "status": // 상태 검색 처리
          const statusName = row.children[6].textContent.trim();
          isVisible = selectedStatus === "전체" || statusName === selectedStatus;
          break;
      }

      row.style.display = isVisible ? "" : "none";
    });
  });

  // 카테고리 선택에 따라 검색 필드 변경 (기존 코드 재사용)
  document.getElementById("searchCategory").addEventListener("change", function () {
    const selectedValue = this.value;
    const searchInput = document.getElementById("searchInput");
    const categorySelect = document.getElementById("categorySelect");
    const statusSelect = document.getElementById("statusSelect");
    if (selectedValue === "category") {
      searchInput.style.display = "none";
      categorySelect.style.display = "block";
      // 의상 카테고리 목록 업데이트
      categorySelect.innerHTML = `
      <option value="전체">전체</option>
      <option value="아우터">아우터</option>
      <option value="상의">상의</option>
      <option value="바지">바지</option>
      <option value="원피스/스커트">원피스/스커트</option>
    `;
    } else if  (selectedValue === "status"){
      searchInput.style.display = "none";
      categorySelect.style.display = "none";
      statusSelect.style.display = "block";
    } else {
      searchInput.style.display = "block";
      categorySelect.style.display = "none";
      statusSelect.style.display = "none";
    }
  });
</script>
</body>
</html>