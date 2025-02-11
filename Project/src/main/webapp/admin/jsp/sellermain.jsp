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
<jsp:include page="layout/header.jsp" />

<div class="sidebar">
    <nav class="nav flex-column">
        <!-- 판매자 관리 전용 메뉴 -->


        <a class="nav-link active" href="#seller1">승인대기 (active = 1)</a>
        <a class="nav-link" href="#seller0">현재 판매자 (active = 0)</a>
        <!-- 필요시 추가 모달 링크 -->
    </nav>
</div>

<div class="main-content">
    <!-- 승인대기 판매자 섹션 -->
    <div class="card mb-4" id="seller1">
        <div class="card-header">승인대기 (active = 1)</div>
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
        <div class="card-header">현재 판매자 (active = 0)</div>
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


<%--판매자대기 거절 모달 창--%>
<div class="modal fade" id="rejectSellerModal" tabindex="-1" aria-labelledby="rejectModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="rejectModalLabel">거절 사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="rejectSellerForm">
                <div class="modal-body">
                    <input type="hidden" id="rejectSellerId" name="id">

                    <textarea class="form-control" id="rejectSellerReason" name="content" rows="3" placeholder="해당 판매자대기를 삭제할 이유를 적어주세요."></textarea>
                    <span class="text-danger">*특수문자사용시 스마트스토어 정책에 따라 전송 에러가 발생합니다. 텍스트와 숫자로 안내문구를 작성해주시기 바랍니다.</span>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%--판매자대기 승인 모달 창--%>
<div class="modal fade" id="admitSellerModal" tabindex="-1" aria-labelledby="admitModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="admitModalLabel">승인 사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="admitSellerForm">
                <div class="modal-body">
                    <input type="hidden" id="admitSellerId" name="id">

                    <textarea class="form-control" id="admitSellerReason" name="content" rows="3" placeholder="해당 판매자대기를 승인할 이유를 적어주세요."></textarea>
                    <span class="text-danger">*특수문자사용시 스마트스토어 정책에 따라 전송 에러가 발생합니다. 텍스트와 숫자로 안내문구를 작성해주시기 바랍니다.</span>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%--판매자 정지 모달 창--%>
