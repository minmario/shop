<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String nickname = (String) session.getAttribute("nickname");
    boolean isLoggedIn = (nickname != null);
%>

<html>
<head>
    <jsp:include page="./layout/header.jsp"/>
    <title>배송현황</title>
    <style>
        .flex{
            display: flex;
        }
        .container {
            margin-top: 20px;
        }

        .filter-section {
            margin-bottom: 20px;
        }

        .table-container {
            margin-top: 20px;
        }

        .center {
            text-align: center;
        }
        h4 {
            margin: 20px 0;
        }
        .search{
            height: 40px;
            margin-top: 23px;
            margin-left: 5px;}
        .form-group{
            margin-right: 10px;
        }
        .list{
            text-align: center;
            height: 20px;
        }
        thead tr{
            background-color: #222222;
            color: white;
        }
    </style>
</head>
<body>


<div class="container mt-5" >
    <h3 class="center">주문/배송</h3>
    <hr/>
    <!-- 주문 현황 -->
    <h4>신규 주문</h4>

    <form method="GET" action="orderStatus.jsp">
        <div class="filter-section">
            <div class="form-row flex" >
                <div class="form-group col-md-3">
                    <label for="orderStart">시작일</label>
                    <input type="date" class="form-control" id="orderStart" name="orderStart">
                </div>
                <div class="form-group col-md-3">
                    <label for="orderEnd">종료일</label>
                    <input type="date" class="form-control" id="orderEnd" name="orderEnd">
                </div>

                <button type="submit" class="btn btn-primary mb-4 search">조회</button>
            </div>
        </div>
    </form>
    <div class="table-container ">
        <table class="table table-bordered">
            <colgroup>
                <col width="50px">
                <col width="120px">
                <col width="140px">
                <col width="100px">
                <col width="*">
                <col width="80px">
                <col width="100px">
                <col width="140px">
                <col width="80px">
            </colgroup>
            <thead>
            <tr class="center">
                <th><input type="checkbox" onclick="toggleAll(this)"></th>
                <th>주문번호</th>
                <th>ID</th>
                <th>상품번호</th>
                <th>상품명</th>
                <th>옵션</th>
                <th>수량</th>
                <th>주문일자</th>
                <th>취소</th>
            </tr>
            </thead>
            <tbody>
            <tr class="list">
                <td><input type="checkbox" name="orderBox"></td>
                <td>  <a href="#" class="text-primary" data-bs-toggle="modal" data-bs-target="#orderDetailModal" >
                    3122325
                </a></td>
                <td>vldhtmxk</td>
                <td>124566</td>
                <td>후드티</td>
                <td>XL</td>
                <td>1개</td>
                <td>2025-01-16</td>
                <td><button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#cancelReasonModal" style="height: 30px">
                    취소
                </button> </td>
            </tr>
            <c:forEach var="order" items="${orderList}">
                <tr>
                    <td><input type="checkbox"></td>
                    <td>${order.id}</td>
                    <td>${order.prod_no}</td>
                    <td>${order.prod_name}</td>
                    <td>${order.count}</td>
                    <td>${order.order_date}</td>
                    <td><button type="button" onclick="showDialog()" class="btn btn-primary mb-4">취소</button></td>
                </tr>
            </c:forEach>
            <c:if test="${empty orderList}">
                <tr>
                    <td colspan="9" class="center">조회된 데이터가 없습니다.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
        <button type="button" onclick="changeReady()" class="btn btn-primary mb-4">발송 준비</button>
    </div>
    <hr/>
    <!-- 배송 관리 -->
    <h4>배송 관리</h4>
    <form method="GET" action="delStatus.jsp">
        <div class="filter-section">
            <div class="form-row flex">
                <div class="form-group col-md-3">
                    <label for="delStart">시작일</label>
                    <input type="date" class="form-control" id="delStart" name="delStart">
                </div>
                <div class="form-group col-md-3">
                    <label for="delEnd">종료일</label>
                    <input type="date" class="form-control" id="delEnd" name="delEnd">
                </div>
                <div class="form-group col-md-3">
                    <label for="delStatus">주문 상태</label>
                    <select id="delStatus" name="delStatus" class="form-control">
                        <option value="">전체</option>
                        <option value="ready">발송 준비</option>
                        <option value="done">발송 완료</option>
                        <option value="exchange">교환 준비</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary mb-4 search">조회</button>
            </div>
        </div>
    </form>
    <div class="table-container">
        <table class="table table-bordered">
            <colgroup>
                <col width="50px">
                <col width="120px">
                <col width="140px">
                <col width="*">
                <col width="80px">
                <col width="120px">
                <col width="120px">
                <col width="140px">
                <col width="100px">
                <col width="140px">


            </colgroup>
            <thead>
            <tr class="center">
                <th><input type="checkbox" onclick="toggleAll(this)"></th>
                <th>주문번호</th>
                <th>ID</th>
                <th>상품명</th>
                <th>옵션</th>
                <th>수량</th>
                <th>주문 상태</th>
                <th>주문 일자</th>
                <th>배송사</th>
                <th>송장 번호</th>
            </tr>
            </thead>
            <tbody>
            <tr class="list">
                <td><input type="checkbox" name="delibox"></td>
                <td>  <a href="#" class="text-primary" data-bs-toggle="modal" data-bs-target="#orderDetailModal" >
                    3122325
                </a></td>
                <td>vldhtmxk</td>
                <td>후드티</td>
                <td>XL</td>
                <td>1개</td>
                <td>발송 준비</td>
                <td>2025-01-16</td>
                <td>cj대한통운</td>
                <td>215135489898</td>
            </tr>
            <c:forEach var="order" items="${orderList}">
                <tr>
                    <td>${order.orderNumber}</td>
                    <td>${order.prod_no}</td>
                    <td>${order.prod_name}</td>
                    <td>${order.count}</td>
                    <td>${order.order_code}</td>
                    <td>${order.deli_name}</td>
                    <td>${order.deli_no}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty orderList}">
                <tr>
                    <td colspan="10" class="center">조회된 데이터가 없습니다.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
        <button type="button" onclick="changeComplete()" class="btn btn-primary mb-4">발송 완료</button>
    </div>
    <hr/>
    <!-- 반품/교환 -->
    <h4>반품/교환</h4>
    <form method="GET" action="delStatus.jsp">
        <div class="filter-section ">
            <div class="form-row flex">
                <div class="form-group col-md-3">
                    <label for="Status">신청 상태</label>
                    <select id="Status" name="Status" class="form-control">
                        <option value="">전체</option>
                        <option value="exchange">교환</option>
                        <option value="return">반품</option>
                        <option value="done">반품완료</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary mb-4 search" >조회</button>
            </div>
        </div>
    </form>
    <div class="table-container">
        <table class="table table-bordered">
            <colgroup>
                <col width="50px">
                <col width="120px">
                <col width="140px">
                <col width="100px">
                <col width="100px">
                <col width="130">
                <col width="100px">
                <col width="80px">
            </colgroup>
            <thead>
            <tr class="center">
                <th><input type="checkbox" onclick="toggleAll(this)"></th>
                <th>주문번호</th>
                <th>ID</th>
                <th>구분</th>
                <th>상태</th>
                <th>반품/교환 요청일</th>
                <th>사유</th>
                <th>거부</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${orderList}">
                <tr>
                    <td><input type="checkbox"></td>
                    <td>${order.orderNumber}</td>
                    <td>${order.order_code}</td>
                    <td>${order.order_code}</td>
                    <td>${order.price}</td>
                    <td>${order.order_date}</td>
                    <td>${order.deliveryMethod}</td>
                    <td><button type="button" onclick="showDialog()" class="btn btn-primary mb-4">거부</button></td>
                </tr>
            </c:forEach>
            <c:if test="${empty orderList}">
                <tr>
                    <td colspan="8" class="center">조회된 데이터가 없습니다.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
        <button type="button" onclick="changeComplete()" class="btn btn-primary mb-4">일괄 처리</button>
    </div>
    <hr/>
