<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>Musinsa</title>

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/common/common.css"/>
    <link rel="stylesheet" type="text/css" href="./user/css/cart/cart.css"/>
</head>
<body>
    <%-- header --%>
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <c:if test="${requestScope.userInfo ne null}">
        <c:set var="user" value="${requestScope.userInfo}"/>
    </c:if>

    <%-- content --%>
    <div class="wrap">
        <div class="row">
            <div class="container">
                <!-- Breadcrumb Section -->
                <div class="breadcrumb-container">
                    <span>무신사 스토어 > 장바구니</span>
                </div>

                <!-- My Page Section -->
                <div class="text-title">
                    <div class="title-left">
                        <h3>장바구니</h3>
                    </div>
                    <div class="title-right">
                        <span class="current">장바구니</span>
                        <span>&gt;</span>
                        <span>주문서</span>
                        <span>&gt;</span>
                        <span>주문완료</span>
                    </div>
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
                        <c:set var="cnt" value="5"/>
                        <c:forEach begin="1" end="${cnt}" varStatus="st">
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
                                                    <button type="button" class="btn btn-outline-dark" onclick="onShowOption()">옵션 변경</button>
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
                                    <button type="button" class="btn btn-secondary">-</button>
                                    <span>5</span>
                                    <button type="button" class="btn btn-secondary">+</button>
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
                            <button type="button" class="btn btn-outline-dark">전체 삭제</button>
                            <button type="button" class="btn btn-outline-dark">선택 삭제</button>
                        </div>
                    </div>
                    <div class="cart-button">
                        <button type="button" class="btn btn-dark" onclick="location.href='Controller?type=payment'">주문하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- footer --%>
    <jsp:include page="../layout/footer.jsp"></jsp:include>

    <%-- modal --%>
    <div class="modal fade" id="optionModal" tabindex="-1" role="dialog" aria-labelledby="optionModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">옵션 변경</h5>
                </div>
                <div class="modal-body">
                    <select class="color-select" id="color">
                        <option>검정</option>
                        <option>네이비</option>
                        <option>아이보리</option>
                    </select>
                    <select class="size-select" id="size">
                        <option>S</option>
                        <option>M</option>
                        <option>L</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-dark" onclick="onHideOption()">취소</button>
                    <button type="button" class="btn btn-outline-dark">변경하기</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <script>
        // 옵션 변경 모달 닫기
        function onShowOption() {
            let modal = new bootstrap.Modal(document.getElementById('optionModal'));
            modal.show();
        }

        // 옵션 변경 모달 닫기
        function onHideOption() {
            let modal = new bootstrap.Modal(document.getElementById('optionModal'));
            modal.hide();
        }
    </script>
</body>
</html>
