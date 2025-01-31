<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    request.setCharacterEncoding("UTF-8");
    String seller_no = (String) session.getAttribute("seller_no");
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
        .hide {
            display: none;
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
                <th><input type="checkbox" id="newAll" onclick="toggleAll(this)"></th>
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
            <c:if test="${ar != null}">
                <c:forEach var="order" items="${ar}">
                    <c:if test="${order.status == 0}">
                    <tr class="list">
                        <td><input type="checkbox" name="newBox"></td>
                        <td> <a href="#" class="text-primary"
                                onclick="setModal('${order.id}')">
                                ${order.tid}
                        </a></td>
                        <td>${order.cus_id}</td>
                        <td>${order.prod_no}</td>
                        <td>${order.prod_name}</td>
                        <td>${order.option_name}</td>
                        <td>${order.option_count}</td>
                        <td>${order.order_date}</td>
                        <td><button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#cancelReasonModal" style="height: 30px" onclick="cancelModal('${order.id}')" >
                            취소
                        </button> </td>
                    </tr>
                    </c:if>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
        <button type="button" id="ready_btn" onclick="processSelected(this)" class="btn btn-primary mb-4">발송 준비</button>
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
                <col width="100px">
                <col width="120px">
                <col width="*">
                <col width="80px">
                <col width="120px">
                <col width="120px">
                <col width="140px">
                <col width="100px">


            </colgroup>
            <thead>
            <tr class="center">
                <th><input type="checkbox" id="readyAll" onclick="toggleAll(this)"></th>
                <th>주문번호</th>
                <th>ID</th>
                <th>상품명</th>
                <th>옵션</th>
                <th>수량</th>
                <th>주문 상태</th>
                <th>주문 일자</th>
                <th>송장번호</th>

            </tr>
            </thead>
            <tbody>
            <c:if test="${ar != null}">
                <c:forEach var="order" items="${ar}">
                    <c:if test="${order.status eq '1' || order.status eq '2'}">
                        <tr class="list">
                            <td><input type="checkbox" name="readyBox"></td>
                            <td> <a href="#" class="text-primary" onclick="setModal('${order.id}')" >
                                ${order.tid}
                            </a></td>
                            <td>${order.id}</td>
                            <td>${order.prod_name}</td>
                            <td>${order.option_name}</td>
                            <td>${order.option_count}</td>
                            <td>
                                <c:if test="${order.status eq 1}">발송 준비</c:if>
                                <c:if test="${order.status eq 2}">발송 완료</c:if>
                            </td>
                            <td>${order.order_date}</td>
                            <td>64161651</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
        <button type="button" id="done_btn"onclick="processSelected(this)" class="btn btn-primary mb-4">발송 완료</button>
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
                <col width="100px">
            </colgroup>
            <thead>
            <tr class="center">
                <th><input type="checkbox" id="returnAll"onclick="toggleAll(this)"></th>
                <th>주문번호</th>
                <th>구분</th>
                <th>상태</th>
                <th>반품/교환 요청일</th>
                <th>거부</th>

            </tr>
            </thead>
            <tbody>
            <c:if test="${ar != null}">
                <c:forEach var="order" items="${ar}">
                    <c:if test="${order.status eq 3 or order.status eq 4 or order.status eq 5 or order.status eq 6 or
                    order.status eq 7}">
                        <tr class="list">
                            <td><c:if test="${order.status eq 3 or order.status eq 5}">
                            <input type="checkbox" name="returnBox">
                            </c:if></td>
                            <td> <a href="#" class="text-primary" onclick="setModal('${order.id}')" >
                                    ${order.tid}
                            </a></td>
                            <td id="division">
                                <c:if test="${order.status eq 3 or order.status eq 4}">교환</c:if>
                                <c:if test="${order.status eq 5 or order.status eq 6 or order.status eq 7}">반품</c:if>
                            </td>
                            <td>
                                <c:if test="${order.status eq 3}">교환 신청</c:if>
                                <c:if test="${order.status eq 4}">교환 거부</c:if>
                                <c:if test="${order.status eq 5}">반품 신청</c:if>
                                <c:if test="${order.status eq 6}">반품 완료</c:if>
                                <c:if test="${order.status eq 7}">반품 거부</c:if>
                            </td>
                            <td>${order.order_date}</td>
                            <td><button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#cancelReasonModal" style="height: 30px" onclick="cancelModal('${order.id}')" >
                                거부사유 입력
                            </button> </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
        <button type="button" id="return_btn" onclick="processSelected(this)" class="btn btn-primary mb-4">일괄 처리</button>
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
                <table id="reasonTable" class="table table-bordered" style="display:none;">
                    <tbody>
                        <tr>
                            <th id="thSet" >반품 사유</th>
                            <Td id="reason"></Td>
                        </tr>
                    </tbody>
                </table>
                <table id="tables" class="table table-bordered">
                    <tbody>
                    <tr>
                        <th>주문 번호</th>
                        <td id="order_no"></td>
                    </tr>
                    <tr>
                        <th>ID</th>
                        <td id="cus_id"></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td id="cus_name"></td>
                    </tr>
                    <tr>
                        <th>상품명</th>
                        <td id="prod_name"></td>
                    </tr>
                    <tr>
                        <th>옵션</th>
                        <td id="option_name"></td>
                    </tr>
                    <tr>
                        <th>수량</th>
                        <td id="count"></td>
                    </tr>
                    <tr>
                        <th>주문 일자</th>
                        <td id="order_date"></td>
                    </tr>
                    <tr>
                        <th>상태</th>
                        <td id="order_status"></td>
                    </tr>
                    </tbody>
                </table>

                <!-- 배송지 정보 -->
                <h5>배송지 정보</h5>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <th>수취인명</th>
                        <td id="deli_name"></td>
                    </tr>
                    <tr>
                        <th>송장 번호</th>
                        <td id="invoice"></td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td id="phone"></td>
                    </tr>
                    <tr>
                        <th>주소 1 </th>
                        <td id="addr1"></td>
                    </tr>
                    <tr>
                        <th>주소 2</th>
                        <td id="addr2"></td>
                    </tr>

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
                            <option value="1">상품 품절</option>
                            <option value="2">상품 하자 발견</option>
                            <option value="3">판매 임시 중지</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="cancelDetails" class="form-label">상세 취소 사유</label>
                        <textarea class="form-control" id="cancelDetails" name="cancelDetails" rows="4" required></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" form="cancelForm" id="cancelSubmit">전송</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script>
   /* window.onload = function() {
        const today = new Date();

        // 연, 월, 일 포맷을 맞추기 위해서
        const year = today.getFullYear();
        const month = String(today.getMonth() + 1).padStart(2, '0');  // 월은 0부터 시작하므로 1을 더해줍니다.
        const day = String(today.getDate()).padStart(2, '0');

        // "YYYY-MM-DD" 형식으로 날짜를 설정
        const formattedDate = year+`-`+month+`-`+day;

        // orderEnd 입력 필드에 오늘 날짜 설정
        document.getElementById('orderEnd').value = formattedDate;
    };*/
    function setModal(order_no) {
        const param = "type=orderOne&order_no=" + encodeURIComponent(order_no);
        $.ajax({
            url: "Controller",
            type: "post",
            data: param,
            dataType: "json",
        }).done(function (res) {
            $("#cus_id").text(res.cus_id);
            $("#prod_name").text(res.prod_name);
            $("#cus_name").text(res.cus_name);
            $("#option_name").text(res.option_name);
            $("#order_no").text(res.order_no);
            $("#count").text(res.count);
            $("#order_date").text(res.order_date);
            $("#order_status").text(res.order_status);
            $("#deli_name").text(res.deli_name);
            $("#phone").text(res.phone);
            $("#addr1").text(res.addr1);
            $("#addr2").text(res.addr2);
            const status = parseInt(res.order_status);
            if(status > 3) {
                    console.log(status);
                if(status<5)
                    $("#thSet").text("교환 사유");
                else
                    $("#thSet").text("반품 사유");
                $("#reason").text(res.reason);
                $("#reasonTable").show();
            }
            else
                $("#reasonTable").hide();
            // 테이블 요소 가져오기

            // 모달 열기 (부트스트랩 5 기준)
            let orderModal = new bootstrap.Modal(document.getElementById("orderDetailModal"));
            orderModal.show();
        }).fail(function (xhr, status, error) {
            console.error("AJAX 요청 실패:", error);
        });

    }
    // 전체 선택 체크박스 기능
    function toggleAll(source) {
        let box;
        let boxes_id = source.id;
        if(boxes_id === 'newAll')
            box = 'newBox';
        else if(boxes_id === 'readyAll')
            box = 'readyBox'
        else if(boxes_id === 'returnAll')
            box = 'returnBox'
        const checkboxes = document.getElementsByName(box);
        for(var i=0, n=checkboxes.length; i<n; i++) {
            checkboxes[i].checked = source.checked;
        }
    }

    // 선택된 항목 처리
    function processSelected(button) {
        const selectedOrders = [];
        let checkboxes = [];
        let status=[];
        let chk = false;
        if (button.id === "ready_btn") {
            checkboxes = document.querySelectorAll('input[name="newBox"]:checked');
            status[0] = 1;
        } else if (button.id === "done_btn") {
            checkboxes = document.querySelectorAll('input[name="readyBox"]:checked');
            status[0] = 2;
        } else if (button.id === "return_btn"){
            checkboxes = document.querySelectorAll('input[name="returnBox"]:checked')
            chk = true;
        }

        let i=0;
       checkboxes.forEach(checkbox => {
           // checkbox가 속한 tr 요소를 찾아서 그 안의 td 값 추출
           const row = checkbox.closest('tr');  // 체크박스가 속한 <tr> 찾기
           const orderValue = row.querySelector('td:nth-child(2)').textContent;// 두 번째 <td>의 값 가져오기
           const division = row.querySelector('td:nth-child(3)').textContent.trim();
           if (chk) {
               if (division === '반품')
                   status[i] = 6;
               else if (division === '교환')
                   status[i] = 2;
           }

            selectedOrders.push(orderValue);
            i++;
        });
        const param = "type=changeStatus&selectedOrders="+encodeURIComponent(selectedOrders.join(','))+"&status="+encodeURIComponent(status.join(','));
        $.ajax({
            url: "Controller",
            type: "post",
            data: param,
            dataType: "json",
        }).done(function(res){
            if(res.cnt>0){
                location.reload();
                let message;
                switch (status[0]){
                    case 1:
                        message ="주문 접수 완료!";
                        break;
                    case 2:
                        message="상품 발송 완료!";
                        break;
                    case 6:
                        message="환불/반품 완료!"
                        break;
                    case 4:
                        message="교환 거부 사유를 보냈습니다."
                        break;
                    case 7:
                        message="반품 거부 사유를 보냈습니다.";
                        break;
                }
                alert(message);
            }else{
                alert("변경 실패")

            }
        });
    }
    // 취소 모달
   function cancelModal(order_no){
        $("#cancelSubmit").on("click",function(){
            const cancelReason = $("#cancelReason").val();
            const cancelDetails = $("#cancelDetails").val();

            // 취소 사유와 상세 사유가 입력되지 않았다면 처리하지 않도록 조건 추가
            if (!cancelReason || !cancelDetails) {
                alert("취소 사유와 상세 사유를 모두 입력해주세요.");
                return;
            }
            const userConfirmed = confirm("정말로 삭제하시겠습니까?");
            if (!userConfirmed) {
                return; // 사용자가 "취소"를 클릭하면 아무 작업도 하지 않음
            }
            // 예시로, 서버에 데이터를 전송하는 코드 (AJAX)
            $.ajax({
                url: "cancelOrder?type=cancelOrder",  // 취소 요청을 처리할 서버 URL
                type: "POST",
                data: {
                    order_no: order_no,
                    cancelReason: cancelReason,
                    cancelDetails: cancelDetails
                },
                success: function(response) {
                    // 서버에서 취소가 정상적으로 처리되었을 때의 동작
                    alert("주문 취소가 완료되었습니다.");
                    // 취소 후 모달 닫기
                    $('#cancelReasonModal').modal('hide');
                },
                error: function(xhr, status, error) {
                    // 서버 요청 실패 시의 처리
                    console.error("취소 요청 실패:", error);
                    alert("취소 요청에 실패했습니다. 다시 시도해주세요.");
                }
            });
        });
   }
</script>
</body>
<footer>
    <jsp:include page="./layout/footer.jsp"></jsp:include>
</footer>
</html>