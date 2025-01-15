<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>마이 페이지</title>

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
    <div class="container-fluid">
        <div class="row">
            <!-- My Page Section -->
            <div class="text-title">
                <h3 style="font-weight: bold;">My Page</h3>
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
                    <input type="radio" class="btn-check" name="btnradiotab" id="btnradio1" autocomplete="off" checked>
                    <label class="btn btn-outline-secondary" for="btnradio1">장바구니</label>
                    <input type="radio" class="btn-check" name="btnradiotab" id="btnradio2" autocomplete="off">
                    <label class="btn btn-outline-secondary" for="btnradio2">주문조회</label>
                    <input type="radio" class="btn-check" name="btnradiotab" id="btnradio3" autocomplete="off">
                    <label class="btn btn-outline-secondary" for="btnradio3">좋아요</label>
                    <input type="radio" class="btn-check" name="btnradiotab" id="btnradio4" autocomplete="off">
                    <label class="btn btn-outline-secondary" for="btnradio4">구매후기</label>
                    <input type="radio" class="btn-check" name="btnradiotab" id="btnradio5" autocomplete="off">
                    <label class="btn btn-outline-secondary" for="btnradio5">상품문의</label>
                    <input type="radio" class="btn-check" name="btnradiotab" id="btnradio6" autocomplete="off">
                    <label class="btn btn-outline-secondary" for="btnradio6">1:1문의</label>
                    <input type="radio" class="btn-check" name="btnradiotab" id="btnradio7" autocomplete="off">
                    <label class="btn btn-outline-secondary" for="btnradio7">적립금</label>
                    <input type="radio" class="btn-check" name="btnradiotab" id="btnradio8" autocomplete="off">
                    <label class="btn btn-outline-secondary" for="btnradio8">쿠폰</label>
                    <input type="radio" class="btn-check" name="btnradiotab" id="btnradio9" autocomplete="off">
                    <label class="btn btn-outline-secondary" for="btnradio9">배송지</label>
                </div>
            </div>

            <!-- Review Section -->
            <div class="review-section-container">
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
                    <tr>
                        <td class="order-id">2</td>
                        <td class="product-info">
                            <div class="prod_info">
                                <div class="prod_img"></div>
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
                                        옵션&nbsp;:&nbsp;L&nbsp;/&nbsp;수량&nbsp;:&nbsp;1
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
                    <tr>
                        <td class="review-id">1</td>
                        <td class="product-info">
                            <div class="prod_info">
                                <div class="prod_img"></div>
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
                                        옵션&nbsp;:&nbsp;L&nbsp;/&nbsp;수량&nbsp;:&nbsp;1
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="purchase-date">2025-01-10</td>
                        <td class="general-review">
                            <button type="button" class="btn btn-outline-secondary">작성하기</button>
                        </td>
                        <td class="style-review">
                            <button type="button" class="btn btn-outline-secondary">작성하기</button>
                        </td>
                    </tr>
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
        </div>
    </div>

    <%-- footer --%>
    <jsp:include page="../layout/footer.jsp"></jsp:include>

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
