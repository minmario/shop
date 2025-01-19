<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/mypage.css"/>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/components/coupon.css"/>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/components/delivery.css"/>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/components/order.css"/>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/components/point.css"/>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/components/review.css"/>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/components/inquiry.css"/>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/components/question.css"/>
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
                <!-- Title Section -->
                <div class="text-title">
                    <h3>My Page</h3>
                </div>

                <!-- Profile Section -->
                <div class="profile-container">
                    <div class="profile-row">
                        <div class="profile-header">
                            <div class="profile-left">
                                <div class="profile-image">
                                    <img src="./user/images/blank-profile.png" alt="User Profile Image">
                                </div>
                                <div class="profile-info">
                                    <div class="profile-name">터키플랫슈즈</div>
                                    <div class="profile-level">LV.5 실버 · 2% 적립</div>
                                </div>
                            </div>
                        </div>
                        <div class="profile-stats">
                            <div class="stats-item">
                                <div class="stats-label">적립금</div>
                                <div class="stats-value">7,023원</div>
                            </div>
                            <div class="stats-item">
                                <div class="stats-label">쿠폰</div>
                                <div class="stats-value">107장</div>
                            </div>
                            <div class="stats-item">
                                <div class="stats-label">후기 작성</div>
                                <div class="stats-value">1건</div>
                            </div>
                        </div>
                        <button type="button" class="btn btn-outline-secondary profile-button">스냅 프로필</button>
                    </div>
                </div>

                <!-- Order Section -->
                <div class="order-container">
                    <div class="order-status">
                        <h2 class="order-title">진행 중 주문 현황</h2>
                        <div class="order-item">
                            <img src="./user/images/product5.jpg" alt="Product Image" class="product-image">
                            <div class="order-details">
                                <div class="payment-status">결제완료</div>
                                <div class="product-name">커버낫</div>
                                <div class="product-description">
                                    [2PACK] 쿨 코튼 티셔츠 블랙+화이트<br>사이즈: M
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Action Buttons Section -->
                <div class="user-action-buttons">
                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-order" autocomplete="off">
                        <label class="btn btn-outline-dark" for="btnradio-order">주문내역</label>
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-review" autocomplete="off">
                        <label class="btn btn-outline-dark" for="btnradio-review">구매후기</label>
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-inquiry" autocomplete="off">
                        <label class="btn btn-outline-dark" for="btnradio-inquiry">1:1문의</label>
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-question" autocomplete="off">
                        <label class="btn btn-outline-dark" for="btnradio-question">상품문의</label>
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-point" autocomplete="off">
                        <label class="btn btn-outline-dark" for="btnradio-point">적립금</label>
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-coupon" autocomplete="off">
                        <label class="btn btn-outline-dark" for="btnradio-coupon">쿠폰</label>
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-delivery" autocomplete="off">
                        <label class="btn btn-outline-dark" for="btnradio-delivery">배송지</label>
                    </div>
                </div>

                <!-- Order Section -->
                <div class="order-section-container" id="order-article">
                    <jsp:include page="components/order.jsp"/>
                </div>

                <!-- Review Section -->
                <div class="review-section-container" id="review-article">
                    <jsp:include page="./components/review.jsp"/>
                </div>

                <!-- Point Section -->
                <div class="point-section-container" id="point-article">
                    <jsp:include page="./components/point.jsp"/>
                </div>

                <!-- Inquiry Section -->
                <div class="inquiry-section-container" id="inquiry-article">
                    <jsp:include page="./components/inquiry.jsp"/>
                </div>

                <!-- Question Section -->
                <div class="question-section-container" id="question-article">
                    <jsp:include page="./components/question.jsp"/>
                </div>

                <!-- Coupon Section -->
                <div class="coupon-section-container" id="coupon-article">
                    <jsp:include page="./components/coupon.jsp"/>
                </div>

                <%-- Delivery Section --%>
                <div class="delivery-section-container" id="delivery-article">
                    <jsp:include page="./components/delivery.jsp"/>
                </div>
            </div>
        </div>

        <%-- footer --%>
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>

    <!-- 배송지 추가 Modal -->
    <div class="modal fade" id="addrModal" tabindex="-1" role="dialog" aria-labelledby="addrModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addrModalTitle">배송지 추가</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="modal-table-container">
                        <table class="modal-table">
                            <caption>배송지 정보 입력 테이블</caption>
                            <tbody>
                            <tr>
                                <th class="modal-table-info">
                                    <span>이름</span>
                                    <span class="asterisk"></span>
                                </th>
                                <td>
                                    <input type="text" class="text" name="name" placeholder="받는 분의 이름을 입력하세요"/>
                                </td>
                            </tr>
                            <tr>
                                <th class="modal-table-info">
                                    <span>연락처</span>
                                    <span class="asterisk"></span>
                                </th>
                                <td>
                                    <input type="text" class="text" name="phone" placeholder="받는 분의 연락처를 입력하세요"/>
                                </td>
                            </tr>
                            <tr>
                                <th class="modal-table-info">
                                    <span>주소</span>
                                    <span class="asterisk"></span>
                                </th>
                                <td>
                                    <input type="text" class="addr1" name="pos_code" placeholder="우편번호"/>
                                    <button class="btn btn-primary" type="submit">주소검색</button><br/>
                                    <input type="text" class="addr2" name="addr1" placeholder="주소"/><br/>
                                    <input type="text" class="addr2" name="addr2" placeholder="상세주소"/><br/>
                                </td>
                            </tr>
                            <tr>
                                <th class="modal-table-info">
                                    <span>배송 요청사항 (선택)</span>
                                </th>
                                <td>
                                    <select id="request-select" name="select" onchange="addInput()">
                                        <option selected="selected">:: 배송 요청사항을 선택하세요 ::</option> <!--가장 먼저 작성하는 것이 선택되기 때문에 selected로 지정한다. -->
                                        <option value="1">문 앞에 놔주세요</option>
                                        <option value="2">경비실에 맡겨주세요</option>
                                        <option value="3">택배함에 넣어주세요</option>
                                        <option value="4">배송 전에 연락주세요</option>
                                        <option value="5">직접 입력</option>
                                    </select>
                                    <br/>
                                    <!-- '직접 입력'을 선택할 때만 보이는 새로운 입력 필드 -->
                                    <div id="custom-input">
                                        <input type="text" class="toggle" name="deli_request" placeholder="배송 요청 사항을 직접 입력하세요"/>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="modal-footer-left">
                        <input type="checkbox" id="chkDefault" name="chk-default"/>
                        <label for="chkDefault">기본 배송지로 설정</label>
                    </div>
                    <div class="modal-footer-right">
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-outline-primary" onclick="save()">등록</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 배송조회 모달 -->
    <div class="modal fade" id="deliveryModal" tabindex="-1" role="dialog" aria-labelledby="deliveryModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deliveryModalTitle">배송 조회</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>배송 조회 내용을 여기에 표시합니다.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        const selectedCategoryDiv = document.getElementById('selectedCategoryDiv');
        const categoryButtons = document.querySelectorAll('.category-btn');

        const selectedCategories = {};

        categoryButtons.forEach((button) => {
            button.addEventListener('click', () => {
                const category = button.textContent.trim();

                if (selectedCategories[category]) return;

                selectedCategories[category] = true;

                const categoryItem = document.createElement('span');
                categoryItem.className = 'badge bg-secondary me-2 mb-2';
                categoryItem.innerHTML = `${category}<button type="button" class="btn-close btn-close-white" aria-label="Close"></button>`;

                categoryItem.querySelector('.btn-close').addEventListener('click', (e) => {
                    e.stopPropagation();
                    delete selectedCategories[category];
                    selectedCategoryDiv.removeChild(categoryItem);
                    button.classList.remove('active');
                });

                selectedCategoryDiv.appendChild(categoryItem);
                button.classList.add('active');
            });
        });

        $(function () {
            // 초기 상태 설정 - 주문 내역 선택
            $('#btnradio-order').prop('checked', true);

            // 장바구니 체크 박스 전체 선택 / 해제 기능
            $("#cart-table #cart-all").on("click", function () {
                console.log("click");
                let ar = $("#cart-table > tbody").find(":checkbox");
                ar.prop("checked", this.checked);
            });

            // 장바구니 체크 박스 개별 선택 / 해제 기능
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

            // 배송지 체크 박스 전체 선택 / 해제 기능
            $("#delivery-table #delivery-all").on("click", function () {
                let ar = $("#delivery-table > tbody").find(":checkbox");
                ar.prop("checked", this.checked);
            });

            // 배송지 체크 박스 개별 선택 / 해제 기능
            $("#delivery-table > tbody").find(":checkbox").on("click", function () {
                let allCheck = true;
                $("#delivery-table > tbody").find(":checkbox").not("#delivery-table #delivery-all").each(function () {
                    if (!this.checked) {
                        allCheck = false;
                        return allCheck;
                    }
                });
                $("#delivery-table #delivery-all").prop("checked", allCheck);
            });

            const tabActions = {
                "#btnradio-order": "#order-article",
                "#btnradio-review": "#review-article",
                "#btnradio-inquiry": "#inquiry-article",
                "#btnradio-question": "#question-article",
                "#btnradio-point": "#point-article",
                "#btnradio-coupon": "#coupon-article",
                "#btnradio-delivery": "#delivery-article"
            };

            const allTabs = Object.values(tabActions);

            // 초기 상태 설정 - 주문 내역만 보이도록
            allTabs.forEach((tab) => {
                document.querySelector(".user-action-buttons .btn-group")
                const element = document.querySelector(tab);
                if (element) {
                    element.style.display = tab === "#order-article" ? "block" : "none";
                }
            });

            // 버튼 클릭 이벤트 설정
            Object.keys(tabActions).forEach((buttonSelector) => {
                const button = document.querySelector(buttonSelector);
                if (button) {
                    button.addEventListener("click", function () {
                        allTabs.forEach((tab) => {
                            const element = document.querySelector(tab);
                            if (element) {
                                element.style.display = "none";
                            }
                        });

                        const toShow = tabActions[buttonSelector];
                        const showElement = document.querySelector(toShow);
                        if (showElement) {
                            showElement.style.display = "block";
                        }
                    });
                } else {
                    console.error(`Button with selector '${buttonSelector}' not found.`);
                }
            });

            // 적립금 탭 클릭 이벤트
            $(".nav-link").on("click", function (event) {
                event.preventDefault();

                $(".nav-link").removeClass("active");
                $(this).addClass("active");

                $("#tables table").hide();
                const targetTable = $(this).data("target");
                $(targetTable).show();
            });
        });

        // 배송지 모달 > 요청 사항 필드 추가
        function addInput() {
            let selectValue = document.getElementById("request-select").value;
            let customInput = document.getElementById("custom-input");

            if (selectValue == "5") {
                customInput.style.display = "block";
            } else {
                customInput.style.display = "none";
            }
        }
    </script>
</body>
</html>
