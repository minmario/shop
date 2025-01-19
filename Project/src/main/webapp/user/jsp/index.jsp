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
    <link rel="stylesheet" type="text/css" href="./user/css/index/index.css"/>
</head>
<body>
    <%-- header --%>
    <jsp:include page="layout/header.jsp"></jsp:include>

    <div class="wrap">
        <div class="row">
            <div class="container">
                <div id="accordion" class="product-menu">
                    <!-- 인기 -->
                    <div class="card">
                        <div class="card-header" id="popularHeading">
                            <button class="btn btn-link d-flex justify-content-between align-items-center toggle-btn" data-toggle="collapse" data-target="#popularCollapse" aria-expanded="true" aria-controls="popularCollapse">
                                <span class="text-left">인기 <span class="badge badge-secondary">Best</span></span>
                                <i class="bi bi-dash"></i>
                            </button>
                        </div>
                        <div id="popularCollapse" class="collapse show" aria-labelledby="popularHeading" data-parent="#accordion">
                            <div class="card-body">
                                <ul class="list-unstyled">
                                    <li><button class="unstyled-btn" data-value="데님 팬츠">데님 팬츠 <span class="badge badge-secondary">(10,420)</span></button></li>
                                    <li><button class="unstyled-btn" data-value="캔버스/탄화">캔버스/탄화 <span class="badge badge-secondary">(3,516)</span></button></li>
                                    <li><button class="unstyled-btn" data-value="긴팔 티셔츠">긴팔 티셔츠 <span class="badge badge-secondary">(27,810)</span></button></li>
                                    <li><button class="unstyled-btn" data-value="코튼 팬츠">코튼 팬츠 <span class="badge badge-secondary">(4,461)</span></button></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- 상의 -->
                    <div class="card">
                        <div class="card-header" id="topsHeading">
                            <button class="btn btn-link d-flex justify-content-between align-items-center toggle-btn" data-toggle="collapse" data-target="#topsCollapse" aria-expanded="false" aria-controls="topsCollapse">
                                <span class="text-left">상의 <span class="badge badge-secondary">Top</span></span>
                                <i class="bi bi-plus"></i>
                            </button>
                        </div>
                        <div id="topsCollapse" class="collapse" aria-labelledby="topsHeading" data-parent="#accordion">
                            <div class="card-body">
                                <ul class="list-unstyled">
                                    <li><button class="unstyled-btn" data-value="티셔츠">티셔츠 <span class="badge badge-secondary">(10,420)</span></button></li>
                                    <li><button class="unstyled-btn" data-value="셔츠">셔츠 <span class="badge badge-secondary">(3,516)</span></button></li>
                                    <li><button class="unstyled-btn" data-value="니트">니트 <span class="badge badge-secondary">(27,810)</span></button></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- 아우터 -->
                    <div class="card">
                        <div class="card-header" id="outerHeading">
                            <button class="btn btn-link d-flex justify-content-between align-items-center toggle-btn" data-toggle="collapse" data-target="#outerCollapse" aria-expanded="false" aria-controls="outerCollapse">
                                <span class="text-left">아우터 <span class="badge badge-secondary">Outer</span></span>
                                <i class="bi bi-plus"></i>
                            </button>
                        </div>
                        <div id="outerCollapse" class="collapse" aria-labelledby="outerHeading" data-parent="#accordion">
                            <div class="card-body">
                                <ul class="list-unstyled">
                                    <li><button class="unstyled-btn" data-value="코트">코트 <span class="badge badge-secondary">(27,810)</span></button></li>
                                    <li><button class="unstyled-btn" data-value="자켓">자켓 <span class="badge badge-secondary">(4,461)</span></button></li>
                                    <li><button class="unstyled-btn" data-value="점퍼">점퍼 <span class="badge badge-secondary">(3,516)</span></button></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- 바지 -->
                    <div class="card">
                        <div class="card-header" id="pantsHeading">
                            <button class="btn btn-link d-flex justify-content-between align-items-center toggle-btn" data-toggle="collapse" data-target="#pantsCollapse" aria-expanded="false" aria-controls="pantsCollapse">
                                <span class="text-left">바지 <span class="badge badge-secondary">Pants</span></span>
                                <i class="bi bi-plus"></i>
                            </button>
                        </div>
                        <div id="pantsCollapse" class="collapse" aria-labelledby="pantsHeading" data-parent="#accordion">
                            <div class="card-body">
                                <ul class="list-unstyled">
                                    <li><button class="unstyled-btn" data-value="슬랙스">슬랙스 <span class="badge badge-secondary">(10,420)</span></button></li>
                                    <li><button class="unstyled-btn" data-value="청바지">청바지 <span class="badge badge-secondary">(10,420)</span></button></li>
                                    <li><button class="unstyled-btn" data-value="트레이닝 바지">트레이닝 바지 <span class="badge badge-secondary">(10,420)</span></button></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- 신발 -->
                    <div class="card">
                        <div class="card-header" id="shoesHeading">
                            <button class="btn btn-link d-flex justify-content-between align-items-center toggle-btn" data-toggle="collapse" data-target="#shoesCollapse" aria-expanded="false" aria-controls="shoesCollapse">
                                <span class="text-left">신발 <span class="badge badge-secondary">Shoes</span></span>
                                <i class="bi bi-plus"></i>
                            </button>
                        </div>
                        <div id="shoesCollapse" class="collapse" aria-labelledby="shoesHeading" data-parent="#accordion">
                            <div class="card-body">
                                <ul class="list-unstyled">
                                    <li><button class="unstyled-btn" data-value="운동화">운동화 <span class="badge badge-secondary">(10,420)</span></button></li>
                                    <li><button class="unstyled-btn" data-value="구두">구두 <span class="badge badge-secondary">(10,420)</span></button></li>
                                    <li><button class="unstyled-btn" data-value="샌들">샌들 <span class="badge badge-secondary">(10,420)</span></button></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="product-section">
                    <div class="sorting-bar">
                        <div class="selected-filters">
                            <button class="unstyled-btn selected-item d-none">
                                <span class="item-text"></span>
                                <i class="bi bi-x remove-item"></i>
                            </button>
                        </div>

                        <div class="sort-pagination-container">
                            <div class="sort-dropdown">
                                <div class="dropdown-items">
                                    <div class="dropdown-item active" data-value="recommend">추천순</div>
                                    <div class="dropdown-item" data-value="new">신상품(재입고)순</div>
                                    <div class="dropdown-item" data-value="low-price">낮은 가격순</div>
                                    <div class="dropdown-item" data-value="high-price">높은 가격순</div>
                                    <div class="dropdown-item" data-value="discount-rate">할인율순</div>
                                    <div class="dropdown-item" data-value="review">후기순</div>
                                    <div class="dropdown-item" data-value="sales">판매순</div>
                                </div>
                            </div>
                            <nav aria-label="Page navigation" class="navigation">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">1</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">2</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">3</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                    <div class="product-list d-flex flex-wrap">
                        <c:forEach begin="1" end="9" varStatus="st">
                            <div class="product-item">
                                <img src="./user/images/product${st.index}.jpg" alt="상품 이미지" class="product-image">
                                <div class="product-info">
                                    <p class="product-brand"><strong>브랜드명</strong></p>
                                    <p class="product-name">상품 이름 상품 이름 상품 이름 상품 이름 상품 이름 상품 이름</p>
                                    <p class="product-price">
                                        <del>29,100원</del>
                                        <strong>19,000원</strong>
                                    </p>
                                    <div class="product-rating">
                                        <span class="stars">
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <span class="star-count">137</span>
                                        </span>
                                    </div>
                                    <div class="product-likes">
                                        <i class="bi bi-heart-fill"></i>
                                        <span class="like-count">100</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <%-- footer --%>
        <jsp:include page="./layout/footer.jsp"></jsp:include>
    </div>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="./user/js/index/index.js"></script>
</body>
</html>
