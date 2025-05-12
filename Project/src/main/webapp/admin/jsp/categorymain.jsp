<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>카테고리 관리</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts: Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        /* CSS 변수로 색상 정의 */
        :root {
            --primary-color: #0d6efd;
            --secondary-color: #6c757d;
            --background-color: #f5f6fa;
            --sidebar-bg: #2f4050;
            --sidebar-color: #ffffff;
            --header-bg: #23282c;
            --header-color: #ffffff;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-color);
            margin: 0;
            padding: 0;
        }

        /* 고정 헤더 */
        .header {
            background-color: var(--header-bg);
            color: var(--header-color);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 60px;
            z-index: 1050;
            display: flex;
            align-items: center;
            padding: 0 20px;
        }

        /* 사이드바 */
        .sidebar {
            background-color: var(--sidebar-bg);
            position: fixed;
            top: 60px; /* 헤더 높이 */
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
        .sidebar .nav-link i {
            margin-right: 8px;
        }
        .sidebar .nav-link:hover,
        .sidebar .nav-link.active {
            background-color: var(--primary-color);
            color: #fff;
        }

        /* 메인 콘텐츠 영역 */
        .main-content {
            margin-left: 260px;
            padding: 80px 30px 30px;
        }

        /* 카드 스타일 (모던한 플랫 디자인) */
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .card-header {
            background-color: var(--primary-color);
            color: #fff;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            font-size: 1.1rem;
        }

        /* 버튼 스타일 */
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        /* 테이블 헤더 */
        .table thead {
            background-color: #e9ecef;
        }

        /* 검색 인풋 스타일 */
        .input-group .form-select,
        .input-group .form-control {
            border: 1px solid #ced4da;
        }
    </style>
</head>
<body>
<!-- 상단 헤더 (공통 헤더 include) -->
<jsp:include page="/admin/jsp/layout/header.jsp" />

<!-- 좌측 사이드바 -->
<div class="sidebar">
    <nav class="nav flex-column">
        <a class="nav-link active" href="#majorSection"><i class="bi bi-grid-3x3-gap-fill"></i> 대분류 목록</a>
        <a class="nav-link" href="#middleSection"><i class="bi bi-layout-text-window-reverse"></i> 중분류 목록</a>
    </nav>
</div>

<!-- 메인 콘텐츠 영역 -->
<div class="main-content">
    <h2 class="mb-4">카테고리 관리</h2>

    <!-- 대분류 목록 섹션 -->
    <section id="majorSection">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <span>대분류 목록</span>
                <button class="btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#mainCategoryModal">
                    <i class="bi bi-plus-lg"></i> 추가
                </button>
            </div>
            <div class="card-body">
                <!-- 검색 영역 -->
                <div class="input-group mb-3">
                    <span class="input-group-text"><i class="bi bi-search"></i></span>
                    <select class="form-select" id="major_category_name">
                        <c:forEach var="name" items="${majorcategoryName}">
                            <c:if test="${name ne 'id' and name ne 'is_del'}">
                                <option class="column-name" value="${name}">${name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <input type="text" class="form-control" placeholder="검색어 입력" id="major_word">
                    <button class="btn btn-outline-secondary" type="button" id="major_search_btn">검색</button>
                </div>
                <!-- 대분류 목록 테이블 -->
                <div class="table-responsive">
                    <table class="table table-striped" id="major_category_table">
                        <thead>
                        <tr>
                            <c:forEach var="name" items="${majorcategoryName}">
                                <c:if test="${name ne 'id' and name ne 'is_del'}">
                                    <th class="column-name">${name}</th>
                                </c:if>
                            </c:forEach>
                            <th>액션</th>
                        </tr>
                        </thead>
                        <tbody id="categoryBody">
                        <c:forEach var="mcl" items="${majorcategoryList}">
                            <c:if test="${mcl.is_del eq 0}">
                                <tr id="row-${mcl.id}">
                                    <td>${mcl.name}</td>
                                    <td>${mcl.ename}</td>
                                    <td>${mcl.type}</td>
                                    <td>
                                        <button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#deleteMajorModal"
                                                onclick="setMajorId('${mcl.id}')">삭제</button>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <button class="btn btn-outline-secondary btn-sm" onclick="location.href='Controller?type=categorymain'">초기화</button>
            </div>
        </div>
    </section>

    <!-- 중분류 목록 섹션 -->
    <section id="middleSection">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <span>중분류 목록</span>
                <button class="btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#middleCategoryModal">
                    <i class="bi bi-plus-lg"></i> 추가
                </button>
            </div>
            <div class="card-body">
                <!-- 검색 영역 -->
                <div class="input-group mb-3">
                    <span class="input-group-text"><i class="bi bi-search"></i></span>
                    <select class="form-select" id="middle_category_name">
                        <option value="major_name">대분류 이름</option>
                        <option value="name">이름</option>
                        <option value="type">타입</option>
                    </select>
                    <input type="text" class="form-control" placeholder="검색어 입력" id="middle_word">
                    <button class="btn btn-outline-secondary" type="button" id="middle_search_btn">검색</button>
                </div>
                <!-- 중분류 목록 테이블 -->
                <div class="table-responsive">
                    <table class="table table-striped" id="middle_category_table">
                        <thead>
                        <tr>
                            <th>대분류 이름</th>
                            <th>이름</th>
                            <th>타입</th>
                            <th>액션</th>
                        </tr>
                        </thead>
                        <tbody id="middleCategoryBody">
                        <c:forEach var="mdcl" items="${middlecategoryList}">
                            <c:if test="${mdcl.is_del eq 0}">
                                <tr id="row-${mdcl.id}">
                                    <td>${mdcl.major_name}</td>
                                    <td>${mdcl.name}</td>
                                    <td>${mdcl.type}</td>
                                    <td>
                                        <button class="btn btn-secondary btn-sm delete-middle-btn" data-bs-toggle="modal"
                                                data-bs-target="#deleteMiddleModal" data-middle-id="${mdcl.id}">삭제</button>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <button class="btn btn-outline-secondary btn-sm" onclick="location.href='Controller?type=categorymain'">초기화</button>
            </div>
        </div>
    </section>
</div>

<!-- 모달 영역 (대분류/중분류 추가/삭제 모달 – 기존 구조 그대로 유지) -->
<!-- 대분류 추가 모달 -->
<div class="modal fade" id="mainCategoryModal" tabindex="-1" aria-labelledby="mainCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="mainCategoryModalLabel">대분류 설정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
            </div>
            <form id="addCategoryForm" action="Controller" method="POST">
                <div class="modal-body">
                    <div class="mb-3 row">
                        <label for="categoryName" class="col-sm-3 col-form-label">대분류 명</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="categoryName" name="name" placeholder="예: 상의">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="categoryEname" class="col-sm-3 col-form-label">대분류 영문명</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="categoryEname" name="ename" placeholder="예: tops">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="submit" class="btn btn-primary" id="saveButton">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 대분류 삭제 모달 -->
<div class="modal fade" id="deleteMajorModal" tabindex="-1" aria-labelledby="deleteMajorModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteMajorModalLabel">삭제 사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
            </div>
            <form id="deleteMajorForm">
                <div class="modal-body">
                    <input type="hidden" id="deleteMajorId" name="id">
                    <textarea class="form-control" id="deleteMajorReason" name="content" rows="3" placeholder="삭제 사유를 입력하세요."></textarea>
                    <small class="text-danger">*특수문자 사용 시 전송 오류 발생 가능</small>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 중분류 삭제 모달 -->
<div class="modal fade" id="deleteMiddleModal" tabindex="-1" aria-labelledby="deleteMiddleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteMiddleModalLabel">삭제 사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
            </div>
            <form id="deleteMiddleForm">
                <div class="modal-body">
                    <input type="hidden" id="deleteMiddleId" name="id">
                    <textarea class="form-control" id="deleteMiddleReason" name="content" rows="3" placeholder="삭제 사유를 입력하세요."></textarea>
                    <small class="text-danger">*특수문자 사용 시 전송 오류 발생 가능</small>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 중분류 추가 모달 -->
<div class="modal fade" id="middleCategoryModal" tabindex="-1" aria-labelledby="middleCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="middleCategoryModalLabel">중분류 설정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
            </div>
            <form id="addMiddleCategoryForm" action="Controller" method="POST">
                <div class="modal-body">
                    <div class="mb-3 row">
                        <label for="majorCategoryId" class="col-sm-3 col-form-label">상위 대분류</label>
                        <div class="col-sm-9">
                            <select class="form-select" id="majorCategoryId" name="majorCategoryId">
                                <option value="1">상의</option>
                                <option value="2">하의</option>
                                <option value="3">아우터</option>
                                <option value="4">신발</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="middleCategoryName" class="col-sm-3 col-form-label">중분류 명</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="middleCategoryName" name="middleCategoryName" placeholder="예: 맨투맨">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="middleCategoryType" class="col-sm-3 col-form-label">종류</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="middleCategoryType" name="middleCategoryType" value="1">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="submit" class="btn btn-primary" id="middlesaveBtn">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 스크립트 영역 (AJAX 및 기타 로직 – 기존 코드 그대로) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" crossorigin="anonymous"></script>
<script>
  // 대분류 검색 AJAX
  $(function () {
    $("#major_search_btn").click(function () {
      var category_name = $("#major_category_name").val();
      var word = $("#major_word").val();
      alert(category_name + "/" + word);
      var param = "type=searchMajorCategory&searchType=" + encodeURIComponent(category_name) +
          "&searchValue=" + encodeURIComponent(word);
      $.ajax({
        url: "Controller",
        type: "POST",
        data: param,
      }).done(function (data) {
        console.log(data);
        $("#categoryBody").html(data);
      });
    });

    // 중분류 검색 AJAX
    $("#middle_search_btn").click(function () {
      var category_name = $("#middle_category_name").val();
      var word = $("#middle_word").val();
      alert(category_name + "/" + word);
      var param = "type=searchMiddleCategory&searchType=" + encodeURIComponent(category_name) +
          "&searchValue=" + encodeURIComponent(word);
      $.ajax({
        url: "Controller",
        type: "POST",
        data: param,
      }).done(function (data) {
        $("#middle_category_table tbody").html(data);
      });
    });
  });

  // 컬럼명 한글 변환 (필요시)
  const columnTranslations = {
    'id': '아이디',
    'name': '이름',
    'ename': '영문 이름',
    'type': '타입',
    'major_no': '대분류 번호'
  };
  document.addEventListener('DOMContentLoaded', function() {
    const columnElements = document.querySelectorAll('.column-name');
    columnElements.forEach(element => {
      const columnName = element.innerText.trim();
      if (columnTranslations[columnName]) {
        element.innerText = columnTranslations[columnName];
      }
    });
  });

  // 대분류 추가 모달 - 저장 버튼 (폼 제출 전 간단 검증)
  $("#saveButton").click(function () {
    var name = $("#categoryName").val().trim();
    var ename = $("#categoryEname").val().trim();
    if (!name || !ename) {
      alert("모든 항목을 입력해주세요!");
      return;
    }
    $("#mainCategoryModal").modal("hide");
  });

  // 대분류 추가 AJAX (폼 submit 이벤트)
  $(document).ready(function () {
    $("#addCategoryForm").submit(function (event) {
      event.preventDefault();
      $.ajax({
        type: "POST",
        url: "Controller?type=addMajorCategory",
        data: $(this).serialize(),
        dataType: "json",
        success: function (response) {
          if (response.success) {
            var name = $("input[name='name']").val();
            var ename = $("input[name='ename']").val();
            var majorId = response.result;
            var newRow = '<tr id="row-' + majorId + '">' +
                '<td>' + name + '</td>' +
                '<td>' + ename + '</td>' +
                '<td></td>' +
                '<td>' +
                '<button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#deleteMajorModal" onclick="setMajorId(' + majorId + ')">삭제</button>' +
                '</td>' +
                '</tr>';
            $("#row-" + majorId).remove();
            $("#categoryBody").append(newRow);
            $("input[name='name']").val('');
            $("input[name='ename']").val('');
          } else {
            alert("카테고리 추가 실패!");
          }
        },
        error: function () {
          alert("서버 오류 발생!");
        }
      });
    });
  });

  // 대분류 삭제를 위한 ID 설정 함수
  function setMajorId(majorId) {
    console.log("전달된 대분류 ID:", majorId);
    $("#deleteMajorId").val(majorId);
  }

  // 중분류 삭제 버튼 클릭 이벤트 (동적 생성된 버튼에도 적용)
  $(document).on("click", ".delete-middle-btn", function () {
    var middleId = $(this).data("middle-id");
    console.log("전달된 중분류 ID:", middleId);
    $("#deleteMiddleId").val(middleId);
  });

  // 대분류 삭제 AJAX
  $(document).ready(function () {
    $("#deleteMajorForm").submit(function (event) {
      event.preventDefault();
      var majorId = $("#deleteMajorId").val();
      var content = $("#deleteMajorReason").val();
      if (!majorId) {
        alert("삭제할 대분류 ID가 없습니다.");
        return;
      }
      $.ajax({
        url: "Controller",
        type: "POST",
        data: {
          type: "buttonCategory",
          id: majorId,
          content: content,
          action: "major"
        },
        dataType: "json",
        success: function (response) {
          if (response.status === "success") {
            console.log("삭제 성공:", response);
            $("#row-" + majorId).remove();
            $("#deleteMajorModal").modal("hide");
            alert("대분류가 삭제되었습니다.");
          } else {
            console.error("삭제 실패:", response.message);
            alert("대분류 삭제에 실패했습니다: " + response.message);
          }
        },
        error: function (xhr, status, error) {
          console.error("삭제 실패:", error);
          alert("대분류 삭제 중 오류가 발생했습니다.");
        }
      });
    });
  });

  // 중분류 삭제 AJAX
  $(document).ready(function () {
    $("#deleteMiddleForm").submit(function (event) {
      event.preventDefault();
      var middleId = $("#deleteMiddleId").val();
      var content = $("#deleteMiddleReason").val();
      if (!middleId) {
        alert("삭제할 중분류 ID가 없습니다.");
        return;
      }
      $.ajax({
        url: "Controller",
        type: "POST",
        data: {
          type: "buttonCategory",
          id: middleId,
          content: content,
          action: "middle"
        },
        dataType: "json",
        success: function (response) {
          if (response.status === "success") {
            console.log("삭제 성공:", response);
            $("#row-" + middleId).remove();
            $("#deleteMiddleModal").modal("hide");
            alert("중분류가 삭제되었습니다.");
          } else {
            console.error("삭제 실패:", response.message);
            alert("중분류 삭제에 실패했습니다: " + response.message);
          }
        },
        error: function (xhr, status, error) {
          console.error("삭제 실패:", error);
          alert("중분류 삭제 중 오류가 발생했습니다.");
        }
      });
    });
  });

  // 중분류 추가 모달 - 저장 버튼 간단 검증 후 모달 닫기
  $("#middlesaveBtn").click(function(){
    var majorCategoryId = $("#majorCategoryId").val().trim();
    var middleCategoryName = $("#middleCategoryName").val().trim();
    var middleCategoryType = $("#middleCategoryType").val().trim();
    if (!majorCategoryId || !middleCategoryName || !middleCategoryType) {
      alert("모든 항목을 입력해주세요!");
      return;
    }
    $("#middleCategoryModal").modal("hide");
  });

  // 중분류 추가 AJAX
  $(document).ready(function () {
    $("#addMiddleCategoryForm").submit(function (event) {
      event.preventDefault();
      var majorCategoryId = $("#majorCategoryId").val();
      var middleCategoryName = $("#middleCategoryName").val().trim();
      var middleCategoryType = $("#middleCategoryType").val().trim();
      var categoryMap = {
        "1": "상의",
        "2": "하의",
        "3": "아우터",
        "4": "신발"
      };
      var majorCategoryText = categoryMap[majorCategoryId];

      $.ajax({
        type: "POST",
        url: "Controller?type=addMiddleCategory",
        data: {
          majorCategoryId: majorCategoryId,
          middleCategoryName: middleCategoryName,
          middleCategoryType: middleCategoryType
        },
        dataType: "json",
        success: function(response){
          if(response.success) {
            var middleId = response.id;
            if (!middleId) {
              alert("서버에서 응답이 없습니다.");
              return;
            }
            var newRow = '<tr id="row-' + middleId + '">' +
                '<td>' + majorCategoryText + '</td>' +
                '<td>' + middleCategoryName + '</td>' +
                '<td>' + middleCategoryType + '</td>' +
                '<td>' +
                '<button class="btn btn-secondary btn-sm delete-middle-btn" data-bs-toggle="modal" data-bs-target="#deleteMiddleModal" data-middle-id="' + middleId + '">삭제</button>' +
                '</td>' +
                '</tr>';
            $("#row-" + middleId).remove();
            $("#middleCategoryBody").append(newRow);

            $("#majorCategoryId").val('');
            $("#middleCategoryName").val('');
            $("#middleCategoryType").val('');
          } else {
            alert("카테고리 추가 실패!");
          }
        },
        error: function() {
          alert("서버 오류 발생!");
        }
      });
    });
  });
</script>
</body>
</html>
