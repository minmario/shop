<%--
  Created by IntelliJ IDEA.
  User: aaa
  Date: 25. 1. 21.
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <title>쿠폰 관리</title>
</head>
<link rel="stylesheet" href="css/table.css></link>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>

<div class="container-fluid mt-4">
  <!-- 일반 게시판 목록 영역 -->
  <div class="col-9">
    <div class="d-flex justify-content-between align-items-center">
      <h5>쿠폰 목록</h5>
      <div>
        <!-- 대분류 추가 버튼, 모달 연결 -->
        <button class="btn btn-primary add-user-btn" data-bs-toggle="modal" data-bs-target="#CouponModal">쿠폰 추가</button>
      </div>
    </div>

    <div class="mt-3">
      <div class="input-group">
        <!-- 검색 아이콘 -->
        <span class="input-group-text">
                    <i class="bi bi-search"></i>
                </span>
        <select class="form-select" aria-label="Default select example" id="coupon_name">

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


        <!-- 검색 입력 -->
        <input type="text" class="form-control" placeholder="검색할 열을 선택" aria-label="Search" id="coupon_word">
        <!-- 드롭다운 버튼 -->
        <button class="btn btn-outline-secondary" type="button" aria-expanded="false" id="coupon_search_btn">
          검색
        </button>
        <!-- 드롭다운 메뉴 -->
        <%--<ul class="dropdown-menu dropdown-menu-end">
            <c:forEach var="name" items="${majorcategoryName}" begin="1">
                <li><a class="dropdown-item" href="#">${name}</a></li>
            </c:forEach>
        </ul>--%>
      </div>
    </div>

    <table class="table mt-3" id="coupon_table">
      <thead class="table-light">

      <tr>

        <th>관리자번호</th>
        <th>카테고리번호</th>
        <th>판매자번호</th>
        <th>등급번호</th>
        <th>종류</th>
        <th>이름</th>
        <th>할인율</th>
        <th></th>
        <th>시작일자</th>
        <th>끝일자</th>
        <th>상태</th>
        <th></th>



      </tr>
      </thead>
      <tbody>
      <c:forEach var ="coul"  items="${couponList}">
        <tr>


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


          <td><button class="btn btn-outline-secondary btn-sm">수정</button>
            <button class="btn btn-outline-secondary btn-sm">삭제</button></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>

    <div class="mt-3 mb-4">
      <button class="btn btn-outline-secondary" onclick = "location.href='Controller?type=couponmain'">초기화</button>
    </div>

    <hr/><!---------------------------------------------->




  </div>
</div>
<!-- 부트스트랩 관련 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
  $(function (){
    $("#coupon_search_btn").click(function(){
      //검색버튼을 클릭할 때마다 수행하는 곳
      let category_name = $("#coupon_name").val();
      let word = $("#coupon_word").val();
      alert(category_name+"/"+word);
      let param = "type=searchCoupon&searchType="+
              encodeURIComponent(category_name)+
              "&searchValue="+encodeURIComponent(word);
      //비동기식 통신
      $.ajax({
        url: "Controller",
        type: "POST",
        data: param,
      }).done(function(data){
        $("#coupon_table tbody").html(data);
      });
    });
  });


</script>
</body>
</html>

