<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="/user/css/snapcommon.css">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>코디 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="/user/css/mypage.css">
</head>

<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-fluid mt-4">
    <div class="row">
        <!-- 왼쪽 메뉴바 -->
        <div class="col-md-2 border-end position-fixed" style="height: 100vh;">
            <jsp:include page="/user/jsp/layout/left.jsp"></jsp:include>
        </div>

        <!-- 콘텐츠 영역 -->
        <div class="col-md-10 offset-md-2">
            <div class="flex-grow-1 p-4">
                <div class="container mt-4">
                    <div class="row justify-content-center">
                        <!-- 게시글 내용 -->
                        <div class="col-md-8 bg-white rounded shadow-sm p-4 mx-auto">
                            <!-- 사진 영역 -->
                            <div id="photoCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <c:forEach var="image" items="${fn:split(snap.additional_images, ',')}" varStatus="status">
                                        <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                            <img src="${fn:trim(image)}" class="d-block w-100" alt="사진"
                                                 style="object-fit: cover; max-height: 500px;">
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- 좌우 이동 버튼 -->
                                <button class="carousel-control-prev" type="button" data-bs-target="#photoCarousel" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">이전</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#photoCarousel" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">다음</span>
                                </button>
                            </div>

                            <!-- 제품 정보 -->
                            <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <c:forEach var="product" items="${productList}" varStatus="status">
                                        <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                            <div class="d-flex align-items-center">
                                                <!-- 제품 이미지 -->
                                                <img src="${product.prod_image}" class="img-fluid me-3" alt="제품 이미지"
                                                     style="width: 120px; height: 120px; object-fit: cover;">

                                                <!-- 제품 정보 -->
                                                <div>
                                                    <h5 class="mb-1 text-primary">${product.sellerName}</h5>
                                                    <p class="mb-1">${product.name}</p>
                                                    <p class="mb-1">
                                                        <span class="text-danger fw-bold">${product.sale}%</span>
                                                        <span>${product.price}원</span>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- 좌우 이동 버튼 -->
                                <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">이전</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">다음</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/user/jsp/snap/snapModal.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/JS/snapModal.js"></script>
<script>

  // 좋아요 토글 함수
  function toggleLike(photoId) {
    fetch('/Controller?type=likeToggle', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ boardNo: photoId })
    })
        .then(response => response.json())
        .then(data => {
          if (data.success) {
            location.reload(); // 페이지 새로고침
          } else {
            alert('좋아요 처리에 실패했습니다.');
          }
        })
        .catch(error => console.error('Error:', error));
  }

  //사진번호슬라이드
  document.addEventListener('DOMContentLoaded', function () {
    const photoCarousel = document.getElementById('photoCarousel');
    const currentIndexSpan = document.getElementById('currentIndex');
    const totalPhotosSpan = document.getElementById('totalPhotos');
    const carouselItems = document.querySelectorAll('#photoCarousel .carousel-item');

    // 총 사진 수 설정
    const totalPhotos = carouselItems.length;
    if (totalPhotosSpan) {
      totalPhotosSpan.textContent = totalPhotos;
    }

    // 슬라이드 변경 이벤트
    photoCarousel.addEventListener('slide.bs.carousel', function (event) {
      const activeIndex = event.to + 1; // 현재 활성 슬라이드 인덱스 (1부터 시작)
      updatePhotoCounter(activeIndex);
    });

    function updatePhotoCounter(currentIndex) {
      if (currentIndexSpan) {
        currentIndexSpan.textContent = currentIndex;
      } else {
        console.error('currentIndex element not found');
      }
    }

    // 초기 카운터 설정
    updatePhotoCounter(1);
  });


</script>
</body>
</html>
