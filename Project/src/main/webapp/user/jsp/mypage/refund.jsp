<%--
  Created by IntelliJ IDEA.
  User: 권나현
  Date: 2025-01-16
  Time: 오전 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" type="text/css" href="../../css/mypage/refund.css"/>
</head>
<body>
  <!-- header -->
  <jsp:include page="../layout/header.jsp"></jsp:include>

  <!-- content-->
  <div class="wrap">

    <div class="wrap-title">
      <span class="left">환불/취소</span>
    </div>

    <div class="wrap-table">
      <table id="table">
        <caption>환불/취소 내역 테이블</caption>
        <tbody>
        <tr>
          <th class="num">번호</th>
          <th>상품정보(옵션/수량)</th>
          <th>환불일자</th>
          <th>주문번호</th>
          <th>
            환불금액<br/>
            (적립금)
          </th>
          <th>배송조회</th>
          <th>환불취소</th>
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
              28,500<br/>
              (500)
            </td>
            <td>
              <button class="btn btn-outline-secondary" type="button" onclick="openModal()">배송조회</button>
            </td>
            <td>
              <button class="btn btn-outline-secondary" type="button">환불취소</button>
            </td>
          </tr>
        </tbody>
        <tfoot>
        <tr>
          <td colspan="9" class="height">1페이지 중 1페이지</td>
        </tr>
        <tr>
          <td colspan="9">
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
  </div>
  <!-- footer -->
  <jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
