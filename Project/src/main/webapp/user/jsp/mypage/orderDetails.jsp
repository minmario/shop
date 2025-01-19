<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>Musinsa</title>

    <%-- Google Font : Gothic A1 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/orderDetails.css"/>
</head>
<body>
    <%-- header --%>
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <div class="wrap">
        <div class="row">
            <div class="container">
                <div class="order-details-title">주문 상세 내역</div>
                <div class="order-header">
                    <p>2025.01.17 10:51</p>
                    <p>주문번호 202501171049450001</p>
                </div>
                <div class="delivery-info">
                    <div class="info-header">
                        <p class="name">홍길동</p>
                        <button class="btn btn-outline-secondary btn-sm change-address-button" data-toggle="modal" data-target="#deliveryModal">배송지 변경</button>
                    </div>
                    <p class="phone">010-1234-5678</p>
                    <div class="address-row">
                        <p class="address">(04956) 서울 강남구 도산대로 12-5 3층</p>
                        <p class="request">문 앞에 놓아주세요.</p>
                    </div>
                </div>
                <div class="product-section">
                    <h5>주문 상품 1개</h5>
                    <p class="payment-status">결제완료</p>
                    <div class="product-item">
                        <img src="./user/images/product8.jpg" alt="상품 이미지" class="product-img">
                        <div class="product-details">
                            <div class="product-header">
                                <p class="product-brand"><strong>커버낫</strong></p>
                                <a href="#" class="product-link">판매자 정보</a>
                            </div>
                            <p class="product-name">[2PACK] 쿨 코튼 티셔츠 블랙+화이트<br>M / 1개</p>
                            <div class="product-price-row">
                                <p class="product-price">28,137원</p>
                                <button class="btn btn-outline-secondary btn-sm product-link">스냅 보기</button>
                            </div>
                        </div>
                    </div>
                    <div class="product-actions">
                        <button class="btn btn-outline-secondary cancel-button" onclick="location.href='Controller?type=cancelOrder'">주문 취소</button>
                        <button class="btn btn-outline-secondary option-button" data-toggle="modal" data-target="#optionModal">옵션 변경</button>
                    </div>
                </div>
                <div class="payment-info">
                    <h5>결제 정보</h5>
                    <div class="payment-header">
                        <a href="#" class="view-link">영수증 보기</a>
                        <a href="#" class="view-link">거래 명세서</a>
                    </div>
                    <ul class="payment-list">
                        <li><span>상품 금액</span> <span class="item-price">49,000원</span></li>
                        <li><span>할인 금액</span> <span class="discount">-18,490원</span></li>
                        <li><span>적립금</span> <span class="points-amount">-2,373원</span></li>
                        <li><span>배송비</span> <span class="shipping-fee">무료</span></li>
                        <li class="total">
                            <span class="payment-price">결제 금액</span>
                            <span class="final-price">
                                <span class="discount-percent">43%</span>
                                <span class="payment-amount">28,137원</span>
                            </span>
                        </li>
                        <li><span>결제 수단</span> <span class="payment-method">카드-농협카드(일시불)</span></li>
                    </ul>
                </div>
                <div class="benefits-info">
                    <div class="benefits-header">
                        <h5>이번 주문으로 받은 혜택</h5>
                        <span class="svg-icon" data-toggle="modal" data-target="#benefitsModal">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
                                <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z" />
                            </svg>
                        </span>
                    </div>
                    <ul class="benefits-list">
                        <li><span>총 할인 금액</span> <span>20,863원</span></li>
                        <li><span>LV. 5 실버 2% 적립</span> <span>678원</span></li>
                        <li><span>구매 추가 적립</span> <span>34원</span></li>
                        <li><span>배송비</span> <span>무료</span></li>
                        <li><span>후기 적립</span> <span>최대 3,500원</span></li>
                        <li class="total-benefits"><span class="result-benefits">받은 총 혜택</span> <span class="result-price">25,075원</span></li>
                    </ul>
                </div>
            </div>
        </div>

        <%-- footer --%>
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>

    <%-- 혜택 안내 모달 --%>
    <div class="modal fade" id="benefitsModal" tabindex="-1" role="dialog" aria-labelledby="benefitsModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="benefitsModalTitle">이번 주문으로 받은 혜택 안내</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul>
                        <li>이번 주문으로 회원님이 받게 될 총 혜택 금액입니다.</li>
                        <li>혜택 금액은 상품 및 쿠폰 할인 등 할인금액, 보유 적립금 및 선할인 사용액, 그리고 해당 주문으로 받을 수 있는 최대 적립금액의 총합입니다.</li>
                    </ul>
                    <br/>
                    <h5>등급 적립</h5>
                    <ul>
                        <li>상품 구매 시 지급되는 등급별 적립금의 총합으로, 선할인 미적용 시 적립됩니다.</li>
                        <li>일부 적립 불가한 상품이 있을 수 있습니다.</li>
                    </ul>
                    <br/>
                    <h5>구매 추가 적립</h5>
                    <ul>
                        <li>상품 구매 시 등급 적립 외 추가적으로 지급되는 적립금입니다.</li>
                        <li>일부 적립 불가한 상품이 있을 수 있습니다.</li>
                    </ul>
                    <br/>
                    <h5>후기 적립</h5>
                    <ul>
                        <li>작성 가능한 모든 후기 작성 시 지급되는 적립금의 총합입니다.</li>
                        <li>상품에 따라 적립 금액은 상이할 수 있습니다.</li>
                    </ul>
                    <br/>
                    <h5>후기 추가 적립</h5>
                    <ul>
                        <li>일부 상품 선착순 구매 시 추가 지급되는 후기 적립금의 총합입니다.</li>
                        <li>후기 추가 적립 대상자는 구매 선착순으로 선정됩니다.(가상계좌 결제의 경우, 입금 완료 기준)<br/>
                            후기 추가 적립대상 여부는 결제완료 후 최대 1시간 정도 소요될 수 있습니다.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <%-- 배송지 변경 모달 --%>
    <div class="modal fade" id="deliveryModal" tabindex="-1" role="dialog" aria-labelledby="deliveryModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deliveryModalTitle">배송지 정보</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <button class="btn btn-outline-dark add-address-btn">배송지 추가하기</button>
                    <div class="address-item">
                        <input type="radio" id="address1" name="deliveryAddress" checked>
                        <label for="address1">
                            <span class="address-name">홍길동</span>
                            <span class="default-label">기본 배송지</span>
                            <p class="address-detail">서울 강남구 도산대로 12-5 3층<br>010-1234-5678</p>
                            <div class="action-buttons">
                                <button class="btn btn-outline-dark edit-btn">수정</button>
                            </div>
                        </label>
                    </div>
                    <div class="address-item">
                        <input type="radio" id="address2" name="deliveryAddress">
                        <label for="address2">
                            <span class="address-name">일지매</span>
                            <p class="address-detail">경기도 가평시 가평대로 22길 5층 505호<br>010-6325-1478</p>
                            <div class="action-buttons">
                                <button class="btn btn-outline-dark edit-btn">수정</button>
                                <button class="btn btn-outline-dark delete-btn">삭제</button>
                            </div>
                        </label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-dark confirm-btn">변경하기</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 옵션 변경 modal --%>
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
                    <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-outline-secondary">변경</button>
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
