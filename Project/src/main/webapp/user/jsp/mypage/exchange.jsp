<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
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
                            <button class="btn btn-outline-secondary" type="button" data-toggle="modal" data-target="#deliveryModal">배송 조회</button>
                        </td>
                        <td>
                            <button class="btn btn-outline-secondary" type="button">교환 취소</button>
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
    </div>

    <!-- footer -->
    <jsp:include page="../layout/footer.jsp"></jsp:include>

    <!-- 배송조회 모달 -->
    <div class="modal fade" id="deliveryModal" tabindex="-1" role="dialog" aria-labelledby="deliveryModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deliveryModalTitle">교환 배송 조회</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
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
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
