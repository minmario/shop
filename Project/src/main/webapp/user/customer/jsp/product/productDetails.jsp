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

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="./user/customer/css/product/productDetails.css"/>
</head>
<body>
    <!-- header -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <div class="wrap">
        <div class="row">
            <div class="container">
                <c:if test="${not empty productDetails}">
                    <c:set var="pvo" value="${requestScope.productDetails}"/>
                    <div class="product-overview">
                        <h2 class="product-title">${pvo.name}</h2>
                        <p class="brand"><strong>브랜드</strong> <a href="#">${pvo.brand}</a></p>
                        <p class="product-category"><strong>제품분류</strong> <a href="#">상의</a> | <a href="#">반소매 티셔츠</a></p>
                    </div>
                    <div class="product-details">
                        <div class="image-section">
                            <div id="carouselControls" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <c:choose>
                                        <c:when test="${fn:length(fn:split(pvo.prod_image, ',')) > 1}">
                                            <c:forEach var="img" items="${fn:split(pvo.prod_image, ',')}" varStatus="st">
                                                <div class="carousel-item ${st.first ? 'active' : ''}">
                                                    <img class="d-block w-100 product-image" src="${img}" alt="slide_${st.index}">
                                                </div>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="carousel-item active">
                                                <img class="d-block w-100 product-image" src="${pvo.prod_image}" alt="single_image">
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
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
                                <p><i class="bi bi-dash"></i> 제품번호 <strong id="prod_id" data-item="${pvo.id}">${pvo.id}</strong></p>
                                <p><i class="bi bi-dash"></i> 성별 <strong id="prod_season">여</strong></p>
                                <p><i class="bi bi-dash"></i> 누적판매 <strong id="prod_sale_count"><fmt:formatNumber value="${pvo.sales_count}"/>개</strong></p>
                                <p><i class="bi bi-dash"></i> 좋아요 <span class="like-count"><i class="bi bi-heart-fill"></i> <strong id="prod_like_count"><fmt:formatNumber value="${pvo.like_count}"/></strong></span></p>
                                <p>
                                    <i class="bi bi-dash"></i> 구매후기
                                    <span class="stars">
                                        <c:if test="${pvo.avg_score ne null}">
                                            <c:choose>
                                                <c:when test="${pvo.avg_score >= 1.0 && pvo.avg_score < 1.5}">
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star"></i>
                                                    <i class="bi bi-star"></i>
                                                    <i class="bi bi-star"></i>
                                                    <i class="bi bi-star"></i>
                                                </c:when>
                                                <c:when test="${pvo.avg_score >= 1.5 && pvo.avg_score < 2.0}">
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-half"></i>
                                                    <i class="bi bi-star"></i>
                                                    <i class="bi bi-star"></i>
                                                    <i class="bi bi-star"></i>
                                                </c:when>
                                                <c:when test="${pvo.avg_score >= 2.0 && pvo.avg_score < 2.5}">
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star"></i>
                                                    <i class="bi bi-star"></i>
                                                    <i class="bi bi-star"></i>
                                                </c:when>
                                                <c:when test="${pvo.avg_score >= 2.5 && pvo.avg_score < 3.0}">
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-half"></i>
                                                    <i class="bi bi-star"></i>
                                                    <i class="bi bi-star"></i>
                                                </c:when>
                                                <c:when test="${pvo.avg_score >= 3.0 && pvo.avg_score < 3.5}">
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star"></i>
                                                    <i class="bi bi-star"></i>
                                                </c:when>
                                                <c:when test="${pvo.avg_score >= 3.5 && pvo.avg_score < 4.0}">
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-half"></i>
                                                    <i class="bi bi-star"></i>
                                                </c:when>
                                                <c:when test="${pvo.avg_score >= 4.0 && pvo.avg_score < 4.5}">
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star"></i>
                                                </c:when>
                                                <c:when test="${pvo.avg_score >= 4.5 && pvo.avg_score <= 5.0}">
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="bi bi-star"></i>
                                                    <i class="bi bi-star"></i>
                                                    <i class="bi bi-star"></i>
                                                    <i class="bi bi-star"></i>
                                                    <i class="bi bi-star"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                        <span class="star-count">
                                            <fmt:formatNumber value="${pvo.review_count}"/>개
                                        </span>
                                    </span>
                                </p>
                            </div>
                            <div class="delivery-info">
                                <h3>DELIVERY INFO <span class="info-subtitle">배송정보</span></h3>
                                <p><i class="bi bi-dash"></i> 배송방법 <strong>국내 배송 / 입점사 배송</strong></p>
                                <p><i class="bi bi-dash"></i> 평균 배송기간 <strong>1.2일 (${pvo.courier})</strong></p>
                            </div>
                            <div class="price-info">
                                <h3>PRICE INFO <span class="info-subtitle">가격정보</span></h3>
                                <p><i class="bi bi-dash"></i> 무신사 판매가 <span class="price-original"><strong><del><fmt:formatNumber value="${pvo.price}"/>원</del></strong></span></p>
                                <p><i class="bi bi-dash"></i> 무신사 세일가 <span class="price-sale"><strong><fmt:formatNumber value="${pvo.saled_price}"/>원</strong></span> <span class="discount">(${pvo.sale}% 할인)</span></p>
                            </div>
                            <c:if test="${empty sessionScope.isLoggedIn}">
                                <div class="alert alert-danger" role="alert">
                                    로그인 시 구매 가능합니다.
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.isLoggedIn}">
                                <div class="prod-size">
                                    <i class="bi bi-dash"></i> 사이즈
                                    <select class="form-select" aria-label="size select" id="cart-select-size">
                                        <option value="0">:: 선택하세요 ::</option>
                                        <c:if test="${requestScope.productSize ne null}">
                                            <c:forEach var="size" items="${requestScope.productSize}">
                                                <option value="${size.i_option_name}" data-value="${size.inventory_no}">
                                                        ${size.i_option_name}
                                                    <c:choose>
                                                        <c:when test="${size.count < 5}">
                                                            (${size.count}개 - 품절 임박!)
                                                        </c:when>
                                                        <c:otherwise>
                                                            (${size.count}개)
                                                        </c:otherwise>
                                                    </c:choose>
                                                </option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>
                                <div class="cart-count">
                                    <i class="bi bi-dash"></i> 개수
                                    <button type="button" class="btn btn-outline-secondary btn-minus">-</button>
                                    <span class="cart-count-value" id="count-value">0</span>
                                    <button type="button" class="btn btn-outline-secondary btn-plus">+</button>
                                </div>
                                <div class="actions">
                                    <c:choose>
                                        <c:when test="${requestScope.product_like ne null}">
                                            <button class="btn btn-danger like-btn" data-value="${pvo.id}" onclick="handleLike(this)"><i class="bi bi-heart"></i> 좋아요</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="btn btn-outline-danger like-btn" data-value="${pvo.id}" onclick="handleLike(this)"><i class="bi bi-heart"></i> 좋아요</button>
                                        </c:otherwise>
                                    </c:choose>
                                    <button class="btn btn-dark add-to-cart" onclick="insertCart()">장바구니 담기</button>
                                    <button class="btn btn-dark buy-now" onclick="location.href='Controller?type=order&action=order'">구매하기</button>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <div class="tabs">
                        <button class="tab-btn active" data-target="detail">상세 정보</button>
                        <button class="tab-btn" data-target="size">사이즈</button>
                        <button class="tab-btn" data-target="review">리뷰</button>
                        <button class="tab-btn" data-target="question" data-value="${pvo.id}">문의</button>
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
                                            <th>사이즈</th>
                                            <th>총장 (cm)</th>
                                            <th>어깨너비 (cm)</th>
                                            <th>가슴단면 (cm)</th>
                                            <th>소매길이 (cm)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${requestScope.productSize ne null}">
                                            <c:forEach var="size" items="${requestScope.productSize}">
                                                <tr>
                                                    <td>${size.i_option_name}</td>
                                                    <c:if test="${size.length ne null}">
                                                        <td><fmt:formatNumber value="${size.length}"/></td>
                                                    </c:if>
                                                    <c:if test="${size.shoulder ne null}">
                                                        <td><fmt:formatNumber value="${size.shoulder}"/></td>
                                                    </c:if>
                                                    <c:if test="${size.chest ne null}">
                                                        <td><fmt:formatNumber value="${size.chest}"/></td>
                                                    </c:if>
                                                    <c:if test="${size.sleeve ne null}">
                                                        <td><fmt:formatNumber value="${size.sleeve}"/></td>
                                                    </c:if>
                                                    <c:if test="${size.waist ne null}">
                                                        <td><fmt:formatNumber value="${size.waist}"/></td>
                                                    </c:if>
                                                    <c:if test="${size.hip ne null}">
                                                        <td><fmt:formatNumber value="${size.hip}"/></td>
                                                    </c:if>
                                                    <c:if test="${size.thigh ne null}">
                                                        <td><fmt:formatNumber value="${size.thigh}"/></td>
                                                    </c:if>
                                                    <c:if test="${size.rise ne null}">
                                                        <td><fmt:formatNumber value="${size.rise}"/></td>
                                                    </c:if>
                                                    <c:if test="${size.hem ne null}">
                                                        <td><fmt:formatNumber value="${size.hem}"/></td>
                                                    </c:if>
                                                    <c:if test="${size.foot_length ne null}">
                                                        <td><fmt:formatNumber value="${size.foot_length}"/></td>
                                                    </c:if>
                                                    <c:if test="${size.foot_width ne null}">
                                                        <td><fmt:formatNumber value="${size.foot_width}"/></td>
                                                    </c:if>
                                                    <c:if test="${size.ankle_height ne null}">
                                                        <td><fmt:formatNumber value="${size.ankle_height}"/></td>
                                                    </c:if>
                                                    <c:if test="${size.heel_height ne null}">
                                                        <td><fmt:formatNumber value="${size.heel_height}"/></td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="review" class="tab-panel">
                            <div class="review-content">
                                <jsp:include page="./components/reviewList.jsp"></jsp:include>
                            </div>
                        </div>
                        <div id="question" class="tab-panel">
                            <div class="question-list" id="question-list">
                                <jsp:include page="./components/questionList.jsp"></jsp:include>
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
                </c:if>
            </div>
        </div>

        <!-- footer -->
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>

    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="./user/customer/js/product/productDetails.js"></script>
</body>
</html>