</div>
<!-- 주문 상세 정보 모달 -->
<div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="orderDetailModalLabel">주문 상세 정보</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 주문 상세 정보 -->
                <h5>주문 상세 정보</h5>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <th>주문 번호</th>
                        <td>${order.orderNumber}</td>
                    </tr>
                    <tr>
                        <th>상품명</th>
                        <td>${order.productName}</td>
                    </tr>
                    <tr>
                        <th>상품 상태</th>
                        <td>${order.productStatus}</td>
                    </tr>
                    <tr>
                        <th>결제 상태</th>
                        <td>${order.paymentStatus}</td>
                    </tr>
                    </tbody>
                </table>

                <!-- 배송지 정보 -->
                <h5>배송지 정보</h5>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <th>수취인명</th>
                        <td>${order.recipientName}</td>
                    </tr>
                    <tr>
                        <th>연락처1</th>
                        <td>${order.contact1}</td>
                    </tr>
                    <tr>
                        <th>연락처2</th>
                        <td>${order.contact2}</td>
                    </tr>
                    <tr>
                        <th>배송지</th>
                        <td>${order.deliveryAddress}</td>
                    </tr>
                    <tr>
                        <th>배송 메모</th>
                        <td>${order.deliveryMemo}</td>
                    </tr>
                    </tbody>
                </table>

                <!-- 주문 처리 이력 -->
                <h5>주문 처리 이력</h5>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>처리 내용</th>
                        <th>처리 일시</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="history" items="${order.processHistory}">
                        <tr>
                            <td>${history.action}</td>
                            <td>${history.date}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty order.processHistory}">
                        <tr>
                            <td colspan="2" class="text-center">처리 이력이 없습니다.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>

</div>
<!-- 발송 취소 사유 모달 -->
<div class="modal fade" id="cancelReasonModal" tabindex="-1" aria-labelledby="cancelReasonModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="cancelReasonModalLabel">발송 취소 사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="cancelForm" method="post" action="cancelOrder">
                    <div class="mb-3">
                        <label for="cancelReason" class="form-label">취소 사유 선택</label>
                        <select class="form-select" id="cancelReason" name="cancelReason" required>
                            <option value="" selected disabled>취소 사유를 선택하세요</option>
                            <option value="soldout">상품 품절</option>
                            <option value="problem">상품 하자 발견</option>
                            <option value="temporary">판매 임시 중지</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="cancelDetails" class="form-label">상세 취소 사유</label>
                        <textarea class="form-control" id="cancelDetails" name="cancelDetails" rows="4" required></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary" form="cancelForm">전송</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script>
    // 전체 선택 체크박스 기능
    function toggleAll(source) {
        checkboxes = document.getElementsByName('orderCheckbox');
        for(var i=0, n=checkboxes.length; i<n; i++) {
            checkboxes[i].checked = source.checked;
        }
    }

    // 선택된 항목 처리
    function processSelected() {
        var selectedOrders = [];
        var checkboxes = document.getElementsByName('orderBox');
        for (var i=0; i<checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                selectedOrders.push(checkboxes[i].value);
            }
        }
        if (selectedOrders.length > 0) {
            // 선택된 주문에 대한 처리 로직을 여기에 추가합니다.
            alert('선택된 주문: ' + selectedOrders.join(', '));
        } else {
            alert('선택된 주문이 없습니다.');
        }
    }
</script>
</body>
<footer>
    <jsp:include page="./layout/footer.jsp"></jsp:include>
</footer>
</html>