<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>Musinsa</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="./user/css/alarm/alarm.css"/>
</head>
<body>
    <!-- header -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <div class="wrap">
        <div class="row">
            <div class="container">
                <div class="alarm-header">
                    <h2>알림</h2>
                </div>

                <div class="alarm-tabs">
                    <ul class="nav nav-tabs" id="alarmTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="tab-all" data-toggle="tab" href="#table-all" role="tab">전체</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="tab-sale" data-toggle="tab" href="#table-sale" role="tab">세일/쿠폰</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="tab-snap" data-toggle="tab" href="#table-snap" role="tab">스냅</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="tab-review" data-toggle="tab" href="#table-review" role="tab">후기</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="tab-order" data-toggle="tab" href="#table-order" role="tab">주문/배송</a>
                        </li>
                    </ul>
                </div>

                <div class="tab-content">
                    <table id="table-all" class="table tab-pane fade show active" role="tabpanel">
                        <tbody>
                        <tr>
                            <td>전체 알림 내용</td>
                        </tr>
                        </tbody>
                    </table>
                    <table id="table-sale" class="table tab-pane fade" role="tabpanel">
                        <tbody>
                        <tr>
                            <td>세일/쿠폰 알림 내용</td>
                        </tr>
                        </tbody>
                    </table>
                    <table id="table-snap" class="table tab-pane fade" role="tabpanel">
                        <tbody>
                        <tr>
                            <td>스냅 알림 내용</td>
                        </tr>
                        </tbody>
                    </table>
                    <table id="table-review" class="table tab-pane fade" role="tabpanel">
                        <tbody>
                        <tr>
                            <td>후기 알림 내용</td>
                        </tr>
                        </tbody>
                    </table>
                    <table id="table-order" class="table tab-pane fade" role="tabpanel">
                        <tbody>
                        <tr>
                            <td>주문/배송 알림 내용</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- footer -->
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>

    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="./user/js/alarm/alarm.js"></script>
</body>
</html>