<div class="modal fade" id="stopSellerModal" tabindex="-1" aria-labelledby="stopModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="stopModalLabel">정지 사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="stopSellerForm">
                <div class="modal-body">
                    <input type="hidden" id="stopSellerId" name="id">

                    <textarea class="form-control" id="stopSellerReason" name="content" rows="3" placeholder="해당 판매자를 정지할 이유를 적어주세요."></textarea>
                    <span class="text-danger">*특수문자사용시 스마트스토어 정책에 따라 전송 에러가 발생합니다. 텍스트와 숫자로 안내문구를 작성해주시기 바랍니다.</span>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>

  $(function (){
    $("#seller0_search_btn").click(function(){
      //검색버튼을 클릭할 때마다 수행하는 곳
      let category_name = $("#seller0_name").val();
      let word = $("#seller0_word").val();
      alert(category_name+"/"+word);
      let param = "type=searchSeller0&searchType="+
          encodeURIComponent(category_name)+
          "&searchValue="+encodeURIComponent(word);
      //비동기식 통신
      $.ajax({
        url: "Controller",
        type: "POST",
        data: param,
      }).done(function(data){
        $("#seller0_table tbody").html(data);
      });
    });

  });
  $(function (){
    $("#seller1_search_btn").click(function(){
      //검색버튼을 클릭할 때마다 수행하는 곳
      let category_name = $("#seller1_name").val();
      let word = $("#seller1_word").val();
      alert(category_name+"/"+word);
      let param = "type=searchSeller1&searchType="+
          encodeURIComponent(category_name)+
          "&searchValue="+encodeURIComponent(word);
      //비동기식 통신
      $.ajax({
        url: "Controller",
        type: "POST",
        data: param,
      }).done(function(data){
        $("#seller1_table tbody").html(data);
      });
    });
  });
  $(function (){
    $("#seller2_search_btn").click(function(){
      //검색버튼을 클릭할 때마다 수행하는 곳
      let category_name = $("#seller2_name").val();
      let word = $("#seller2_word").val();
      alert(category_name+"/"+word);
      let param = "type=searchSeller2&searchType="+
          encodeURIComponent(category_name)+
          "&searchValue="+encodeURIComponent(word);
      //비동기식 통신
      $.ajax({
        url: "Controller",
        type: "POST",
        data: param,
      }).done(function(data){
        $("#seller2_table tbody").html(data);
      });
    });
  });
  $(function (){
    $("#seller3_search_btn").click(function(){
      //검색버튼을 클릭할 때마다 수행하는 곳
      let category_name = $("#seller3_name").val();
      let word = $("#seller3_word").val();
      alert(category_name+"/"+word);
      let param = "type=searchSeller3&searchType="+
          encodeURIComponent(category_name)+
          "&searchValue="+encodeURIComponent(word);
      //비동기식 통신
      $.ajax({
        url: "Controller",
        type: "POST",
        data: param,
      }).done(function(data){
        $("#seller3_table tbody").html(data);
      });
    });
  });

  const columnTranslations = {
    'seller_id': '판매자 id',

    'name': '이름',

    'gender': '성별',
    'birth_date': '생일',
    'phone': '전화번호',
    'email': '이메일',
    'desc': '분류',
    'courier': '배송회사',
    'address': '주소',


  };

  // 페이지 로딩 후 컬럼 이름을 한국어로 변환
  document.addEventListener('DOMContentLoaded', function() {
    const columnElements = document.querySelectorAll('.column-name'); // 'column-name' 클래스를 가진 요소들

    columnElements.forEach(element => {
      const columnName = element.innerText.trim();
      if (columnTranslations[columnName]) {
        element.innerText = columnTranslations[columnName];  // 한국어로 번역
      }
    });
  });

  function setSellerId(sellerId) {
    console.log("전달된 판매자 ID:", sellerId);
    $("#rejectSellerId").val(sellerId);
    $("#admitSellerId").val(sellerId);
    $("#stopSellerId").val(sellerId);


  }
  function setAdmitSellerId(sellerId){
    console.log("전달된 판매자 ID:", sellerId);
    $("#admitSellerId").val(sellerId);
  }
  $(document).ready(function () {<%--폼태그--%>
    $("#rejectSellerForm").submit(function (event) {
      event.preventDefault(); // 기본 form 제출 막기

      let sellerId = $("#rejectSellerId").val();

      let content = $("#rejectSellerReason").val();

      if (!sellerId) {
        alert("삭제할 게시판 ID가 없습니다.");
        return;
      }

      $.ajax({
        url: "Controller",
        type: "POST",
        data: {
          type: "buttonSeller",
          id: sellerId,

          content: content,
          action: "reject"
        },
        dataType: "json", <%--보내지는 데이터 타입--%>
        <%--삭제의 경우 기존 값에서 하나의 행만 지우는 식이로 해야해서 이렇게 했다--%>
        <%--삭제시 반드시 1로 만들어준다-->
        <%--추가는 전부 불러오는 방식으로 하길 권장한다--%>
        <%--spring에서도 자주 사용하니 반드시 알아야한다--%>

        success: function (response) {
          if (response.status === "success") {
            console.log("거절 성공:", response);

            <%--테이블의 열의 id를 레코드를 삭제--%>
            $("#row-" + sellerId).remove();



            $("#rejectSellerModal").modal("hide");

            alert("판매자가 거절되었습니다.");
          } else {
            console.error("거절 실패:", response.message);
            alert("판매자 거절에 실패했습니다: " + response.message);
          }
        },
        error: function (xhr, status, error) {
          console.error("거절 실패:", error);
          alert("판매자 거절 중 오류가 발생했습니다.");
        }
      });
    });
  });
  $(document).ready(function () {<%--폼태그--%>
    $("#admitSellerForm").submit(function (event) {
      event.preventDefault(); // 기본 form 제출 막기

      let sellerId = $("#admitSellerId").val();

      let content = $("#admitSellerReason").val();

      if (!sellerId) {
        alert("승인할 게시판 ID가 없습니다.");
        return;
      }

      $.ajax({
        url: "Controller",
        type: "POST",
        data: {
          type: "buttonSeller",
          id: sellerId,

          content: content,
          action: "admit"
        },
        dataType: "json", <%--보내지는 데이터 타입--%>
        <%--삭제의 경우 기존 값에서 하나의 행만 지우는 식이로 해야해서 이렇게 했다--%>
        <%--삭제시 반드시 1로 만들어준다-->
        <%--추가는 전부 불러오는 방식으로 하길 권장한다--%>
        <%--spring에서도 자주 사용하니 반드시 알아야한다--%>

        success: function (response) {
          if (response.status === "success") {
            console.log("승인 성공:", response);

            <%--테이블의 열의 id를 레코드를 삭제--%>
            $("#row-" + sellerId).remove();



            $("#admitSellerModal").modal("hide");

            alert("판매자가 승인되었습니다.");
          } else {
            console.error("승인 실패:", response.message);
            alert("판매자 승인에 실패했습니다: " + response.message);
          }
        },
        error: function (xhr, status, error) {
          console.error("승인 실패:", error);
          alert("판매자 승인 중 오류가 발생했습니다.");
        }
      });
    });
  });
  $(document).ready(function () {<%--폼태그--%>
    $("#stopSellerForm").submit(function (event) {
      event.preventDefault(); // 기본 form 제출 막기

      let sellerId = $("#stopSellerId").val();

      let content = $("#stopSellerReason").val();

      if (!sellerId) {
        alert("승인할 게시판 ID가 없습니다.");
        return;
      }

      $.ajax({
        url: "Controller",
        type: "POST",
        data: {
          type: "buttonSeller",
          id: sellerId,

          content: content,
          action: "stop"
        },
        dataType: "json", <%--보내지는 데이터 타입--%>
        <%--삭제의 경우 기존 값에서 하나의 행만 지우는 식이로 해야해서 이렇게 했다--%>
        <%--삭제시 반드시 1로 만들어준다-->
        <%--추가는 전부 불러오는 방식으로 하길 권장한다--%>
        <%--spring에서도 자주 사용하니 반드시 알아야한다--%>

        success: function (response) {
          if (response.status === "success") {
            console.log("정지 성공:", response);

            <%--테이블의 열의 id를 레코드를 삭제--%>
            $("#row-" + sellerId).remove();



            $("#stopSellerModal").modal("hide");

            alert("판매자가 정지되었습니다.");
          } else {
            console.error("정지 실패:", response.message);
            alert("판매자 정지에 실패했습니다: " + response.message);
          }
        },
        error: function (xhr, status, error) {
          console.error("정지 실패:", error);
          alert("판매자 정지 중 오류가 발생했습니다.");
        }
      });
    });
  });





</script>
</body>
</html>
