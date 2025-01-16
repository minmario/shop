<%--
  Created by IntelliJ IDEA.
  User: 권나현
  Date: 2025-01-16
  Time: 오전 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" type="text/css" href="../../css/mypage/exchange.css"/>
</head>
<body>
  <!-- header -->
  <jsp:include page="../layout/header.jsp"></jsp:include>

  <!-- content-->
  <div class="wrap">

    <div class="wrap-title">
      <span class="left">교환</span>
    </div>

    <div class="wrap-table">
      <table id="table">
        <caption>교환 내역 테이블</caption>
        <tbody>
        <tr>
          <th class="num">번호</th>
          <th>상품정보(옵션/수량)</th>
          <th>교환일자</th>
          <th>주문번호</th>
          <th>배송조회</th>
          <th>교환취소</th>
        </tr>
        <tr class="table-child">
          <td>1</td>
          <td class="product-info">
            <div class="product-content">
              <div class="product-img">
                <span class="thisisnever_img"></span>
              </div>
              <div class="product-detail">
                <a href="#">[thisisnever]</a><br/>
                Mesh Football Jersey Navy
                <div class="option-text">옵션 : M / 수량 : 1</div>
              </div>
            </div>
          </td>
          <td>2025-01-15</td>
          <td><a href="">2025011500001234</a></td>
          <td>
            <button class="btn btn-outline-secondary" type="button" onclick="openModal()">배송조회</button>
          </td>
          <td>
            <button class="btn btn-outline-secondary" type="button">교환취소</button>
          </td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
          <td colspan="6" class="height">1페이지 중 1페이지</td>
        </tr>
        <tr>
          <td colspan="6">
            <nav aria-label="Page navigation example" class="wrap-pagination">
              <ul class="pagination">
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
          </td>
        </tr>
        </tfoot>
      </table>
    </div>

    <!-- 배송조회 모달 -->
    <div id="deliveryModal" class="modal">
      <div class="modal-content">
        <button type="button" class="close-btn" onclick="closeModal()">X</button>
        <h3>교환 배송 조회</h3><hr/>
        <h4>회수지 정보</h4>
        <br>
        <div class="wrap-modal-title">
          <span class="left">홍길동</span>
          <a href="#" class="right">회수지 변경</a>
        </div>
        <p>
          <span class="option-text">010-1111-2222</span><br/>
          <span>서울특별시 동작구 보라매로5길 15 1층 101호</span>
        </p>
        <hr/>
      </div>
    </div>

  </div>
  <!-- footer -->
  <jsp:include page="../layout/footer.jsp"></jsp:include>

  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <script>
    // 모달 열기
    function openModal() {
      document.getElementById("deliveryModal").style.display = "block";
      // 모달이 열리면 window.onclick 이벤트를 활성화하여 외부 클릭 시 닫히도록 처리
      window.onclick = function(event) {
        var modal = document.getElementById("deliveryModal");
        if (event.target == modal) {
          closeModal(); // 모달 바깥 부분을 클릭하면 닫기
        }
      };
    }
    // 모달 닫기
    function closeModal() {
      document.getElementById("deliveryModal").style.display = "none";
      // 모달을 닫을 때 window.onclick 이벤트 리셋 (외부 클릭에 의한 닫기를 방지)
      window.onclick = null;
    }
  </script>
</body>
</html>
