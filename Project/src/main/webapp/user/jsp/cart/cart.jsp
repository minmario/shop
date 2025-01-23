<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>무신사</title>

    <%-- Google Font : Gothic A1 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/cart/cart.css"/>
</head>
<body>
    <c:choose>
        <c:when test="${not empty sessionScope.customer_info}">
            <%-- header --%>
            <jsp:include page="../layout/header.jsp"></jsp:include>

            <div class="wrap">
                <div class="row">
                    <div class="container">
                        <!-- My Page Section -->
                        <div class="text-title">
                            <h3>장바구니</h3>
                        </div>

                        <!-- Cart Section -->
                        <div class="cart-section-container" id="cart-article">
                            <table id="cart-table" class="table">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>상품정보</th>
                                        <th>개별 판매가</th>
                                        <th>수량</th>
                                        <th><input type="checkbox" id="cart-all"/></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach begin="1" end="5" varStatus="st">
                                        <tr>
                                            <td class="order-id">${st.index}</td>
                                            <td class="product-info">
                                                <div class="prod_info">
                                                    <div class="prod_img">
                                                        <img src="./user/images/product2.jpg"/>
                                                    </div>
                                                    <div class="prod_details">
                                                        <div class="prod_brand">
                                                            [페이퍼리즘]
                                                        </div>
                                                        <div class="prod_name">
                                                            ZIGGY LIGHTING 3/4 SLV T-SHIRT
                                                        </div>
                                                        <div class="prod_option">
                                                            <div class="prod_option_left">옵션&nbsp;:&nbsp;</div>
                                                            <div class="prod_option_center">RED&nbsp;/&nbsp;1 Size</div>
                                                            <div class="prod_option_right">
                                                                <button type="button" class="btn btn-outline-secondary option-change-btn" data-toggle="modal" data-target="#optionModal">옵션 변경</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="product-price">
                                                <del class="default-price">59,000원</del>
                                                <div class="sale-price">39,900원</div>
                                            </td>
                                            <td class="cart-count">
                                                <button type="button" class="btn btn-secondary btn-minus">-</button>
                                                <span class="cart-count-value">0</span>
                                                <button type="button" class="btn btn-secondary btn-plus">+</button>
                                            </td>
                                            <td>
                                                <input type="checkbox" name="chk-cart"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="cart-notice">
                                <div class="cart-notice-left">
                                    <ol>
                                        <li>무신사 스토어는 기본적으로 대한민국 내 제주도 및 도서 산간 지역 포함 <strong class="cart-notice-emphasize">전 지역, 전 상품
                                            무료배송입니다.</strong></li>
                                        <li>2개 이상의 브랜드를 주문하신 경우, 개별 배송됩니다.</li>
                                        <li>해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도 표기되어 있습니다.</li>
                                        <li>장바구니에는 최대 10개의 상품을 보관할 수 있으며, 주문당 한번에 주문 가능한 상품수는 10개로 제한됩니다.</li>
                                    </ol>
                                </div>
                                <div class="cart-notice-right">
                                    <button type="button" class="btn btn-outline-dark delete-all-btn">전체 삭제</button>
                                    <button type="button" class="btn btn-outline-dark delete-selected-btn">선택 삭제</button>
                                </div>
                            </div>
                            <div class="cart-button">
                                <button type="button" class="btn btn-dark order-btn" onclick="location.href='Controller?type=payment'">주문하기</button>
                            </div>
                        </div>
                    </div>
                </div>

                    <%-- footer --%>
                <jsp:include page="../layout/footer.jsp"></jsp:include>
            </div>

            <%-- modal --%>
            <div class="modal fade" id="optionModal" tabindex="-1" role="dialog" aria-labelledby="optionModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">옵션 변경</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <select class="form-select color-select" id="color">
                                <option>검정</option>
                                <option>네이비</option>
                                <option>아이보리</option>
                            </select>
                            <select class="form-select size-select" id="size">
                                <option>S</option>
                                <option>M</option>
                                <option>L</option>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary cancel-btn" data-dismiss="modal">취소</button>
                            <button type="button" class="btn btn-outline-secondary confirm-btn">변경</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <script>
                window.location.href = "Controller?type=error";
            </script>
        </c:otherwise>
    </c:choose>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(function () {
            $(".cart-count").each(function () {
                const cartCountElement = $(this);
                const minusButton = cartCountElement.find(".btn-minus");
                const plusButton = cartCountElement.find(".btn-plus");
                const spanElement = cartCountElement.find(".cart-count-value");

                // - 버튼 클릭 이벤트
                minusButton.on("click", function () {
                    let count = parseInt(spanElement.text(), 10);
                    if (count > 0) {
                        count -= 1;
                        spanElement.text(count);
                    }
                });

                // + 버튼 클릭 이벤트
                plusButton.on("click", function () {
                    let count = parseInt(spanElement.text(), 10);
                    count += 1;
                    spanElement.text(count);
                });
            });

            // 배송지 체크 박스 전체 선택 / 해제 기능
            $("#cart-table #cart-all").on("click", function () {
                let ar = $("#cart-table > tbody").find(":checkbox");
                ar.prop("checked", this.checked);
            });

            // 배송지 체크 박스 개별 선택 / 해제 기능
            $("#cart-table > tbody").find(":checkbox").on("click", function () {
                let allCheck = true;
                $("#cart-table > tbody").find(":checkbox").not("#cart-table #cart-all").each(function () {
                    if (!this.checked) {
                        allCheck = false;
                        return allCheck;
                    }
                });
                $("#cart-table #cart-all").prop("checked", allCheck);
            });
        });
    </script>
</body>
</html>
