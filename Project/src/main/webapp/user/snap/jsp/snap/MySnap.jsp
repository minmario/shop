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
    <link rel="stylesheet" href="/user/snap/css/Snap/mypage.css">
</head>
</head>
<style>
    /* 프로필 이미지 스타일 */
    .comment-profile {
        width: 30px; /* 기존보다 작게 */
        height: 30px;
        border-radius: 50%;
        object-fit: cover;
    }

    /* 닉네임 스타일 */
    .comment-nickname {
        font-weight: 400; /* 기본보다 가볍게 */
        color: gray;
        font-size: 14px;
    }

    /* 댓글 리스트 스타일 */
    .comment-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px;
    }

    /* 댓글 내용 스타일 */
    .comment-text {
        font-weight: bold; /* 강조 */
        font-size: 14px;
    }

    /* 옵션 버튼 (...) 스타일 */
    .comment-options {
        background: none;
        border: none;
        font-size: 18px;
        cursor: pointer;
    }

    /* 수정 / 삭제 메뉴 */
    .dropdown-menu {
        min-width: 100px;
        font-size: 14px;
    }

    /* 댓글 입력창 스타일 */
    .modal-footer {
        padding: 10px;
        border-top: 1px solid #ddd;
    }

    #commentModal .modal-dialog {
        max-width: 600px; /* 💡 모달의 최대 너비 지정 */
        width: 90%; /* 💡 화면 크기에 맞춰 유동적 조정 */
    }

    /* 댓글 모달 스타일 */
    #commentModal .modal-body {

        max-height: 500px; /* 💡 댓글 영역 최대 높이 지정 */
        overflow-y: auto; /* 💡 스크롤 적용 */
    }

    /* 입력창과 버튼 고정 */
    #commentModal .modal-footer {
        position: sticky;
        bottom: 0;
        background: white;
        padding: 10px;
        border-top: 1px solid #ddd;
    }


</style>
<body>

<jsp:include page="/user/snap/jsp/layout/header.jsp"></jsp:include>
<script>
  var boardNo = "${snap.id}";
  console.log("boardNo:", boardNo); // 값 확인
</script>

<div class="container-fluid mt-4">
    <div class="row">
        <!-- ✅ 왼쪽 메뉴바 -->
        <div class="col-md-2 border-end position-fixed" style="height: 100vh;">
            <jsp:include page="/user/snap/jsp/layout/left.jsp"></jsp:include>
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
                                            <button class="btn btn-outline-secondary btn-sm">
                                                <i class="bi bi-gear"></i>
                                            </button>
                                            <div class="dropdown ms-2">
                                                <button class="btn btn-outline-secondary btn-sm" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                                    ...
                                                </button>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                                                    <a href="#" class="dropdown-item edit-snap-btn text-primary"
                                                       data-snap-id="${snap.id}" data-bs-toggle="modal" data-bs-target="#snapEditModal">
                                                        수정하기
                                                    </a>
                                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/Controller?type=boardDelte&id=${snap.id}">삭제하기</a></li>

                                                </ul>
                                            </div>
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
                                    <!-- 사진 번호 표시  : 현재 모달이후로 슬라이드효과에따라 인덱스값이 추가안됨 // 나중에  수정 -->
