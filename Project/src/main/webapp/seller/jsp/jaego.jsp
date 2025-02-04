<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .header-spacing {
            margin-top: 30px;
        }
        body {
            margin: 20px;
            font-family: Arial, sans-serif;
        }
        .table-container {
            margin-bottom: 40px;
            margin-top: 30px;
        }
        .section-title {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 20px;
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
        td button {
            margin-right: 10px; /* 버튼들 사이에 간격 추가 */
        }
        .search-container {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
            justify-content: flex-end; /* 오른쪽 정렬 */
            gap: 10px; /* 텍스트 필드와 버튼 간 간격 */
        }

        .search-input {
            width: 20%; /* 길이를 20%로 설정 */
            max-width: 250px; /* 최대 크기 설정 (필요 시 조정) */
        }

        .search-button {
            white-space: nowrap; /* 버튼 텍스트가 가로로 표시되도록 설정 */
        }

    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container header-spacing">
    <h1 class="section-title">상품 재고 관리</h1>

    <div class="search-container justify-content-end">
        <input type="text" class="form-control search-input" placeholder="상품명을 검색하세요" aria-label="검색어">
        <button type="button" class="btn btn-outline-secondary search-button">
            검색
        </button>
    </div>
    <div class="table-container">
        <table class="table table-bordered">
            <thead class="table-light">
            <tr>
                <th>번호</th>
                <th>상품 이름</th>
                <th>카테고리</th>
                <th>가격</th>
                <th>재고 수량</th>
                <th>관리</th>
            </tr>
            </thead>
            <tbody id="productTableBody">
            <tr>
                <td>1</td>
                <td><input type="text" class="form-control" value="기본 티셔츠" disabled></td>
                <td>
                    <select class="form-select" disabled>
                        <option value="outer">아우터</option>
                        <option value="top" selected>상의</option>
                        <option value="pants">바지</option>
                        <option value="dress_skirt">원피스/스커트</option>
                    </select>
                </td>
                <td><input type="number" class="form-control" value="29000" disabled></td>
                <td><input type="number" class="form-control" value="50" disabled></td>
                <td>
                    <button class="btn btn-warning btn-sm edit-button">수정</button>
                    <button class="btn btn-primary btn-sm save-button" style="display: none;">저장</button>
                    <button class="btn btn-danger btn-sm delete-button">삭제</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="d-flex justify-content-end">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">상품 추가</button>
    </div>
</div>

<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">상품 추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="productName" class="form-label">상품 이름</label>
                        <input type="text" class="form-control" id="productName" required>
                    </div>
                    <div class="mb-3">
                        <label for="productCategory" class="form-label">카테고리</label>
                        <select class="form-select" id="productCategory" required>
                            <option value="" disabled selected>카테고리를 선택하세요</option>
                            <option value="outer">아우터</option>
                            <option value="top">상의</option>
                            <option value="pants">바지</option>
                            <option value="dress_skirt">원피스/스커트</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">가격</label>
                        <input type="number" class="form-control" id="productPrice" required>
                    </div>
                    <div class="mb-3">
                        <label for="productStock" class="form-label">재고 수량</label>
                        <input type="number" class="form-control" id="productStock" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="addProductButton">추가</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script>
    let productCount = 2; // 상품 번호 자동 증가를 위한 카운터 (기존 상품이 1번부터 시작한다고 가정)

    // 상품 추가 모달 내의 추가 버튼 클릭 시
    document.querySelector("#addProductButton").addEventListener("click", function() {
        // 모달에서 입력된 값 가져오기
        const productName = document.getElementById("productName").value;
        const productCategory = document.getElementById("productCategory").value;
        const productPrice = document.getElementById("productPrice").value;
        const productStock = document.getElementById("productStock").value;

        // 입력값이 모두 채워졌는지 체크
        if (!productName || !productCategory || !productPrice || !productStock) {
            alert("모든 필드를 채워주세요.");
            return;
        }

        // 테이블에 새 행 추가하기
        const tableBody = document.getElementById("productTableBody");

        const newRow = document.createElement("tr");

        newRow.innerHTML = `
            <td>` + productCount + `</td>
            <td><input type="text" class="form-control" value="` + productName + `" disabled></td>
            <td>
                <select class="form-select" disabled>
                    <option value="outer" ` + (productCategory == 'outer' ? 'selected' : '') + `>아우터</option>
                    <option value="top" ` + (productCategory == 'top' ? 'selected' : '') + `>상의</option>
                    <option value="pants" ` + (productCategory == 'pants' ? 'selected' : '') + `>바지</option>
                    <option value="dress_skirt" ` + (productCategory == 'dress_skirt' ? 'selected' : '') + `>원피스/스커트</option>
                </select>
            </td>
            <td><input type="number" class="form-control" value="` + productPrice + `" disabled></td>
            <td><input type="number" class="form-control" value="` + productStock + `" disabled></td>
            <td>
                <button class="btn btn-warning btn-sm edit-button">수정</button>
                <button class="btn btn-primary btn-sm save-button" style="display: none;">저장</button>
                <button class="btn btn-danger btn-sm delete-button">삭제</button>
            </td>
        `;

        tableBody.appendChild(newRow);

        // 상품 번호 자동 증가
        productCount++;

        // 모달 닫기
        // const modal = new bootstrap.Modal(document.getElementById("addProductModal"));
        // modal.hide();
        $('#addProductModal').modal('hide');

        // 모달 초기화 (입력된 값 초기화)
        document.getElementById("productName").value = '';
        document.getElementById("productCategory").value = '';
        document.getElementById("productPrice").value = '';
        document.getElementById("productStock").value = '';
    });

    // 이벤트 델리게이션 방식으로 수정, 저장, 삭제 버튼 처리
    document.getElementById("productTableBody").addEventListener("click", function(event) {
        if (event.target.classList.contains("edit-button")) {
            const row = event.target.closest("tr");
            row.querySelectorAll("input, select").forEach(input => input.disabled = false);
            event.target.style.display = "none";
            row.querySelector(".save-button").style.display = "inline-block";
        }

        if (event.target.classList.contains("save-button")) {
            const row = event.target.closest("tr");
            row.querySelectorAll("input, select").forEach(input => input.disabled = true);
            event.target.style.display = "none";
            row.querySelector(".edit-button").style.display = "inline-block";
        }

        if (event.target.classList.contains("delete-button")) {
            const row = event.target.closest("tr");
            row.remove(); // 행 삭제
        }
    });
</script>
</body>
</html>