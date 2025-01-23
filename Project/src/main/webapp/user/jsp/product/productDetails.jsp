<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>무신사</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="./user/css/product/productDetails.css"/>
</head>
<body>
    <!-- header -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <div class="wrap">
        <div class="row">
            <div class="container">
                <div class="product-overview">
                    <h2 class="product-title">MILK SST PINK</h2>
                    <p class="brand"><strong>브랜드</strong> <a href="#">MOTIVESTREET</a></p>
                    <p class="product-category"><strong>제품분류</strong> <a href="#">상의</a> | <a href="#">반소매 티셔츠</a></p>
                </div>
                <div class="product-details">
                    <div class="image-section">
                        <div id="carouselControls" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100 product-image" src="./user/images/product1.jpg" alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100 product-image" src="./user/images/product2.jpg" alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100 product-image" src="./user/images/product3.jpg" alt="Third slide">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselControls" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselControls" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                    <div class="info-section">
                        <div class="product-info">
                            <h3>PRODUCT INFO <span class="info-subtitle">제품정보</span></h3>
                            <p><i class="bi bi-dash"></i> 제품번호 <strong id="prod_id">MOTIVESTREET (MILK SST PINK)</strong></p>
                            <p><i class="bi bi-dash"></i> 시즌/성별 <strong id="prod_season">2017 S/S / 여</strong></p>
                            <p><i class="bi bi-dash"></i> 누적판매 <strong id="prod_sale_count">233개</strong></p>
                            <p><i class="bi bi-dash"></i> 좋아요 <span class="like-count"><i class="bi bi-heart-fill"></i> <strong id="prod_like_count">91</strong></span></p>
                            <p>
                                <i class="bi bi-dash"></i> 구매후기
                                <span class="stars">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <span class="star-count">137건</span>
                                </span>
                            </p>
                        </div>
                        <div class="delivery-info">
                            <h3>DELIVERY INFO <span class="info-subtitle">배송정보</span></h3>
                            <p><i class="bi bi-dash"></i> 배송방법 <strong>국내 배송 / 입점사 배송</strong></p>
                            <p><i class="bi bi-dash"></i> 평균 배송기간 <strong>1.2일 (CJ대한통운)</strong></p>
                        </div>
                        <div class="price-info">
                            <h3>PRICE INFO <span class="info-subtitle">가격정보</span></h3>
                            <p><i class="bi bi-dash"></i> 무신사 판매가 <span class="price-original"><strong><del>32,000원</del></strong></span></p>
                            <p><i class="bi bi-dash"></i> 무신사 세일가 <span class="price-sale"><strong>19,200원</strong></span> <span class="discount">(40% 할인)</span></p>
                            <p><i class="bi bi-dash"></i> 무신사 회원가 <span class="price-member"><strong>17,472 ~ 18,816원</strong></span></p>
                            <p><i class="bi bi-dash"></i> 적립금 최대 <span class="points"><strong>384원</strong></span></p>
                        </div>
                        <c:if test="${empty sessionScope.isLoggedIn}">
                            <div class="alert alert-danger" role="alert">
                                로그인 시 구매 가능합니다.
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.isLoggedIn}">
                            <div class="cart-count">
                                <button type="button" class="btn btn-outline-secondary btn-minus">-</button>
                                <span class="cart-count-value" id="cart-count-value">0</span>
                                <button type="button" class="btn btn-outline-secondary btn-plus">+</button>
                            </div>
                            <div class="actions">
                                <button class="btn btn-outline-danger like-btn"><i class="bi bi-heart"></i> 좋아요</button>
                                <button class="btn btn-dark add-to-cart">장바구니 담기</button>
                                <button class="btn btn-dark buy-now" onclick="location.href='Controller?type=payment'">구매하기</button>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="tabs">
                    <button class="tab-btn active" data-target="detail">상세 정보</button>
                    <button class="tab-btn" data-target="size">사이즈</button>
                    <button class="tab-btn" data-target="review">리뷰</button>
                    <button class="tab-btn" data-target="inquiry">문의</button>
                </div>
                <div class="tab-content">
                    <div id="detail" class="tab-panel active">
                        <div class="detail-images-section">
                            <h3>DETAIL IMAGES</h3>
                            <div>
                                <p>■ 100% Cotton , Heavy French Terry / Soft to the touch / 850g per yard</p>
                                <p>■ fabrics developed by our company / dumble tenta processing</p>
                                <p>■ rebbed crewneck</p>
                                <p>■ Embroidery applique</p>
                                <p>■ semi over fit</p>
                                <p>■ model is M: H184 W63 (L size)</p>
                                <p>■ laundry type : Cold water hand wash</p>
                                <p>■ made in korea, made in china</p>
                                <p>
                                    <strong>건조시 기계의 사용은 원단의 수축을 유발하여 옷의 변형을 가져오니 서늘하고 습기가 없는 곳에서 자연건조 하시기 바랍니다.</strong>
                                </p>
                            </div>
                            <div>
                                <img src="./user/images/product_details1.jpg" alt="Detail Image 1" class="detail-image">
                            </div>
                        </div>
                    </div>
                    <div id="size" class="tab-panel">
                        <div class="size-table-section">
                            <table class="size-table">
                                <thead>
                                <tr>
                                    <th>Size</th>
                                    <th>Shoulder (cm)</th>
                                    <th>Chest (cm)</th>
                                    <th>Length (cm)</th>
                                    <th>Sleeve (cm)</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>S</td>
                                    <td>45</td>
                                    <td>100</td>
                                    <td>65</td>
                                    <td>20</td>
                                </tr>
                                <tr>
                                    <td>M</td>
                                    <td>47</td>
                                    <td>105</td>
                                    <td>67</td>
                                    <td>21</td>
                                </tr>
                                <tr>
                                    <td>L</td>
                                    <td>49</td>
                                    <td>110</td>
                                    <td>69</td>
                                    <td>22</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="review" class="tab-panel">
                        <ul class="review-categories">
                            <li class="active" data-target="all">전체 <span class="count">14,281</span></li>
                            <li data-target="style">스타일 <span class="count">2,271</span></li>
                            <li data-target="general">일반 <span class="count">11,995</span></li>
                            <li data-target="monthly">한달후기 <span class="count">15</span></li>
                        </ul>
                        <div class="review-options">
                            <div class="option-group">
                                <label for="size-select">옵션 (사이즈)</label>
                                <select id="size-select" class="custom-select">
                                    <option value="">전체</option>
                                    <option value="S">S</option>
                                    <option value="M">M</option>
                                    <option value="L">L</option>
                                </select>
                            </div>
                            <div class="option-group">
                                <label for="gender-select">성별</label>
                                <select id="gender-select" class="custom-select">
                                    <option value="">전체</option>
                                    <option value="male">남성</option>
                                    <option value="female">여성</option>
                                </select>
                            </div>
                            <div class="option-group">
                                <label for="height-input">키</label>
                                <input id="height-input" type="number" class="form-control" placeholder="cm">
                            </div>
                            <div class="option-group">
                                <label for="weight-input">몸무게</label>
                                <input id="weight-input" type="number" class="form-control" placeholder="kg">
                            </div>
                        </div>
                        <div class="toggle-options">
                            <div class="toggle-group">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="photo-review-toggle">
                                    <label class="form-check-label" for="photo-review-toggle">사진후기만</label>
                                </div>
                            </div>
                            <div class="toggle-group">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="my-size-toggle">
                                    <label class="form-check-label" for="my-size-toggle">내 사이즈</label>
                                </div>
                            </div>
                        </div>
                        <div class="review-content">
                            <div id="all" class="review-list active">
                                <div class="review-item">
                                    <div class="review-user">
                                        <p class="user-name">홍길동</p>
                                        <p class="review-date">1일 전</p>
                                    </div>
                                    <div class="review-rating">★★★★★</div>
                                    <div class="user-info">남성 · 171cm · 70kg · L 구매</div>
                                    <div class="review-content">
                                        <p>제 스펙이시면 라지 사이즈로 구매하세요. 딱 좋은 핏 나옵니다.</p>
                                    </div>
                                    <div class="review-actions">
                                        <button>좋아요</button>
                                        <button>답글</button>
                                    </div>
                                </div>
                            </div>
                            <div id="style" class="review-list">
                                <div class="review-item">
                                    <div class="review-user">
                                        <p class="user-name">일지매</p>
                                        <p class="review-date">3일 전</p>
                                    </div>
                                    <div class="review-rating">★★★★★</div>
                                    <div class="user-info">남성 · 170cm · 84kg · L 구매</div>
                                    <div class="review-content">
                                        <p>네이비라 굉장히 코디하기 편하구 여유로워요. 몸에 딱 붙은 중간핏이 있습니다.</p>
                                    </div>
                                    <div class="review-actions">
                                        <button>좋아요</button>
                                        <button>답글</button>
                                    </div>
                                </div>
                            </div>
                            <div id="general" class="review-list">
                                <div class="review-item">
                                    <div class="review-user">
                                        <p class="user-name">테스트 사용자</p>
                                        <p class="review-date">5일 전</p>
                                    </div>
                                    <div class="review-rating">★★★★☆</div>
                                    <div class="user-info">여성 · 165cm · 55kg · M 구매</div>
                                    <div class="review-content">
                                        <p>핏이 조금 큰 감이 있지만 전반적으로 만족합니다.</p>
                                    </div>
                                    <div class="review-actions">
                                        <button>좋아요</button>
                                        <button>답글</button>
                                    </div>
                                </div>
                            </div>
                            <div id="monthly" class="review-list">
                                <div class="review-item">
                                    <div class="review-user">
                                        <p class="user-name">한달 후기 작성자</p>
                                        <p class="review-date">1달 전</p>
                                    </div>
                                    <div class="review-rating">★★★★★</div>
                                    <div class="user-info">남성 · 180cm · 80kg · L 구매</div>
                                    <div class="review-content">
                                        <p>한 달 사용해봤는데 여전히 만족스럽습니다. 튼튼하고 편해요!</p>
                                    </div>
                                    <div class="review-actions">
                                        <button>좋아요</button>
                                        <button>답글</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="inquiry" class="tab-panel">
                        <div class="inquiry-button-container">
                            <button type="button" class="btn btn-outline-dark" onclick="location.href='Controller?type=writeInquiry'">
                                판매자에게 문의하기
                            </button>
                        </div>
                        <div class="inquiry-list">
                            <div class="inquiry-item">
                                <div class="inquiry-type">재입고</div>
                                <div class="inquiry-header">
                                    <span class="inquiry-title">재입고</span>
                                    <i class="bi bi-chevron-down arrow"></i>
                                </div>
                                <div class="inquiry-meta">답변완료 · jsh*** · 25.01.17</div>
                                <div class="inquiry-content">
                                    <p class="question">1960 sweatshirts oatmeal<br>언제되나요ㅠㅠ</p>
                                    <div class="answer">
                                        <strong>답변. 유니폼브릿지 담당자</strong>
                                        <p>안녕하세요, 유니폼브릿지입니다.<br>
                                            저희 브랜드에 관심을 가지고 문의해주셔서 감사합니다.<br>
                                            문의하신 상품은 추가 재입고 여부가 확인되지 않습니다.<br>
                                            아쉬우시겠지만 고객님의 너그러운 양해 부탁드립니다.<br>
                                            그 외 추가 문의 사항이 있으시다면 답변 도와드리겠습니다.<br>
                                            감사합니다.</p>
                                        <span class="answer-date">25.01.17</span>
                                    </div>
                                </div>
                            </div>
                            <div class="inquiry-item">
                                <div class="inquiry-type">배송</div>
                                <div class="inquiry-header">
                                    <span class="inquiry-title">배송</span>
                                    <i class="bi bi-chevron-down arrow"></i>
                                </div>
                                <div class="inquiry-meta">답변완료 · ran*** · 25.01.04</div>
                                <div class="inquiry-content">
                                    <p class="question">반품문의 합니다. 반품 신청 어떻게 하나요?</p>
                                </div>
                            </div>
                        </div>
                        <nav class="pagination-container">
                            <ul class="pagination justify-content-center">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <!-- footer -->
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>

    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="./user/js/product/productDetails.js"></script>
</body>
</html>