<%--                                    <div id="photoCounter" style="position: absolute; transform: translateY(-80px); bottom: 10px; right: 10px; color: white; font-size: 16px; background: rgba(0, 0, 0, 0.5); padding: 5px 10px; border-radius: 5px;">--%>
<%--                                        <span id="currentIndex">1</span>/<span id="totalPhotos">${fn:length(fn:split(snap.additional_images, ','))}</span>--%>
<%--                                    </div>--%>
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
                                 <c:if test="${not empty productList}">
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
                                 </c:if>
                                <!-- 아이콘 추가 -->
                                <div class="d-flex align-items-center me-3 my-2">
                                    <i class="bi bi-heart${liked ? '-fill' : ''} heart-icon " style="margin-top: 4px;margin-right: 16px;"
                                       data-board-no="${snap.id}"></i>
                                    <i class="bi bi-chat me-3" style="font-size: 24px; cursor: pointer;"></i>
                                    <i class="bi bi-share" style="font-size: 24px; cursor: pointer;"></i>
                                </div>

                                <!-- 게시글 내용 표시 (내용이 있을 경우에만 출력) -->
                                <c:if test="${not empty snap.content}">
                                    <div id="snapContent_${snap.id}" class="snap-content clamped-content" style="margin-bottom: 8px;">
                                            ${snap.content}
                                    </div>
                                    <!-- 더보기 버튼: 내용 길이에 따라 필요할 경우 보이도록 JavaScript로 제어 -->
                                    <div id="moreBtnContainer_${snap.id}" style="margin-bottom: 12px; display: none;">
                                        <span class="more-btn" onclick="toggleContent('${snap.id}')">더보기</span>
                                    </div>
                                </c:if>

                                <!-- 태그 표시 (태그가 있을 경우에만 출력) -->
                                <c:if test="${not empty snap.tags}">
                                    <div class="snap-tags" style="margin-bottom: 12px;">
                                        <c:forEach var="tag" items="${fn:split(snap.tags, ',')}">
                                            <c:if test="${not empty tag}">
                                                <span class="snap-tag">${tag}</span>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </c:if>

                                <!-- 댓글 모두 보기 -->
                                 <c:if test="${not empty latestReply.nickname}">
                                <button class="btn btn-light btn-sm mt-2" id="viewAllCommentsBtn">댓글 모두 보기</button>
                                 </c:if>
                                <c:if test="${not empty latestReply}">
                                     <!-- 최신 댓글 표시 -->
                                <div id="latestComment" class="list-group">
                                    <p class="mb-0">
                                            <strong>${latestReply.nickname}</strong>&nbsp;&nbsp;${latestReply.content}
                                        </p>
                                </div>
                                </c:if>
                                <%--//댓글모달--%>
                                <div class="modal fade" id="commentModal" tabindex="-1" aria-labelledby="commentModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <!-- 모달 헤더 -->
                                            <div class="modal-header">
                                                <h5 class="modal-title">댓글</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <!-- 모달 본문 (댓글 리스트) -->
                                            <div class="modal-body">
                                                <ul id="commentList" class="list-group list-group-flush">
                                                    <!-- 동적으로 댓글이 추가될 자리 -->
                                                </ul>
                                            </div>

                                            <!-- 모달 하단 (댓글 입력창) -->
                                            <div class="modal-footer">
                                                <div class="input-group">
                                                    <input type="text" id="commentInput1" style="width: 440px;" class="form-control" placeholder="댓글을 입력하세요...">
                                                    <button class="btn btn-primary" style="margin-left: 3px;" id="postCommentBtn1">게시</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <!-- 댓글 작성 -->
                                <div class="d-flex align-items-center mb-4">
                                  <img src="${snap.profile_image}" alt="프로필" class="rounded-circle me-2" style="width: 40px; height: 40px;">
                                 <input id="commentInput" type="text" style="width: 475.25px" class="form-control" placeholder="댓글을 입력하세요...">
                                 <button id="postCommentBtn" class="btn btn-primary btn-sm ms-2" style="width:67.25px ">게시</button>
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

                <!--  추천 사용자 목록 (4 컬럼) -->
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
                                                <img  onclick="location.href='Controller?type=profile&cus_no=${user.id}'" src="${user.profile_image}" class="rounded-circle" style="width: 40px; height: 40px; object-fit: cover;">
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

    <!-- 수정 모달 컨테이너 -->
    <div class="modal fade" id="snapEditModal" tabindex="-1" aria-labelledby="snapEditModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Ajax로 로드될 내용이 이곳에 삽입됩니다. -->
                <div class="text-center p-4">
                    <span>로딩 중...</span>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="/user/snap/jsp/snap/snapModal.jsp"></jsp:include>
    <jsp:include page="/user/snap/jsp/snap/snapEdit.jsp" />
    <script src="${pageContext.request.contextPath}/JS/snapModal.js"></script>
    <script src="${pageContext.request.contextPath}/JS/snap/MySnap.js"></script>


<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  $(document).on('click', '.edit-snap-btn', function(e) {
    e.preventDefault();
    var snapId = $(this).data('snap-id');
    // Ajax 호출하여 수정 모달 컨텐츠 로드
    $.ajax({
      url: "${pageContext.request.contextPath}/Controller?type=xx&id=" + snapId,
      method: "GET",
      success: function(response) {
        // 모달 내부의 .modal-content에 수정 페이지 HTML 삽입
        $('#snapEditModal .modal-content').html(response);
        // 모달을 강제로 열어둔다면 (data-bs-toggle과 data-bs-target가 있으므로 자동으로 열리지만, 필요시 아래 코드를 사용)
        // $('#snapEditModal').modal('show');
      },
      error: function() {
        alert("게시글 정보를 불러오는데 실패했습니다.");
      }
    });
  });

</script>

</body>
</html>
