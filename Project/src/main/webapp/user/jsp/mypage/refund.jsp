<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../css/mypage/refund.css"/>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
                    <th>환불내역</th>
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
                    <td><a href="#">2025011500001234</a></td>
                    <td>
                        <button id="openModal" class="btn btn-outline-secondary" type="button" data-toggle="modal" data-target="#refundModal">환불 상세</button>
                    </td>
                    <td>
                        <button class="btn btn-outline-secondary" type="button">배송 조회</button>
                    </td>
                    <td>
                        <button class="btn btn-outline-secondary" type="button">환불 취소</button>
                    </td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="7" class="height">1페이지 중 1페이지</td>
                </tr>
                <tr>
                    <td colspan="7">
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

    <!-- 환불 상세 Modal -->
    <div class="modal fade" id="refundModal" tabindex="-1" role="dialog" aria-labelledby="refundModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="refundModalCenterTitle">환불 상세 보기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <section class="order-info">
                        <p>2022.11.23 09:37</p>
                        <p>주문번호 202211230935250004</p>
                    </section>
                    <section class="cancel-info">
                        <h2>환불 상품 1개</h2>
                        <p class="status">환불완료</p>
                        <div class="product">
                            <img src="./user/images/product5.jpg" alt="스파오 상품 이미지" class="product-image">
                            <div class="product-details">
                                <p class="brand">스파오</p>
                                <p class="product-name">플리스 후드 풀오버_SPFWC4TC04</p>
                                <p class="product-option">[19]BLACK - M[095] / 1개</p>
                                <p class="price">32,310원</p>
                            </div>
                        </div>
                        <div class="here">
                            <section class="cancel-request-info">
                                <h2>환불 신청 정보</h2>
                                <div class="cancel-details">
                                    <p><span>환불 일시</span> 2022-11-23 09:37:30</p>
                                    <p><span>완료 일시</span> 2022-11-23 09:37:30</p>
                                    <p><span>환불 사유</span> 고객변심(스타일)</p>
                                </div>
                            </section>
                            <section class="refund-info">
                                <h2>환불 정보</h2>
                                <div class="refund-details">
                                    <p><span>결제 내역</span><strong>32,310원</strong></p>
                                    <ul>
                                        <li><span>상품 결제금액</span> 34,823원</li>
                                        <li><span>통합 적립금 사용</span> 2,513원</li>
                                        <li><span>기본 배송비</span> 0원</li>
                                        <li><span>제주/도서산간 배송비</span> 0원</li>
                                    </ul>
                                    <p class="refund-amount"><span>환불 예정 금액</span><strong>32,310원</strong></p>
                                </div>
                                <p class="notice">* 주문 시 사용한 적립금 및 할인쿠폰은 취소완료 후 즉시 반환됩니다.</p>
                            </section>
                        </div>
                    </section>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <jsp:include page="../layout/footer.jsp"></jsp:include>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
