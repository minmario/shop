<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이 페이지</title>

    <!-- Bootstrap CSS -->

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/common/common.css"/>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/mypage.css"/>
</head>
<body>
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <div class="container-fluid mt-4" style="padding-left: 20px; padding-right: 0;">
        <div class="row">
            <div class="border-bottom pb-2 mb-3">
                <div class="user-info">
                    <span style="margin: 0; font-weight: bold;">브론즈 OOO님</span>&nbsp;|&nbsp;
                    <span style="margin: 0; font-weight: bold;">
                        알림 10개
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                            <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
                        </svg>
                    </span>
                </div>
                <div class="logout">
                    <span style="margin: 0; font-weight: bold;">로그아웃</span>
                </div>
            </div>

            <div class="col-md-10">
                <div class="border-bottom pb-2 mb-3">
                    무신사 > 스냅 > 스트릿 스냅
                </div>
                <div class="border-bottom pb-2 mb-3">
                    <h3 style="margin: 0; font-weight: bold;">My Page</h3>
                </div>
                <div class="border-bottom pb-2 mb-3">
                    <div class="profile-container">
                        <div class="profile"></div>
                    </div>
                    <div class="user-info">
                        <span class="grade">실버</span>
                        <span class="userName">OOO님</span>
                        <span class="user-info-change">[회원정보변경]</span>
                    </div>
                </div>
                <div class="border-bottom pb-2 mb-3">
                    <div class="point-info">
                        <span>적립금</span>
                    </div>
                    <div class="point-value">
                        <span>000점</span>
                    </div>
                </div>
                <div class="border-bottom pb-2 mb-3">
                    <div class="coupon-info">
                        <span>쿠폰</span>
                    </div>
                    <div class="coupon-value">
                        <span>00장</span>
                    </div>
                </div>
            </div>

            <div class="col-md-10">
                <div class="btn-group" role="group" aria-label="Basic outlined example">
                    <button type="button" class="btn btn-outline-secondary">장바구니</button>
                    <button type="button" class="btn btn-outline-secondary">주문조회</button>
                    <button type="button" class="btn btn-outline-secondary">좋아요</button>
                    <button type="button" class="btn btn-outline-secondary">구매후기</button>
                    <button type="button" class="btn btn-outline-secondary">상품문의</button>
                    <button type="button" class="btn btn-outline-secondary">1:1문의</button>
                    <button type="button" class="btn btn-outline-secondary">적립금</button>
                    <button type="button" class="btn btn-outline-secondary">쿠폰</button>
                    <button type="button" class="btn btn-outline-secondary">배송지</button>
                </div>
            </div>

            <div class="col-md-10">
                <div>
                    <div>
                        <span>상품평 작성</span>
                    </div>
                    <div>
                        <div class="btn-group" role="group" aria-label="Basic outlined example">
                            <button type="button" class="btn btn-outline-secondary">후기 내역</button>
                            <button type="button" class="btn btn-outline-secondary">후기 작성</button>
                        </div>
                    </div>
                </div>
                <table id="table">
                    <caption>상품평 작성</caption>
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
                        <tr>
                            <td>2</td>
                            <td>
                                <div class="prod_info">
                                    <div class="prod_img"></div>
                                    <div class="prod_brand">
                                        [페이퍼리즘]
                                    </div>
                                    <div class="prod_name">
                                        ZIGGY LIGHTING 3/4 SLV T-SHIRT [GRAY]
                                    </div>
                                    <div class="prod_option">옵션 &nbsp; : &nbsp; L / 수량 &nbsp; : &nbsp; 1</div>
                                </div>
                            </td>
                            <td>2025-01-14</td>
                            <td>
                                <button type="button" class="btn btn-outline-secondary">작성하기</button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-outline-secondary">작성하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <div class="prod_info">
                                    <div class="prod_img"></div>
                                    <div class="prod_brand">
                                        [페이퍼리즘]
                                    </div>
                                    <div class="prod_name">
                                        ZIGGY LIGHTING 3/4 SLV T-SHIRT [GRAY]
                                    </div>
                                    <div class="prod_option">옵션 &nbsp; : &nbsp; L / 수량 &nbsp; : &nbsp; 1</div>
                                </div>
                            </td>
                            <td>2025-01-10</td>
                            <td>
                                <button type="button" class="btn btn-outline-secondary">작성하기</button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-outline-secondary">작성하기</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <footer>
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </footer>

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
    </script>
</body>
</html>
