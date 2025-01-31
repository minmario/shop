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
    <link rel="stylesheet" href="/user/css/Snap/mypage.css">
</head>

<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-fluid mt-4">
    <div class="row">
        <!-- ✅ 왼쪽 메뉴바 -->
        <div class="col-md-2 border-end position-fixed" style="height: 100vh;">
            <jsp:include page="/user/jsp/layout/left.jsp"></jsp:include>
        </div>

        <!-- ✅ 콘텐츠 + 추천 사용자 목록을 같은 줄(row)로 배치 -->
        <div class="col-md-10 offset-md-2">
            <div class="row">
                <!-- ✅ 본문 내용 (8 컬럼) -->
                <div class="col-md-8">
                    <div class="container mt-4">
                        <div class="row justify-content-center">
                            <div class="col-md-12 bg-light rounded shadow-sm p-4 mx-auto"
                                 style="width: 600px; overflow: hidden; position: relative;">

                                <!-- 사용자 정보 -->
                                <div class="d-flex justify-content-between align-items-center border-bottom pb-3 mb-4">
                                    <div class="d-flex align-items-center">
                                        <!-- 프로필 이미지 -->
                                        <div style="width: 50px; height: 50px; overflow: hidden; border-radius: 50%;">
                                            <img src="${snap.profile_image != null ? snap.profile_image : '/path/to/default-user-image.jpg'}"
                                                 alt="프로필 이미지"
                                                 style="width: 100%; height: 100%; object-fit: cover;"
                                                 onclick="location.href='Controller?type=profile&cus_no=${snap.cus_no}'">
                                        </div>
                                        <!-- 닉네임 -->
                                        <div class="ms-3">
                                            <h5 class="mb-0">${snap.nickname}</h5>
                                            <small class="text-muted">${snap.gender}</small>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <c:if test="${sessionScope.cus_id == snap.cus_no}">
                                            <!-- 내 프로필 -->
                                            <button class="btn btn-outline-secondary btn-sm">프로필 편집</button>
                                        </c:if>
                                        <c:if test="${sessionScope.cus_id != snap.cus_no}">
                                            <!-- 다른 사람의 프로필인 경우 -->
                                            <c:choose>
                                                <c:when test="${isFollowing}">
                                                    <!-- 팔로우 중인 경우 -->
                                                    <button id="followButton" class="btn btn-primary btn-sm" data-following-id="${snap.cus_no}" style="font-size: 0.875rem;">팔로잉 취소</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- 팔로우하지 않은 경우 -->
                                                    <button id="followButton" class="btn btn-primary btn-sm" data-following-id="${snap.cus_no}" style="font-size: 0.875rem;">팔로우</button>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                    </div>
                                </div>

                                <!-- 사진 영역 -->
                                <div id="photoCarousel" class="carousel slide mb-4" data-bs-ride="carousel"
                                     style="width: 100%; height: 500px; display: flex; justify-content: center; align-items: center;">
                                    <div class="carousel-inner" style="width: 100%; height: 100%;">
                                        <!-- 메인 이미지 및 추가 이미지 -->
                                        <c:forEach var="image" items="${fn:split(snap.additional_images, ',')}" varStatus="status">
                                            <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                                <img src="${fn:trim(image)}" class="d-block w-100" alt="사진"
                                                     style="object-fit: cover; max-height: 500px;">
                                            </div>
                                        </c:forEach>

                                    </div>
                                    <!-- 사진 번호 표시 -->
                                    <div id="photoCounter" style="position: absolute; transform: translateY(-80px); bottom: 10px; right: 10px; color: white; font-size: 16px; background: rgba(0, 0, 0, 0.5); padding: 5px 10px; border-radius: 5px;">
                                        <span id="currentIndex">1</span>/<span id="totalPhotos">${fn:length(fn:split(snap.additional_images, ','))}</span>
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

                                <div id="productCarousel" class="carousel slide bg-white rounded shadow-sm p-3" data-bs-ride="carousel">
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

                                <!-- 아이콘 추가 -->
                                <div class="d-flex align-items-center me-3 my-2">
                                    <i class="bi bi-heart me-3${snap.liked ? '-fill' : ''} heart-icon "
                                       data-board-no="${snap.id}" style="font-size: 24px; cursor: pointer;"></i>
                                    <i class="bi bi-chat me-3" style="font-size: 24px; cursor: pointer;"></i>
                                    <i class="bi bi-share" style="font-size: 24px; cursor: pointer;"></i>
                                </div>

                                <!-- 댓글 작성 -->
                                <div class="d-flex align-items-center mb-4">
                                    <img src="${snap.profile_image}" alt="프로필" class="rounded-circle me-2" style="width: 40px; height: 40px;">
                                    <input type="text" style="width: 420px" class="form-control" placeholder="댓글을 입력하세요...">
                                    <button class="btn btn-primary btn-sm ms-2">게시</button>
                                </div>

                                <!-- 댓글 리스트 -->
                                <div class="list-group" style="overflow-y: auto; max-height: 200px;">
                                    <c:forEach var="comment" items="${comments}">
                                        <div class="list-group-item">
                                            <div class="d-flex align-items-center mb-2">
                                                <img src="/path/to/comment-profile.jpg" alt="프로필" class="rounded-circle me-2" style="width: 40px; height: 40px;">
                                                <div>
                                                    <span class="fw-bold">${comment.nickname}</span>
                                                    <small class="text-muted ms-2">${comment.writeDate}</small>
                                                </div>
                                            </div>
                                            <p class="mb-0">${comment.content}</p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ✅ 추천 사용자 목록 (4 컬럼) -->
                <div class="col-md-4 border-start p-3"
                     style="height: 100vh; overflow-y: auto; position: sticky; top: 0;">
                    <!-- 현재 로그인한 사용자 -->
                    <div class="d-flex align-items-center mb-4">
<%--                        <img src="${myProfile.profile_image}" alt="Profile" class="rounded-circle"--%>
<%--                             style="width: 50px; height: 50px;">--%>
                        <span class="ms-2 fw-bold">${myProfile.nickname}</span>
                    </div>

                    <!-- 추천 사용자 -->
                    <div class="card">
                        <div class="card-body">
                            <h6 class="fw-bold mb-3">회원님을 위한 추천</h6>
                            <c:if test="${not empty recommendedUsers}">
                                <ul class="list-unstyled">
                                    <c:forEach var="user" items="${recommendedUsers}">
                                        <li class="d-flex align-items-center justify-content-between mb-2">
                                            <div class="d-flex align-items-center">
                                                <img src="${user.profile_image}" class="rounded-circle" style="width: 40px; height: 40px; object-fit: cover;">
                                                <div class="ms-2">${user.nickname}</div>
                                            </div>
                                            <button class="btn btn-primary btn-sm follow-btn" data-user-id="${user.id}">팔로우</button>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:if>
                            <c:if test="${empty recommendedUsers}">
                                <p class="text-muted text-center">추천할 회원이 없습니다.</p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/user/jsp/snap/snapModal.jsp"></jsp:include>
    <script src="/JS/snapModal.js"></script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
