<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" type="text/css" href="../../css/mypage/writeReview.css"/>
</head>
<body>
    <!-- header -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <!-- content -->
    <div class="wrap">
        <div class="row">
            <div class="container">
                <div class="review-container">

                    <div class="review-header">
                        <div class="review-info">
                            <span class="review-title">상품 후기 작성</span>
                            <div class="wrap-notice">
                                <span class="review-notice">작성시 유의사항</span>
                                <i class="arrow-icon">&gt;</i>
                            </div>
                        </div>
                    </div>
                    <div class="review-product">
                        <div class="product-image"></div>
                        <div class="product-details">
                            <p class="product-brand">thisisnever</p>
                            <p class="product-name">Mesh Football Jersey Navy</p>
                            <p class="product-option">M / 1개</p>
                        </div>
                    </div>
                    <div class="review-rating">
                        <p class="section-title">이 상품 어떠셨나요?</p>
                        <div class="rating-stars">
                            <i class="star">&#9734;</i>
                            <i class="star">&#9734;</i>
                            <i class="star">&#9734;</i>
                            <i class="star">&#9734;</i>
                            <i class="star">&#9734;</i>
                        </div>
                    </div>
                    <div class="review-comment">
                        <label for="review-comment" class="section-title">어떤 점이 좋았나요?</label>
                        <textarea id="review-comment" maxlength="500" placeholder="한달 동안 사용하시면서 느꼈던 장점에 대해 의견을 자세히 입력해주세요."></textarea>
                        <div class="comment-footer">
                            <span class="text-count">0/500</span>
                        </div>
                    </div>
                    <!-- 사진 정보 -->
                    <div class="photo-info">
                        <div class="wrap-photo-title">
                            <p class="section-title">사진 첨부</p>
                            <div class="photo-count">500점 혜택</div>
                        </div>
                        <div class="photo-box">
                            <span class="plus">+</span><br/>
                            <span class="add-photo">사진 추가</span>
                        </div>
                    </div>
                    <!-- 체형 정보 -->
                    <div class="body-info">
                        <p class="section-title">내 체형정보를 입력해주세요 (필수)</p>
                        <div class="gender-selection">
                            <label>
                                <input type="radio" name="gender" value="female" checked> 여성
                            </label>
                            <label>
                                <input type="radio" name="gender" value="male"> 남성
                            </label>
                        </div>
                        <div class="input-group">
                            <input type="text" placeholder="키를 입력해주세요" />
                            <span class="unit">cm</span>
                        </div>
                        <div class="input-group">
                            <input type="text" placeholder="몸무게를 입력해주세요" />
                            <span class="unit">kg</span>
                        </div>
                        <div class="checkbox-group">
                            <label>
                                <input type="checkbox"> 나의 신체정보에 업데이트
                            </label>
                        </div>
                    </div>
                    <!-- 등록 버튼 -->
                    <div class="action-buttons">
                        <span class="reward-points">예상 적립금: <strong>0/1,000점</strong></span>
                        <button type="button" class="btn btn-dark">등록하기</button>
                    </div>

                </div>


            </div>
        </div>

        <!-- footer -->
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
