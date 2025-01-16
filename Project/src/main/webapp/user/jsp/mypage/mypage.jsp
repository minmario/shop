<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>Musinsa</title>

    <!-- Bootstrap CSS -->

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/common/common.css"/>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/mypage.css"/>
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
                        <h3>My Page</h3>
                    </div>
                    <div class="title-right">
                        <span class="current">장바구니</span>
                        <span>&gt;</span>
                        <span>주문서</span>
                        <span>&gt;</span>
                        <span>주문완료</span>
                    </div>
                </div>

                <!-- User Info Section -->
                <div class="user-info-table">
                    <table id="user-table">
                        <tbody>
                        <tr>
                            <td>
                                <div class="profile"></div>
                            </td>
                            <td>
                                <div>
                                    <span class="grade">실버</span>
                                    <span class="userName">${user.cus_name}</span>
                                </div>
                                <div>
                                    <a href="" class="user-info-change">[회원정보변경]</a>
                                </div>
                            <td>
                                <div class="point-info">
                                    적립금
                                </div>
                                <div class="point-value">
                                    000점
                                </div>
                            </td>
                            <td>
                                <div class="coupon-info">
                                    쿠폰
                                </div>
                                <div class="coupon-value">
                                    00장
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Action Buttons Section -->
                <div class="user-action-buttons">
                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-order" autocomplete="off">
                        <label class="btn btn-outline-secondary" for="btnradio-order">주문내역</label>
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-likes" autocomplete="off">
                        <label class="btn btn-outline-secondary" for="btnradio-likes">좋아요</label>
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-reviews" autocomplete="off">
                        <label class="btn btn-outline-secondary" for="btnradio-reviews">구매후기</label>
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-questions" autocomplete="off">
                        <label class="btn btn-outline-secondary" for="btnradio-questions">상품문의</label>
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-inquiry" autocomplete="off">
                        <label class="btn btn-outline-secondary" for="btnradio-inquiry">1:1문의</label>
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-points" autocomplete="off">
                        <label class="btn btn-outline-secondary" for="btnradio-points">적립금</label>
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-coupons" autocomplete="off">
                        <label class="btn btn-outline-secondary" for="btnradio-coupons">쿠폰</label>
                        <input type="radio" class="btn-check" name="btnradiotab" id="btnradio-delivery" autocomplete="off">
                        <label class="btn btn-outline-secondary" for="btnradio-delivery">배송지</label>
                    </div>
                </div>

                <!-- Review Section -->
                <div class="review-section-container" id="review-article">
                    <div class="review-section">
                        <div class="review-header">
                            <span class="review-title">상품평 작성</span>
                        </div>
                        <div class="review-buttons">
                            <div class="btn-group" role="group">
                                <input type="radio" class="btn-check" name="btnradioreview" id="btnradio10" autocomplete="off" checked>
                                <label class="btn btn-outline-secondary" for="btnradio10">후기 내역</label>
                                <input type="radio" class="btn-check" name="btnradioreview" id="btnradio11" autocomplete="off">
                                <label class="btn btn-outline-secondary" for="btnradio11">후기 작성</label>
                            </div>
                        </div>
                    </div>
                    <table id="review-table" class="table">
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>상품정보</th>
                            <th>구매일자</th>
                            <th>일반 후기</th>
                            <th>스타일 후기</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="cnt" value="2"/>
                        <c:forEach begin="1" end="${cnt}" varStatus="st">
                            <tr>
                                <td class="order-id">${st.index}</td>
                                <td class="product-info">
                                    <div class="prod_info">
                                        <div class="prod_img">
                                            <img src="./user/images/product1.jpg"/>
                                        </div>
                                        <div class="prod_details">
                                            <div class="prod_brand">
                                                [페이퍼리즘]
                                            </div>
                                            <div class="prod_name">
                                                ZIGGY LIGHTING 3/4 SLV T-SHIRT
                                            </div>
                                            <div class="prod_color">
                                                [GRAY]
                                            </div>
                                            <div class="prod_option">
                                                옵션&nbsp;:&nbsp;L&nbsp;/&nbsp;수량&nbsp;:&nbsp;${st.index}
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="purchase-date">2025-01-14</td>
                                <td class="general-review">
                                    <button type="button" class="btn btn-outline-secondary">작성하기</button>
                                </td>
                                <td class="style-review">
                                    <button type="button" class="btn btn-outline-secondary">작성하기</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <nav aria-label="Page navigation" class="navigation">
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
                </div>

                <!-- Point Section -->
                <div class="point-section-container" id="point-article">
                    <div class="point-section">
                        <div class="point-header">
                            <span class="point-title">적립금</span>
                        </div>
                    </div>
                    <div class="loyalty-points-section">
                        <div class="points-list">
                            <li class="points-item">
                                <div class="points-label text-left">예정 적립금</div>
                                <div class="points-value text-right">1000원</div>
                            </li>
                            <li class="points-item">
                                <div class="points-label text-left">소멸 예정 적립금(30일 이내)</div>
                                <div class="points-value text-right">0원</div>
                            </li>
                        </div>
                    </div>
                    <div class="point-tabs">
                        <ul class="nav nav-tabs" id="nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#" data-target="#table-all">전체</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-target="#table-earned">적립</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-target="#table-used">사용</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-target="#table-upcoming">예정</a>
                            </li>
                        </ul>
                    </div>
                    <div id="tables">
                        <table id="table-all" class="table" style="display: table;">
                            <thead>
                            <tr><th>전체</th></tr>
                            </thead>
                            <tbody>
                            <tr><td>전체 내역 1</td></tr>
                            </tbody>
                        </table>
                        <table id="table-earned" class="table" style="display: none;">
                            <thead>
                            <tr><th>적립</th></tr>
                            </thead>
                            <tbody>
                            <tr><td>적립 내역 1</td></tr>
                            </tbody>
                        </table>
                        <table id="table-used" class="table" style="display: none;">
                            <thead>
                            <tr><th>사용</th></tr>
                            </thead>
                            <tbody>
                            <tr><td>사용 내역 1</td></tr>
                            </tbody>
                        </table>
                        <table id="table-upcoming" class="table" style="display: none;">
                            <thead>
                            <tr><th>예정</th></tr>
                            </thead>
                            <tbody>
                            <tr><td>예정 내역 1</td></tr>
                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="Page navigation" class="navigation">
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
                </div>

                <!-- Coupon Section -->
                <div class="coupon-section-container" id="coupon-article">
                    <div class="coupon-section">
                        <div class="coupon-header">
                            <span class="coupon-title">쿠폰 목록</span>
                        </div>
                        <div class="coupon-sort">
                            <select class="form-select coupon-sort-options">
                                <option>최신순</option>
                                <option>할인순</option>
                            </select>
                        </div>
                    </div>
                    <table id="coupon-table" class="table">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>할인율</th>
                                <th>쿠폰명</th>
                                <th>만료일</th>
                                <th>적용 상품</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="cnt" value="5"/>
                            <c:forEach begin="1" end="${cnt}" varStatus="st">
                                <tr>
                                    <td>${st.index}</td>
                                    <td>${st.index * 3}%</td>
                                    <td>${st.index}월 무신사 회원 정기 쿠폰</td>
                                    <td>2025-01-${st.index + 5}까지</td>
                                    <td>
                                        <a href="">적용 상품</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <nav aria-label="Page navigation" class="navigation">
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
                </div>

                <%-- Delivery Section --%>
                <div class="delivery-section-container" id="delivery-article">
                    <div class="delivery-section">
                        <div class="delivery-header">
                            <span class="delivery-title">배송지 목록</span>
                        </div>
                    </div>
                    <table id="delivery-table" class="table">
                        <thead>
                        <tr>
                            <th><input type="checkbox" id="delivery-all"/></th>
                            <th>번호</th>
                            <th>이름</th>
                            <th>연락처</th>
                            <th>주소</th>
                            <th>관리</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="cnt" value="3"/>
                        <c:forEach begin="1" end="${cnt}" varStatus="st">
                            <tr>
                                <td><input type="checkbox" name="chk-delivery"/></td>
                                <td>${st.index}</td>
                                <td>OOO</td>
                                <td>010-0000-0000</td>
                                <td>서울특별시 동작구 보라매로5길 15</td>
                                <td>
                                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='Controller?type=editAddr'">수정</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="delivery-buttons">
                        <span class="delivery-buttons-left">
                            <button type="button" class="btn btn-sm btn-outline-danger" onclick="">선택 배송지 삭제</button>
                        </span>
                        <span class="delivery-buttons-right">
                            <button type="button" class="btn btn-primary btn-sm" onclick="onShowAddAddrBtn()">배송지 추가</button>
                        </span>
                    </div>
                    <br/><br/>
                    <div class="delivery-notice">
                        <ol>
                            <li>배송 주소록은 최대 3개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
                            <li>기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- footer --%>
    <jsp:include page="../layout/footer.jsp"></jsp:include>

    <!-- Modal -->
    <div class="modal fade" id="addrModalCenter" tabindex="-1" role="dialog" aria-labelledby="addrModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addrModalCenterTitle">배송지 추가</h5>
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
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-outline-primary" onclick="save()">등록</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

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
                //"#btnradio-order": "#order-article",
                //"#btnradio-likes": "#likes-article",
                "#btnradio-reviews": "#review-article",
                //"#btnradio-questions": "#questions-article",
                //"#btnradio-inquiry": "#inquiry-article",
                "#btnradio-points": "#point-article",
                "#btnradio-coupons": "#coupon-article",
                "#btnradio-delivery": "#delivery-article"
            };

            const allTabs = Object.values(tabActions);

            // 초기 상태 설정 - 주문 내역만 보이도록
            allTabs.forEach((tab) => {
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

        // 배송지 추가 > 모달
        function onShowAddAddrBtn() {
            let modal = new bootstrap.Modal(document.getElementById('addrModalCenter'));
            modal.show();
        }

        // 배송지 추가 모달 닫기
        function onHideAddAddrBtn() {
            let modal = new bootstrap.Modal(document.getElementById('addrModalCenter'));
            modal.hide();
        }

        // 배송지 모달 > 요청 사항 필드 추가
        function addInput() {
            let selectValue = document.getElementById("request-select").value;
            let customInput = document.getElementById("custom-input");

            // 선택된 값이 '5'이면 input 필드를 표시하고, 아니면 숨긴다.
            if (selectValue == "5") {
                customInput.style.display = "block";  // 새로운 input 필드를 보이게 한다.
            } else {
                customInput.style.display = "none";   // 새로운 input 필드를 숨긴다.
            }
        }
    </script>
</body>
</html>
