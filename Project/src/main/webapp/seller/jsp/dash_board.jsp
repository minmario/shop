<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 이승범
  Date: 25. 2. 3.
  Time: 오전 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="./layout/header.jsp"/>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .fix-height{
            height: 100px;
        }
        .row {
            line-height: 75px;
        }
        .red{
            color: red;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <div class="card mb-3">
        <div class="card-header bg-primary text-white">주문/배송 현황</div>
        <div class="card-body fix-height">
            <div class="row text-center">
                <div class="col-md-4">
                    <c:if test="${newOrder != 0}">
                        <span class="red">new!</span>
                    </c:if><label>신규 주문: </label>
                    <a href="Controller?type=orderList">
                    <span class="badge bg-secondary">${newOrder}건</span>
                </a></div>

                <div class="col-md-4 ">
                    <c:if test="${readyDeli != 0}">
                        <span class="red">new!</span>
                    </c:if><label>배송 준비: </label>
                    <a href="Controller?type=orderList" id="ready">
                    <span class="badge bg-secondary">${readyDeli}건</span>
                </a></div>
                <div class="col-md-4 ">
                    <c:if test="${returnProd != 0 || changeProd != 0}">
                        <span class="red">new!</span>
                    </c:if><label>반품/교환 신청: </label>
                    <a href="Controller?type=orderList">
                    <span class="badge bg-secondary">${returnProd+changeProd}건</span>
                </a></div>
        </div>
        </div>
    </div>

    <div class="card mb-3">
        <div class="card-header bg-danger text-white">클레임/정산</div>
        <div class="card-body fix-height">
            <div class="row text-center">
                <div class="col-md-4 ">
                    <c:if test="${quest != 0}">
                        <span class="red">new!</span>
                    </c:if><label>문의 글: </label>
                    <a href="Controller?type=question" id="ready">
                        <span class="badge bg-secondary">${quest}건</span>
                    </a></div>
                <div class="col-md-4">구매 확정: <span class="badge bg-secondary">0건</span></div>
            </div>
        </div>
    </div>

    <div class="card mb-3">
        <div class="card-header bg-success text-white">스토어 매출 통계</div>
        <div class="card-body" >
            <canvas id="salesChart"></canvas>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    var ctx = document.getElementById('salesChart').getContext('2d');
    var salesChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['1일', '2일', '3일', '4일', '5일', '6일', '7일'],
            datasets: [{
                label: '일별 매출',
                data: [10, 20, 15, 30, 25, 40, 35],
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderWidth: 2
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
</body>
<footer>
    <jsp:include page="./layout/footer.jsp"></jsp:include>
</footer>
</html>
