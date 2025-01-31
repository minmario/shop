<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>무신사</title>

    <%-- Google Font : Gothic A1 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/cancelOrder.css"/>
</head>
<body>
    <c:choose>
        <c:when test="${not empty sessionScope.customer_info}">
            <%-- header --%>
            <jsp:include page="../layout/header.jsp"></jsp:include>

            <c:if test="${requestScope.o_list eq null}">
                <script>
                    // alert("해당 주문의 정보를 불러올 수 없습니다.");
                    // window.location.href = "Controller?type=mypage";
                </script>
            </c:if>

            <div class="wrap">
                <div class="row">
                    <div class="container">
                        <c:if test="${requestScope.o_list ne null and requestScope.d_list ne null}">
                            <div class="cancel-order-title">주문 취소</div>
                            <div class="cancel-order-container">
                                <div class="select-all">
                                    <input type="checkbox" id="select-all">
                                    <label for="select-all">전체 선택</label>
                                </div>
                                <c:forEach var="product" items="${requestScope.o_list}" varStatus="status">
                                    <div class="product-item">
                                        <input type="hidden" name="prod_no" value="${product.prod_no}"/>
                                        <input type="hidden" id="cancel-point-used" value="${requestScope.o_list[0].point_amount}"/>
                                        <input type="checkbox" id="product${status.index}">
                                        <label for="product${status.index}" class="product-label">
                                            <img src="${product.prod_image != null && not empty product.prod_image ? fn:split(product.prod_image, ',')[0] : './user/images/product1.jpg'}" alt="상품 이미지" class="product-img">
                                            <div class="product-details">
                                                <p class="product-brand">${product.brand}</p>
                                                <p class="product-name">${product.prod_name}<br>${product.option_name} / ${product.count}개</p>
                                                <p class="product-price" data-price="${not empty product.prod_saled_price ? product.prod_saled_price : product.prod_price}">
                                                    <fmt:formatNumber value="${not empty product.prod_saled_price ? product.prod_saled_price : product.prod_price}"/>원
                                                </p>
                                            </div>
                                        </label>
                                    </div>
                                </c:forEach>
                                <div class="cancel-reason">
                                    <h5>취소 사유</h5>
                                    <div class="reason-item">
                                        <input type="radio" id="reason1" name="cancelReason" value="reason1">
                                        <label for="reason1">단순 변심 (상품이 필요 없어짐)</label>
                                    </div>
                                    <div class="reason-item">
                                        <input type="radio" id="reason2" name="cancelReason" value="reason2">
                                        <label for="reason2">주문 실수 (상품 또는 수량 잘못 선택, 추가 재주문)</label>
                                    </div>
                                    <div class="reason-item">
                                        <input type="radio" id="reason3" name="cancelReason" value="reason3">
                                        <label for="reason3">다른 결제 수단으로 변경</label>
                                    </div>
                                    <div class="reason-item">
                                        <input type="radio" id="reason4" name="cancelReason" value="reason4">
                                        <label for="reason4">기타</label>
                                        <!-- 직접 입력 필드 -->
                                        <div id="custom-reason-input" class="custom-reason" style="display: none;">
                                            <input type="text" class="form-control" placeholder="취소 사유를 직접 입력하세요" name="customCancelReason">
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${requestScope.o_list[0].status != '0'}">
                                    <div class="refund-account">
                                        <h5>취소 계좌 정보</h5>

                                        <!-- 은행 선택 -->
                                        <div class="margin">
                                            <label for="cancel-bank-select" class="bold">은행 선택</label><br>
                                            <select class="form-select select" id="cancel-bank-select" name="bank">
                                                <option value="" selected disabled>:: 은행을 선택하세요 ::</option>
                                                <option value="KB국민은행">KB국민은행</option>
                                                <option value="신한은행">신한은행</option>
                                                <option value="우리은행">우리은행</option>
                                                <option value="NH농협은행">NH농협은행</option>
                                            </select>
                                        </div>

                                        <!-- 계좌 번호 입력 -->
                                        <div class="margin">
                                            <label for="account-number" class="bold">계좌번호</label><br>
                                            <input type="text" class="toggle" id="account-number" name="account-number" placeholder="계좌번호를 입력하세요"/><br/>
                                        </div>
                                    </div>
                                </c:if>
                                    <div class="cancel-refund-info">
                                        <h5>환불 정보</h5>
                                        <ul>
                                            <li><span>상품 결제 금액</span><span class="cancel-item-price">0원</span></li>
                                            <li><span>적립금 사용</span><span class="cancel-points-used">0원</span></li>
                                            <li><span>기본 배송비</span><span>무료</span></li>
                                            <li><span>환불 예정 금액</span><span class="cancel-refund-amount">0원</span></li>
                                        </ul>
                                    </div>
                                <div class="notice">
                                    <p>결제 시 사용한 적립금 및 할인 쿠폰은 취소 완료 즉시 반환됩니다.</p>
                                    <p>가상계좌(무통장입금)의 경우 최근 7일 이내 3회 이상 주문취소 시 결제수단 이용에 제한이 될 수 있습니다.</p>
                                </div>
                                <div class="cancel-button-container">
                                    <button class="btn btn-dark cancel-request-btn" onclick="cancelRequest()">취소 요청하기</button>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>

                <%-- footer --%>
                <jsp:include page="../layout/footer.jsp"></jsp:include>
            </div>
        </c:when>
        <c:otherwise>
            <script>
                alert("세션이 만료되었습니다. 다시 로그인해 주세요.");
                window.location.href = 'Controller?type=login';
            </script>
        </c:otherwise>
    </c:choose>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <%-- JS --%>
    <script src="./user/js/mypage/cancelOrder.js"></script>
</body>
</html>
