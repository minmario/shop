<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>Musinsa</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/common/common.css"/>
    <link rel="stylesheet" type="text/css" href="./user/css/payment/payment.css"/>
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
                    <span>무신사 스토어 > 주문서</span>
                </div>

                <!-- My Page Section -->
                <div class="text-title">
                    <div class="title-left">
                        <h3>주문서</h3>
                    </div>
                    <div class="title-right">
                        <span>장바구니</span>
                        <span>&gt;</span>
                        <span class="current">주문서</span>
                        <span>&gt;</span>
                        <span>주문완료</span>
                    </div>
                </div>

                <!-- 배송 정보 -->
                <div class="delivery-info-container">
                    <div class="header">
                        <h3>테스트 <span class="badge">기본 배송지</span></h3>
                        <button class="change-address-btn">배송지 변경</button>
                    </div>
                    <p class="address">서울특별시 강남구 강남대로 113 8층 801호</p>
                    <p class="phone">010-1234-5678</p>
                    <div class="delivery-option-container">
                        <select class="delivery-options" id="delivery-options">
                            <option value="문 앞에 놔주세요">문 앞에 놔주세요</option>
                            <option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
                            <option value="택배함에 넣어주세요">택배함에 넣어주세요</option>
                            <option value="배송 전에 연락 주세요">배송 전에 연락 주세요</option>
                            <option value="직접 입력">직접 입력</option>
                        </select>
                    </div>
                    <textarea class="delivery-message" id="delivery-message" maxlength="50" placeholder="최대 50자까지 입력 가능합니다."></textarea>
                    <p class="char-count" id="char-count">0&nbsp;/&nbsp;50</p>
                </div>

                <%-- 주문 상품 --%>
                <div class="order-product-container">
                    <h3>주문 상품 1개</h3>
                    <div class="product-info">
                        <img src="./user/images/product3.jpg" alt="상품 이미지" class="product-image">
                        <div class="product-details">
                            <p class="product-name">리트리버클럽</p>
                            <p class="product-desc">RETRIEVER FRIENDS CREWNECK [MELANGE GRAY]</p>
                            <p class="product-size">M(논키로) / 4개</p>
                            <p class="product-price">
                                <span class="original-price">288,000원</span>
                                <span class="discounted-price">115,200원</span>
                            </p>
                        </div>
                    </div>
                    <button type="button" class="btn btn-outline-dark coupon-btn">쿠폰 사용</button>
                </div>

                <!-- 보유 적립금 사용 -->
                <div class="points-container">
                    <div class="points-left">
                        <h3>보유 적립금 사용</h3>
                        <span class="svg-icon" onclick="onShowPoints()">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z"/>
                            </svg>
                        </span>
                    </div>
                    <div class="points-input">
                        <input type="text"/>
                        <button type="button" class="btn btn-outline-dark">사용 취소</button>
                    </div>
                    <p class="points-info">적용한도(7%) 8,064원 / 보유 9,296원</p>
                </div>

                <!-- 구매 적립/선할인 -->
                <div class="reward-container">
                    <div class="reward-top">
                        <h3>구매 적립/선할인</h3>
                        <span class="svg-icon" onclick="onShowReward()">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z"/>
                            </svg>
                        </span>
                    </div>
                    <div class="reward-options">
                        <label><input type="radio" name="reward"> 구매 적립</label>
                        <label><input type="radio" name="reward"> 적립금 선할인</label>
                    </div>
                    <p class="reward-info">선할인 제한 상품이에요.</p>
                </div>

                <!-- 즉시 할인 -->
                <div class="instant-discount-container">
                    <h3>즉시 할인</h3>
                    <div class="checkbox-container">
                        <input type="checkbox" id="instant-discount">
                        <label for="instant-discount">
                            무신사 현대카드 즉시 할인 <span class="text-muted">(중복적용가능)</span>
                        </label>
                        <span class="discount-amount">-30,000원</span>
                    </div>
                    <div class="discount-options">
                        <div class="discount-card">
                            <img src="kakao.png" alt="카카오페이">
                            <p>-3,000원<br>카카오페이 × 페이머니</p>
                            <p class="option-desc">전 상품</p>
                        </div>
                        <div class="discount-card">
                            <img src="toss.png" alt="토스페이">
                            <p>-3,000원<br>토스페이 × 계좌/머니</p>
                            <p class="option-desc">전 상품</p>
                        </div>
                        <div class="discount-card">
                            <img src="musinsa.png" alt="무신사페이">
                            <p>-3,000원<br>무신사페이 × 하나카드</p>
                            <p class="option-desc">전 상품</p>
                        </div>
                        <div class="discount-card">
                            <img src="another.png" alt="기타">
                            <p>-3,000원<br>무신사페이 × 기타</p>
                            <p class="option-desc">전 상품</p>
                        </div>
                    </div>
                </div>

                <!-- 결제 수단 -->
                <div class="payment-methods-container">
                    <h3>결제 수단</h3>
                    <div class="radio-group">
                        <label><input type="radio" name="payment-method" onclick="toggleButtonGroup(false)"><img class="logo-finance" src="./user/images/logo-finance-toss.png"/>토스페이<span class="badge highlight">혜택</span></label>
                        <label><input type="radio" name="payment-method" onclick="toggleButtonGroup(false)"><img class="logo-finance" src="./user/images/logo-finance-kakaopay.png"/>카카오페이<span class="badge highlight">혜택</span></label>
                        <label><input type="radio" name="payment-method" onclick="toggleButtonGroup(false)"><img class="logo-finance" src="./user/images/logo-finance-payco.png"/>페이코<span class="badge">혜택</span></label>
                        <label><input type="radio" name="payment-method" onclick="toggleButtonGroup(true)" checked>기타 결제</label>
                    </div>
                    <div class="button-group">
                        <button class="radio-button">카드</button>
                        <button class="radio-button">가상계좌</button>
                        <button class="radio-button">휴대폰</button>
                        <button class="radio-button">삼성페이</button>
                        <button class="radio-button">네이버페이</button>
                        <button class="radio-button">KBPay <span class="badge">혜택</span></button>
                    </div>
                    <div class="select-group">
                        <select class="card-select" id="card-select">
                            <option>농협카드</option>
                            <option>신한카드</option>
                            <option>국민카드</option>
                        </select>
                        <select class="payment-select" id="payment-select">
                            <option>일시불</option>
                            <option>할부 (3개월)</option>
                            <option>할부 (6개월)</option>
                        </select>
                    </div>
                </div>

                <!-- 결제 금액 -->
                <div class="payment-details-container">
                    <h3>결제 금액</h3>
                    <ul>
                        <li>
                            <span>상품 금액</span>
                            <span>288,000원</span>
                        </li>
                        <li>
                            <span>할인 금액</span>
                            <span class="text-blue">-172,800원</span>
                        </li>
                        <li>
                            <span>적립금 사용</span>
                            <span class="text-blue">-8,064원</span>
                        </li>
                        <li>
                            <span>배송비</span>
                            <span>무료</span>
                        </li>
                        <li class="total">
                            <span>총 결제 금액</span>
                            <span class="text-red">63% 107,136원</span>
                        </li>
                    </ul>
                </div>

                <!-- 적립 혜택 -->
                <div class="reward-benefits-container">
                    <div class="reward-benefits-top">
                        <h3>적립 혜택</h3>
                        <span class="svg-icon" onclick="onShowRewardBenefits()">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z"/>
                            </svg>
                        </span>
                    </div>
                    <ul>
                        <li>
                            <span>LV.5 실버 · 2% 적립</span>
                            <span>2,304원</span>
                        </li>
                        <li>
                            <span>구매 추가 적립</span>
                            <span>116원</span>
                        </li>
                        <li>
                            <span>후기 적립금</span>
                            <span>최대 3,500원</span>
                        </li>
                    </ul>
                </div>

                <!-- 주문으로 받을 혜택 -->
                <div class="order-benefits-container">
                    <div class="order-benefits-top">
                        <div class="benefits-left">
                            <h5>이번 주문으로 받을 혜택</h5>
                            <span class="svg-icon" onclick="onShowBenefits()">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                    <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z"/>
                                </svg>
                            </span>
                        </div>
                        <div class="benefits-right">
                            <span class="text-blue total-benefit">186,784원</span>
                        </div>
                    </div>
                    <div class="order-benefits-bottom">
                        <p class="small-text">주문 내용을 확인했으며 결제에 동의합니다.</p>
                        <p class="small-text">회원님의 개인정보는 안전하게 관리됩니다.</p>
                        <p class="small-text">무신사는 통신판매중개자로, 업체 배송 상품의 상품/상품정보/거래 등에 대한 책임은 무신사가 아닌 판매자에게 있습니다.</p>
                    </div>
                </div>

                <!-- 결제하기 버튼 -->
                <div class="payment-button-container">
                    <button type="button" class="btn btn-dark">107,136원 결제하기</button>
                </div>
            </div>
        </div>
    </div>

    <%-- footer --%>
    <jsp:include page="../layout/footer.jsp"></jsp:include>

    <%-- 보유 적립금 모달 --%>
    <div class="modal fade" id="pointsModal" tabindex="-1" role="dialog" aria-labelledby="pointsModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="pointsModalTitle">보유 적립금</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div>
                        <ul>
                            <li>적립금은 회원 등급별 적립금 적용 한도 이내로 사용할 수 있습니다.</li>
                            <li>회원 등급별 적립금 적용 한도는 상품의 판매 가격을 기준으로 산정됩니다.</li>
                        </ul>
                        <div>
                            <table>
                                <thead>
                                <tr>
                                    <th>등급</th>
                                    <th>적용 한도</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th>전체</th>
                                    <td>판매가 기준 7%</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <ul>
                            <li>일부 상품은 적립금을 사용할 수 없습니다.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- 선결제 모달 --%>
    <div class="modal fade" id="rewardModal" tabindex="-1" role="dialog" aria-labelledby="rewardModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="rewardModalTitle">구매 적립/선할인 안내</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul>
                        <li>등급 적립과 선할인 중 1개의 혜택을 선택할 수 있습니다.</li>
                        <li>등급 적립은 상품을 구매할 때 지급되는 적립금으로 등급별로 적립률이 다릅니다.</li>
                        <li>선할인은 구매 후 지급받을 적립금을 구매 전에 미리 사용할 수 있는 기능으로, 선할인 선택 시 등급별 선할인율만큼 할인됩니다.</li>
                    </ul>
                    <div>
                        <table>
                            <thead>
                                <tr>
                                    <th>등급</th>
                                    <th>선할인율</th>
                                    <th>적립률</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th>Lv.1</th>
                                    <td colspan="2">제한</td>
                                </tr>
                                <tr>
                                    <th>Lv.2</th>
                                    <td>1%</td>
                                    <td>1%</td>
                                </tr>
                                <tr>
                                    <th>Lv.3</th>
                                    <td>1%</td>
                                    <td>1%</td>
                                </tr>
                                <tr>
                                    <th>Lv.4</th>
                                    <td>2%</td>
                                    <td>2%</td>
                                </tr>
                                <tr>
                                    <th>Lv.5</th>
                                    <td>2%</td>
                                    <td>2%</td>
                                </tr>
                                <tr>
                                    <th>Lv.6</th>
                                    <td>3%</td>
                                    <td>3%</td>
                                </tr>
                                <tr>
                                    <th>Lv.7</th>
                                    <td>3%</td>
                                    <td>3%</td>
                                </tr>
                                <tr>
                                    <th>Lv.8</th>
                                    <td>4%</td>
                                    <td>4%</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <ul>
                        <li>일부 상품은 등급 적립과 선할인 혜택을 받을 수 없습니다.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <%-- 적립 혜택 안내 모달 --%>
    <div class="modal fade" id="rewardBenefitsModal" tabindex="-1" role="dialog" aria-labelledby="rewardBenefitsModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="rewardBenefitsModalTitle">적립 혜택 안내</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="reward-section grade-reward">
                        <div class="reward-title">등급 적립</div>
                        <ul class="reward-list">
                            <li>상품 구매 시 지급되는 등급별 적립금의 총합으로, 선할인 미적용 시 적립됩니다.</li>
                            <li>일부 적립 불가한 상품이 있을 수 있습니다.</li>
                        </ul>
                    </div>
                    <div class="reward-section purchase-additional-reward">
                        <div class="reward-title">구매 추가 적립</div>
                        <ul class="reward-list">
                            <li>상품 구매 시 등급 적립 외 추가적으로 지급되는 적립금입니다.</li>
                            <li>일부 적립 불가한 상품이 있을 수 있습니다.</li>
                        </ul>
                    </div>
                    <div class="reward-section review-reward">
                        <div class="reward-title">후기 적립</div>
                        <ul class="reward-list">
                            <li>작성 가능한 모든 후기 작성 시 지급되는 적립금의 총합입니다.</li>
                            <li>상품에 따라 적립 금액은 상이할 수 있습니다.</li>
                        </ul>
                    </div>
                    <div class="reward-section review-additional-reward">
                        <div class="reward-title">후기 추가 적립</div>
                        <ul class="reward-list">
                            <li>일부 상품 선착순 구매 시 추가 지급되는 후기 적립금의 총합입니다.</li>
                            <li>후기 추가 적립 대상자는 구매 선착순으로 선정됩니다.(가상계좌 결제의 경우, 입금 완료 기준)</li>
                            <li>후기 추가 적립 대상 여부는 주문내역에서 최종 확인할 수 있으며 최대 1시간 정도 소요될 수 있습니다.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- 혜택 안내 모달 --%>
    <div class="modal fade" id="benefitsModal" tabindex="-1" role="dialog" aria-labelledby="benefitsModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="benefitsModalTitle">이번 주문으로 받을 혜택 안내</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul>
                        <li>이번 주문으로 회원님이 받게 될 총 혜택 금액입니다.</li>
                        <li>혜택 금액은 상품 및 쿠폰 할인 등 할인금액, 보유 적립금 및 선할인 사용액, 그리고 해당 주문으로 받을 수 있는 최대 적립금액의 총합입니다.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const deliveryOptions = document.getElementById("delivery-options");
            const deliveryMessage = document.getElementById("delivery-message");
            const charCount = document.getElementById("char-count");
            const buttons = document.querySelectorAll('.radio-button');

            deliveryOptions.addEventListener("change", (event) => {
                if (event.target.value === "직접입력") {
                    deliveryMessage.style.display = "block";
                    charCount.style.display = "block";
                    deliveryMessage.value = "";
                    charCount.innerText = "0/50";
                } else {
                    deliveryMessage.style.display = "none";
                    charCount.style.display = "none";
                    charCount.style.display = "none";
                }
            });

            deliveryMessage.addEventListener("keyup", () => {
                const currentLength = deliveryMessage.value.length;
                charCount.innerText = currentLength + "/50";
            });

            buttons.forEach(button => {
                button.addEventListener('click', () => {
                    buttons.forEach(btn => btn.classList.remove('active'));
                    button.classList.add('active');
                });
            });
        });

        function toggleButtonGroup(show) {
            const buttonGroup = document.querySelector('.button-group');
            const selectGroup = document.querySelector('.select-group');
            buttonGroup.style.display = show ? 'grid' : 'none';
            selectGroup.style.display = show ? 'flex' : 'none';
        }

        // 포인트 안내 모달 열기
        function onShowPoints() {
            let modal = new bootstrap.Modal(document.getElementById('pointsModal'));
            modal.show();
        }

        // 리워드 안내 모달 열기
        function onShowReward() {
            let modal = new bootstrap.Modal(document.getElementById('rewardModal'));
            modal.show();
        }

        // 적립 혜택 안내 모달 열기
        function onShowRewardBenefits() {
            let modal = new bootstrap.Modal(document.getElementById('rewardBenefitsModal'));
            modal.show();
        }

        // 혜택 안내 모달 열기
        function onShowBenefits() {
            let modal = new bootstrap.Modal(document.getElementById('benefitsModal'));
            modal.show();
        }
    </script>
</body>
</html>
