<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>무신사</title>

    <%-- Google Font : Gothic A1 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/writeReview.css"/>
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
                            <span class="review-title">후기 작성</span>
                            <div class="wrap-notice">
                                <span class="review-notice" data-toggle="modal" data-target="#noticeModal">작성 시 유의사항</span>
                                <span class="arrow-icon" data-toggle="modal" data-target="#noticeModal">&gt;</span>
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
                            <span class="star" data-value="1">&#9734;</span>
                            <span class="star" data-value="2">&#9734;</span>
                            <span class="star" data-value="3">&#9734;</span>
                            <span class="star" data-value="4">&#9734;</span>
                            <span class="star" data-value="5">&#9734;</span>
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
                            <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                <label class="btn btn-outline-secondary active">
                                    <input type="radio" name="options" id="option1" autocomplete="off" checked>남성
                                </label>
                                <label class="btn btn-outline-secondary">
                                    <input type="radio" name="options" id="option2" autocomplete="off">여성
                                </label>
                            </div>
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
                        <span class="reward-points">예상 적립금: <span class="strong">0 / 1,000점</span></span>
                        <button type="button" class="btn btn-dark">등록하기</button>
                    </div>

                </div>


            </div>
        </div>

        <!-- footer -->
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>

    <%-- Modal --%>

    <!-- 작성 유의사항 모달 -->
    <div class="modal fade" id="noticeModal" tabindex="-1" role="dialog" aria-labelledby="noticeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="noticeModalLabel">작성 시 유의사항</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div>
                        <ul>
                            <li>구매 확정일로부터 30일 이내에 리뷰를 작성해야 합니다.</li>
                            <li>리뷰는 텍스트나 사진으로 작성할 수 있습니다.</li>
                            <li>텍스트만 작성할 경우 500원, 텍스트와 사진을 함께 작성할 경우 1,000원의 적립금을 받을 수 있습니다.</li>
                            <li>후기 작성일 이후 영업일 기준 1~2일 내에 적립금이 지급됩니다.</li>
                            <li>후기 개수가 많을 경우 적립금 지급이 다소 지연될 수 있습니다.</li>
                            <li>마이 페이지에서 작성한 후기의 적립금 지급 여부를 확인할 수 있습니다.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    //리뷰 별점 기능
    document.addEventListener('DOMContentLoaded', function () {
        const stars = document.querySelectorAll('.rating-stars .star');

        stars.forEach(star => {
            star.addEventListener('click', function () {
                // 모든 별의 selected 클래스 제거
                stars.forEach(s => s.classList.remove('selected'));

                // 클릭한 별과 그 이전 별까지 selected 클래스 추가
                const value = parseInt(this.getAttribute('data-value'));
                stars.forEach(s => {
                    if (parseInt(s.getAttribute('data-value')) <= value) {
                        s.classList.add('selected');
                    }
                });
            });
        });
    });

</script>
</body>
</html>
