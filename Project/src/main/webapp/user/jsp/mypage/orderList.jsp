<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../css/mypage/orderList.css"/>
</head>
<body>
    <!-- header -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <!-- content -->
    <div class="wrap">

        <div class="wrap-title">
            <span class="left">주문조회</span>
            <span class="right">주문 0건</span>
        </div>

        <div class="wrap-table">
            <table id="table">
                <caption>주문 정보 테이블</caption>
                <tbody>
                    <tr>
                        <th class="num">번호</th>
                        <th>상품정보(옵션/수량)</th>
                        <th>주문일자</th>
                        <th>주문번호</th>
                        <th>배송조회</th>
                        <th>
                            결제금액<br/>
                            (결제방법)
                        </th>
                        <th>
                            적립금<br/>
                            (선할인)
                        </th>
                        <th>주문상태</th>
                        <th>교환/환불</th>
                    </tr>
                    <c:set var="cnt" value="3"/>
                    <c:forEach begin="1" end="${cnt}" varStatus="st">
                        <tr class="table-child">
                        <td>${st.index}</td>
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
                        <td><a href="javascript:void(0);" onclick="openModal()">배송조회</a></td>
                        <td>
                            29,000<br/>
                            (무통장입금)
                        </td>
                        <td>
                            549<br/>
                            (-0)
                        </td>
                        <td>주문확정</td>
                        <td>
                            <button type="button" class="btn btn-outline-secondary">환불신청</button>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="9">1페이지 중 1페이지</td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <nav aria-label="Page navigation example">
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
                <h2>배송 조회</h2>
                <p>배송 조회 내용을 여기에 표시합니다.</p>
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
