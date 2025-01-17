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
    <title>주문 상세 조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h3 class="center">주문 정보</h3>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#orderDetailModal">
        주문 상세 보기
    </button>

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
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#cancelReasonModal">
                        취소
                    </button>
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
                                <option value="배송 지연">배송 지연</option>
                                <option value="상품 문제">상품 문제</option>
                                <option value="단순 변심">단순 변심</option>
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
</div>
<tr>
    <td>${product.prod_no}</td>
    <td>
        <img src="${product.imagePath}" class="card-img-top product-image" alt="Product Image">
    </td>
    <td>
        <a href="Controller?type=productEdit&b_idx=${product.prod_no}">
            ${product.prod_name}
        </a>
    </td>
    <td>${product.price}원</td>
    <td>${product.sale_price}원</td>
    <td>
        <label>재고 : ${product.inventory}</label><br/>
        <input class="stock" type="number" name="stock" value="${product.inventory}">
        <button type="button" onclick="changeStock(this)">변경</button>
    </td>
    <td>
        <select>
            <option value="1" ${product.active == 1 ? 'selected' : ''}>판매</option>
            <option value="2" ${product.active == 2 ? 'selected' : ''}>판매중지</option>
        </select>
    </td>
    <td>
        <button type="button" onclick="deleteRecord(this)">삭제</button>
    </td>
</tr>`;
tableBody.append(row)

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>