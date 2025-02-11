<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 관리</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts: Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        /* 통일된 디자인을 위한 CSS 변수 */
        :root {
            --primary-color: #0d6efd;
            --secondary-color: #6c757d;
            --background-color: #f5f6fa;
            --sidebar-bg: #2f4050;
            --sidebar-color: #ffffff;
            --header-bg: #23282c;
            --header-color: #ffffff;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-color);
            margin: 0;
            padding: 0;
        }
        /* 고정 헤더 */
        .header {
            background-color: var(--header-bg);
            color: var(--header-color);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 60px;
            z-index: 1050;
            display: flex;
            align-items: center;
            padding: 0 20px;
        }
        /* 좌측 사이드바 */
        .sidebar {
            background-color: var(--sidebar-bg);
            position: fixed;
            top: 60px; /* 헤더 높이 */
            left: 0;
            bottom: 0;
            width: 240px;
            padding: 20px;
            overflow-y: auto;
        }
        .sidebar .nav-link {
            color: var(--sidebar-color);
            margin-bottom: 10px;
            font-size: 1rem;
            padding: 10px 15px;
            border-radius: 4px;
            display: block;
        }
        .sidebar .nav-link:hover,
        .sidebar .nav-link.active {
            background-color: var(--primary-color);
            color: #fff;
        }
        /* 메인 콘텐츠 영역 */
        .main-content {
            margin-left: 260px;
            padding: 80px 30px 30px;
        }
        /* 카드 스타일 (모던 플랫 디자인) */
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .card-header {
            background-color: var(--primary-color);
            color: #fff;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            font-size: 1.1rem;
            padding: 15px 20px;
        }
        /* 버튼 스타일 */
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        /* 테이블 헤더 */
        .table thead {
            background-color: #e9ecef;
        }
        /* 검색 인풋 스타일 */
        .input-group .form-select,
        .input-group .form-control {
            border: 1px solid #ced4da;
        }
        /* (필요 시) 섹션 제목 영역 */
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
<!-- 상단 헤더 (공통 헤더 include) -->
<jsp:include page="/admin/jsp/layout/header.jsp" />

<!-- 좌측 사이드바 -->
<div class="sidebar">
    <nav class="nav flex-column">
        <a class="nav-link active" href="#announcement"><i class="bi bi-megaphone-fill"></i> 공지사항</a>
        <a class="nav-link" href="#snap"><i class="bi bi-camera-fill"></i> 스냅</a>
        <a class="nav-link" href="#inquiry"><i class="bi bi-question-circle-fill"></i> 문의</a>
        <a class="nav-link" href="#question"><i class="bi bi-chat-dots-fill"></i> 질문</a>
        <a class="nav-link" href="#review"><i class="bi bi-star-fill"></i> 리뷰</a>
    </nav>
</div>

<!-- 메인 콘텐츠 영역 -->
<div class="main-content">
    <h2 class="mb-4">게시판 관리</h2>

    <!-- 공지사항 섹션 -->
    <section id="announcement">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h5>대분류 목록</h5>
            <button class="btn btn-primary btn-sm add-user-btn" data-bs-toggle="modal" data-bs-target="#mainCategoryModal">
                대분류 추가
            </button>
        </div>
        <div class="mt-3">
            <div class="input-group">
                <span class="input-group-text"><i class="bi bi-search"></i></span>
                <select class="form-select" id="board_name_announcement">
                    <c:forEach var="name" items="${boardName}">
                        <c:if test="${name ne 'id' and name ne 'cus_no' and name ne 'season' and
                                          name ne 'prod_no' and name ne 'snapshot_image' and name ne 'additional_images' and
                                          name ne 'tags' and name ne 'gender' and name ne 'style' and name ne 'like_count' and
                                          name ne 'order_code' and name ne 'type' and name ne 'status' and
                                          name ne 'is_del' and name ne 'is_private'}">
                            <option class="column-name" value="${name}">${name}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <input type="text" class="form-control" placeholder="검색어 입력" id="board_word_announcement">
                <button class="btn btn-outline-secondary btn-sm" type="button" id="board_search_btn_announcement">검색</button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-striped" id="board_table_announcement">
                <thead class="table-light">
                <tr>
                    <c:forEach var="name" items="${boardName}">
                        <c:if test="${name ne 'id' and name ne 'cus_no' and name ne 'season' and
                                              name ne 'prod_no' and name ne 'snapshot_image' and name ne 'additional_images' and
                                              name ne 'tags' and name ne 'gender' and name ne 'style' and name ne 'like_count' and
                                              name ne 'order_code' and name ne 'type' and name ne 'status' and
                                              name ne 'is_del' and name ne 'is_private'}">
                            <th class="column-name">${name}</th>
                        </c:if>
                    </c:forEach>
                    <th>액션</th>
                </tr>
                </thead>
                <tbody id="announcementBody">
                <c:forEach var="bl" items="${boardList}">
                    <c:if test="${bl.bname eq 'announcement'}">
                        <tr id="row-${bl.id}">
                            <td>${bl.bname}</td>
                            <td>${bl.title}</td>
                            <td>${bl.content}</td>
                            <td>${bl.score}</td>
                            <td>${bl.write_date}</td>
                            <td>
                                <button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#deleteBoardModal"
                                        onclick="setBoardInfo('${bl.id}', '${bl.cus_no}')">삭제</button>
                                <button class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#seeBoardModal"
                                        onclick="setBoardId('${bl.id}')">자세히</button>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <button class="btn btn-outline-secondary btn-sm mt-3" onclick="location.href='Controller?type=boardmain'">초기화</button>
        <hr>
    </section>

    <!-- 스냅 섹션 -->
    <section id="snap">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h5>게시판 목록 - 스냅</h5>
            <button class="btn btn-primary btn-sm add-user-btn" data-bs-toggle="modal" data-bs-target="#boardModal">
                스냅 추가
            </button>
        </div>
        <div class="mt-3">
            <div class="input-group">
                <span class="input-group-text"><i class="bi bi-search"></i></span>
                <select class="form-select" id="board_name_snap">
                    <c:forEach var="name" items="${boardName}">
                        <c:if test="${name ne 'id' and name ne 'cus_no' and name ne 'season' and
                                          name ne 'prod_no' and name ne 'snapshot_image' and name ne 'additional_images' and
                                          name ne 'tags' and name ne 'gender' and name ne 'style' and name ne 'like_count' and
                                          name ne 'order_code' and name ne 'type' and name ne 'status' and
                                          name ne 'is_del' and name ne 'is_private'}">
                            <option class="column-name" value="${name}">${name}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <input type="text" class="form-control" placeholder="검색어 입력" id="board_word_snap">
                <button class="btn btn-outline-secondary btn-sm" type="button" id="board_search_btn_snap">검색</button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-striped" id="board_table_snap">
                <thead class="table-light">
                <tr>
                    <c:forEach var="name" items="${boardName}">
                        <c:if test="${name ne 'id' and name ne 'cus_no' and name ne 'season' and
                                              name ne 'prod_no' and name ne 'snapshot_image' and name ne 'additional_images' and
                                              name ne 'tags' and name ne 'gender' and name ne 'style' and name ne 'like_count' and
                                              name ne 'order_code' and name ne 'type' and name ne 'status' and
                                              name ne 'is_del' and name ne 'is_private'}">
                            <th class="column-name">${name}</th>
                        </c:if>
                    </c:forEach>
                    <th>액션</th>
                </tr>
                </thead>
                <tbody id="snapBody">
                <c:forEach var="bl" items="${boardList}">
                    <c:if test="${bl.bname eq 'snap'}">
                        <tr id="row-${bl.id}">
                            <td>${bl.bname}</td>
                            <td>${bl.title}</td>
                            <td>${bl.content}</td>
                            <td>${bl.score}</td>
                            <td>${bl.write_date}</td>
                            <td>
                                <button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#deleteBoardModal"
                                        onclick="setBoardInfo('${bl.id}', '${bl.cus_no}')">삭제</button>
                                <button class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#seeBoardModal"
                                        onclick="setBoardId('${bl.id}')">자세히</button>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <button class="btn btn-outline-secondary btn-sm mt-3" onclick="location.href='Controller?type=boardmain'">초기화</button>
        <hr>
    </section>

    <!-- 문의 섹션 -->
    <section id="inquiry">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h5>게시판 목록 - 문의</h5>
            <button class="btn btn-primary btn-sm add-user-btn" data-bs-toggle="modal" data-bs-target="#boardModal">
                문의 추가
            </button>
        </div>
        <div class="mt-3">
            <div class="input-group">
                <span class="input-group-text"><i class="bi bi-search"></i></span>
                <select class="form-select" id="board_name_inquiry">
                    <c:forEach var="name" items="${boardName}">
                        <c:if test="${name ne 'id' and name ne 'cus_no' and name ne 'season' and
                                          name ne 'prod_no' and name ne 'snapshot_image' and name ne 'additional_images' and
                                          name ne 'tags' and name ne 'gender' and name ne 'style' and name ne 'like_count' and
                                          name ne 'order_code' and name ne 'type' and name ne 'status' and
                                          name ne 'is_del' and name ne 'is_private'}">
                            <option class="column-name" value="${name}">${name}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <input type="text" class="form-control" placeholder="검색어 입력" id="board_word_inquiry">
                <button class="btn btn-outline-secondary btn-sm" type="button" id="board_search_btn_inquiry">검색</button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-striped" id="board_table_inquiry">
                <thead class="table-light">
                <tr>
                    <c:forEach var="name" items="${boardName}">
                        <c:if test="${name ne 'id' and name ne 'cus_no' and name ne 'season' and
                                              name ne 'prod_no' and name ne 'snapshot_image' and name ne 'additional_images' and
                                              name ne 'tags' and name ne 'gender' and name ne 'style' and name ne 'like_count' and
                                              name ne 'order_code' and name ne 'type' and name ne 'status' and
                                              name ne 'is_del' and name ne 'is_private'}">
                            <th class="column-name">${name}</th>
                        </c:if>
                    </c:forEach>
                    <th>액션</th>
                </tr>
                </thead>
                <tbody id="inquiryBody">
                <c:forEach var="bl" items="${boardList}">
                    <c:if test="${bl.bname eq 'inquiry'}">
                        <tr id="row-${bl.id}">
                            <td>${bl.bname}</td>
                            <td>${bl.title}</td>
                            <td>${bl.content}</td>
                            <td>${bl.score}</td>
                            <td>${bl.write_date}</td>
                            <td>
                                <button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#deleteBoardModal"
                                        onclick="setBoardInfo('${bl.id}', '${bl.cus_no}')">삭제</button>
                                <button class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#seeBoardModal"
                                        onclick="setBoardId('${bl.id}')">자세히</button>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <button class="btn btn-outline-secondary btn-sm mt-3" onclick="location.href='Controller?type=boardmain'">초기화</button>
        <hr>
    </section>

    <!-- 질문 섹션 -->
    <section id="question">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h5>게시판 목록 - 질문</h5>
            <button class="btn btn-primary btn-sm add-user-btn" data-bs-toggle="modal" data-bs-target="#boardModal">
                질문 추가
            </button>
        </div>
        <div class="mt-3">
            <div class="input-group">
                <span class="input-group-text"><i class="bi bi-search"></i></span>
                <select class="form-select" id="board_name_question">
                    <c:forEach var="name" items="${boardName}">
                        <c:if test="${name ne 'id' and name ne 'cus_no' and name ne 'season' and
                                          name ne 'prod_no' and name ne 'snapshot_image' and name ne 'additional_images' and
                                          name ne 'tags' and name ne 'gender' and name ne 'style' and name ne 'like_count' and
                                          name ne 'order_code' and name ne 'type' and name ne 'status' and
                                          name ne 'is_del' and name ne 'is_private'}">
                            <option class="column-name" value="${name}">${name}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <input type="text" class="form-control" placeholder="검색어 입력" id="board_word_question">
                <button class="btn btn-outline-secondary btn-sm" type="button" id="board_search_btn_question">검색</button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-striped" id="board_table_question">
                <thead class="table-light">
                <tr>
                    <c:forEach var="name" items="${boardName}">
                        <c:if test="${name ne 'id' and name ne 'cus_no' and name ne 'season' and
                                              name ne 'prod_no' and name ne 'snapshot_image' and name ne 'additional_images' and
                                              name ne 'tags' and name ne 'gender' and name ne 'style' and name ne 'like_count' and
                                              name ne 'order_code' and name ne 'type' and name ne 'status' and
                                              name ne 'is_del' and name ne 'is_private'}">
                            <th class="column-name">${name}</th>
                        </c:if>
                    </c:forEach>
                    <th>액션</th>
                </tr>
                </thead>
                <tbody id="questionBody">
                <c:forEach var="bl" items="${boardList}">
                    <c:if test="${bl.bname eq 'question'}">
                        <tr id="row-${bl.id}">
                            <td>${bl.bname}</td>
                            <td>${bl.title}</td>
                            <td>${bl.content}</td>
                            <td>${bl.score}</td>
                            <td>${bl.write_date}</td>
                            <td>
                                <button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#deleteBoardModal"
                                        onclick="setBoardInfo('${bl.id}', '${bl.cus_no}')">삭제</button>
                                <button class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#seeBoardModal"
                                        onclick="setBoardId('${bl.id}')">자세히</button>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <button class="btn btn-outline-secondary btn-sm mt-3" onclick="location.href='Controller?type=boardmain'">초기화</button>
        <hr>
    </section>

    <!-- 리뷰 섹션 -->
    <section id="review">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h5>게시판 목록 - 리뷰</h5>
            <button class="btn btn-primary btn-sm add-user-btn" data-bs-toggle="modal" data-bs-target="#boardModal">
                리뷰 추가
            </button>
        </div>
        <div class="mt-3">
            <div class="input-group">
                <span class="input-group-text"><i class="bi bi-search"></i></span>
                <select class="form-select" id="board_name_review">
                    <c:forEach var="name" items="${boardName}">
                        <c:if test="${name ne 'id' and name ne 'cus_no' and name ne 'season' and
                                          name ne 'prod_no' and name ne 'snapshot_image' and name ne 'additional_images' and
                                          name ne 'tags' and name ne 'gender' and name ne 'style' and name ne 'like_count' and
                                          name ne 'order_code' and name ne 'type' and name ne 'status' and
                                          name ne 'is_del' and name ne 'is_private'}">
                            <option class="column-name" value="${name}">${name}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <input type="text" class="form-control" placeholder="검색어 입력" id="board_word_review">
                <button class="btn btn-outline-secondary btn-sm" type="button" id="board_search_btn_review">검색</button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-striped" id="board_table_review">
                <thead class="table-light">
                <tr>
                    <c:forEach var="name" items="${boardName}">
                        <c:if test="${name ne 'id' and name ne 'cus_no' and name ne 'season' and
                                              name ne 'prod_no' and name ne 'snapshot_image' and name ne 'additional_images' and
                                              name ne 'tags' and name ne 'gender' and name ne 'style' and name ne 'like_count' and
                                              name ne 'order_code' and name ne 'type' and name ne 'status' and
                                              name ne 'is_del' and name ne 'is_private'}">
                            <th class="column-name">${name}</th>
                        </c:if>
                    </c:forEach>
                    <th>액션</th>
                </tr>
                </thead>
                <tbody id="reviewBody">
                <c:forEach var="bl" items="${boardList}">
                    <c:if test="${bl.bname eq 'review'}">
                        <tr id="row-${bl.id}">
                            <td>${bl.bname}</td>
                            <td>${bl.title}</td>
                            <td>${bl.content}</td>
                            <td>${bl.score}</td>
                            <td>${bl.write_date}</td>
                            <td>
                                <button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#deleteBoardModal"
                                        onclick="setBoardInfo('${bl.id}', '${bl.cus_no}')">삭제</button>
                                <button class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#seeBoardModal"
                                        onclick="setBoardId('${bl.id}')">자세히</button>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <button class="btn btn-outline-secondary btn-sm mt-3" onclick="location.href='Controller?type=boardmain'">초기화</button>
    </section>
</div>

<!-- 모달 영역 (게시판 삭제, 상세보기, 추가 등 기존 구조 그대로 유지) -->
<!-- 게시판 삭제 모달 -->
<div class="modal fade" id="deleteBoardModal" tabindex="-1" aria-labelledby="deleteBoardModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteBoardModalLabel">게시판 사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
            </div>
            <form id="deleteBoardForm">
                <div class="modal-body">
                    <input type="hidden" id="deleteBoardId" name="id">
                    <input type="hidden" id="deleteBoardCusNo" name="cus_no">
                    <textarea class="form-control" id="deleteReason" name="content" rows="3">보드를 삭제할 이유를 적어주세요.</textarea>
                    <small class="text-danger">*특수문자 사용 시 전송 오류 발생 가능</small>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 게시판 상세보기 (사진 갤러리) 모달 -->
<div class="modal fade" id="seeBoardModal" tabindex="-1" aria-labelledby="seeBoardModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="seeBoardModalLabel">사진 갤러리</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
            </div>
            <div class="modal-body">
                <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${boardOne.snapshot_image}" class="d-block w-100" alt="메인이미지">
                        </div>
                        <c:forEach var="image" items="${fn:split(boardOne.additional_images, ',')}">
                            <div class="carousel-item">
                                <img src="${image}" class="d-block w-100" alt="서브이미지">
                            </div>
                        </c:forEach>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">이전</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">다음</span>
                    </button>
                </div>
                <div class="mt-3">
                    <h5>내용</h5>
                    <p>${boardOne.content}</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 게시판 추가 (쿠폰 설정) 모달 -->
<div class="modal fade" id="boardModal" tabindex="-1" aria-labelledby="boardModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="boardModalLabel">쿠폰 설정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
            </div>
            <form id="addBoardForm" action="Controller" method="POST">
                <input type="hidden" id="addBoardId" name="boardid">
                <div class="modal-body">
                    <div class="row mb-3">
                        <div class="col-md-2 fw-bold">게시판 번호</div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="rootNo" name="rootNo" placeholder="관리자번호">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-2 fw-bold">카테고리 번호</div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="categoryNo" name="categoryNo" placeholder="카테고리번호">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-2 fw-bold">판매자 번호</div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="sellerNo" name="sellerNo" value="1">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-2 fw-bold">등급 번호</div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="gradeNo" name="gradeNo" value="1">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-2 fw-bold">종류</div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="type" name="type" value="1">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-2 fw-bold">이름</div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="name" name="name" value="1">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-2 fw-bold">할인율</div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="salePer" name="salePer" value="1">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-2 fw-bold">시작일자</div>
                        <div class="col-md-6">
                            <input type="date" class="form-control" id="startDate" name="startDate">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-2 fw-bold">끝일자</div>
                        <div class="col-md-6">
                            <input type="date" class="form-control" id="endDate" name="endDate">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="submit" class="btn btn-primary">저장</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 스크립트 영역 (AJAX 및 기타 로직 – 기존 코드 그대로) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" crossorigin="anonymous"></script>
<script>
  // 부드러운 스크롤: 사이드바 링크 클릭 시 해당 섹션으로 이동
  document.querySelectorAll('.sidebar .nav-link').forEach(link => {
    link.addEventListener('click', function(e) {
      e.preventDefault();
      const targetId = this.getAttribute('href');
      const targetElem = document.querySelector(targetId);
      if (targetElem) {
        window.scrollTo({
          top: targetElem.offsetTop - 70, // 헤더 높이 고려
          behavior: 'smooth'
        });
      }
    });
  });

  // 대분류 검색 AJAX
  $(function () {
    $("#major_search_btn").click(function () {
      var category_name = $("#major_category_name").val();
      var word = $("#major_word").val();
      alert(category_name + "/" + word);
      var param = "type=searchMajorCategory&searchType=" + encodeURIComponent(category_name) +
          "&searchValue=" + encodeURIComponent(word);
      $.ajax({
        url: "Controller",
        type: "POST",
        data: param,
      }).done(function (data) {
        console.log(data);
        $("#categoryBody").html(data);
      });
    });

    // 중분류 검색 AJAX
    $("#middle_search_btn").click(function () {
      var category_name = $("#middle_category_name").val();
      var word = $("#middle_word").val();
      alert(category_name + "/" + word);
      var param = "type=searchMiddleCategory&searchType=" + encodeURIComponent(category_name) +
          "&searchValue=" + encodeURIComponent(word);
      $.ajax({
        url: "Controller",
        type: "POST",
        data: param,
      }).done(function (data) {
        $("#middle_category_table tbody").html(data);
      });
    });
  });

  // 컬럼명 한글 변환
  const columnTranslations = {
    'id': '아이디',
    'name': '이름',
    'ename': '영문 이름',
    'type': '타입',
    'major_no': '대분류 번호'
  };
  document.addEventListener('DOMContentLoaded', function() {
    const columnElements = document.querySelectorAll('.column-name');
    columnElements.forEach(element => {
      const columnName = element.innerText.trim();
      if (columnTranslations[columnName]) {
        element.innerText = columnTranslations[columnName];
      }
    });
  });

  // 대분류 추가 모달 - 저장 버튼 (폼 제출 전 간단 검증)
  $("#saveButton").click(function () {
    var name = $("#categoryName").val().trim();
    var ename = $("#categoryEname").val().trim();
    if (!name || !ename) {
      alert("모든 항목을 입력해주세요!");
      return;
    }
    $("#mainCategoryModal").modal("hide");
  });

  // 대분류 추가 AJAX
  $(document).ready(function () {
    $("#addCategoryForm").submit(function (event) {
      event.preventDefault();
      $.ajax({
        type: "POST",
        url: "Controller?type=addMajorCategory",
        data: $(this).serialize(),
        dataType: "json",
        success: function (response) {
          if (response.success) {
            var name = $("input[name='name']").val();
            var ename = $("input[name='ename']").val();
            var majorId = response.result;
            var newRow = '<tr id="row-' + majorId + '">' +
                '<td>' + name + '</td>' +
                '<td>' + ename + '</td>' +
                '<td></td>' +
                '<td>' +
                '<button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#deleteMajorModal" onclick="setMajorId(' + majorId + ')">삭제</button>' +
                '</td>' +
                '</tr>';
            $("#row-" + majorId).remove();
            $("#categoryBody").append(newRow);
            $("input[name='name']").val('');
            $("input[name='ename']").val('');
          } else {
            alert("카테고리 추가 실패!");
          }
        },
        error: function () {
          alert("서버 오류 발생!");
        }
      });
    });
  });

  // 대분류 삭제를 위한 ID 설정 함수
  function setMajorId(majorId) {
    console.log("전달된 대분류 ID:", majorId);
    $("#deleteMajorId").val(majorId);
  }

  // 중분류 삭제 버튼 클릭 이벤트
  $(document).on("click", ".delete-middle-btn", function () {
    var middleId = $(this).data("middle-id");
    console.log("전달된 중분류 ID:", middleId);
    $("#deleteMiddleId").val(middleId);
  });

  // 대분류 삭제 AJAX
  $(document).ready(function () {
    $("#deleteMajorForm").submit(function (event) {
      event.preventDefault();
      var majorId = $("#deleteMajorId").val();
      var content = $("#deleteMajorReason").val();
      if (!majorId) {
        alert("삭제할 대분류 ID가 없습니다.");
        return;
      }
      $.ajax({
        url: "Controller",
        type: "POST",
        data: {
          type: "buttonCategory",
          id: majorId,
          content: content,
          action: "major"
        },
        dataType: "json",
        success: function (response) {
          if (response.status === "success") {
            console.log("삭제 성공:", response);
            $("#row-" + majorId).remove();
            $("#deleteMajorModal").modal("hide");
            alert("대분류가 삭제되었습니다.");
          } else {
            console.error("삭제 실패:", response.message);
            alert("대분류 삭제에 실패했습니다: " + response.message);
          }
        },
        error: function (xhr, status, error) {
          console.error("삭제 실패:", error);
          alert("대분류 삭제 중 오류가 발생했습니다.");
        }
      });
    });
  });

  // 중분류 삭제 AJAX
  $(document).ready(function () {
    $("#deleteMiddleForm").submit(function (event) {
      event.preventDefault();
      var middleId = $("#deleteMiddleId").val();
      var content = $("#deleteMiddleReason").val();
      if (!middleId) {
        alert("삭제할 중분류 ID가 없습니다.");
        return;
      }
      $.ajax({
        url: "Controller",
        type: "POST",
        data: {
          type: "buttonCategory",
          id: middleId,
          content: content,
          action: "middle"
        },
        dataType: "json",
        success: function (response) {
          if (response.status === "success") {
            console.log("삭제 성공:", response);
            $("#row-" + middleId).remove();
            $("#deleteMiddleModal").modal("hide");
            alert("중분류가 삭제되었습니다.");
          } else {
            console.error("삭제 실패:", response.message);
            alert("중분류 삭제에 실패했습니다: " + response.message);
          }
        },
        error: function (xhr, status, error) {
          console.error("삭제 실패:", error);
          alert("중분류 삭제 중 오류가 발생했습니다.");
        }
      });
    });
  });

  // 중분류 추가 모달 - 저장 버튼 검증 후 모달 닫기
  $("#middlesaveBtn").click(function(){
    var majorCategoryId = $("#majorCategoryId").val().trim();
    var middleCategoryName = $("#middleCategoryName").val().trim();
    var middleCategoryType = $("#middleCategoryType").val().trim();
    if (!majorCategoryId || !middleCategoryName || !middleCategoryType) {
      alert("모든 항목을 입력해주세요!");
      return;
    }
    $("#middleCategoryModal").modal("hide");
  });

  // 중분류 추가 AJAX
  $(document).ready(function () {
    $("#addMiddleCategoryForm").submit(function (event) {
      event.preventDefault();
      var majorCategoryId = $("#majorCategoryId").val();
      var middleCategoryName = $("#middleCategoryName").val().trim();
      var middleCategoryType = $("#middleCategoryType").val().trim();
      var categoryMap = {
        "1": "상의",
        "2": "하의",
        "3": "아우터",
        "4": "신발"
      };
      var majorCategoryText = categoryMap[majorCategoryId];
      $.ajax({
        type: "POST",
        url: "Controller?type=addMiddleCategory",
        data: {
          majorCategoryId: majorCategoryId,
          middleCategoryName: middleCategoryName,
          middleCategoryType: middleCategoryType
        },
        dataType: "json",
        success: function(response){
          if(response.success) {
            var middleId = response.id;
            if (!middleId) {
              alert("서버에서 응답이 없습니다.");
              return;
            }
            var newRow = '<tr id="row-' + middleId + '">' +
                '<td>' + majorCategoryText + '</td>' +
                '<td>' + middleCategoryName + '</td>' +
                '<td>' + middleCategoryType + '</td>' +
                '<td>' +
                '<button class="btn btn-secondary btn-sm delete-middle-btn" data-bs-toggle="modal" data-bs-target="#deleteMiddleModal" data-middle-id="' + middleId + '">삭제</button>' +
                '</td>' +
                '</tr>';
            $("#row-" + middleId).remove();
            $("#middleCategoryBody").append(newRow);
            $("#majorCategoryId").val('');
            $("#middleCategoryName").val('');
            $("#middleCategoryType").val('');
          } else {
            alert("카테고리 추가 실패!");
          }
        },
        error: function() {
          alert("서버 오류 발생!");
        }
      });
    });
  });

  // 게시판 상세보기 (사진 갤러리) AJAX
  function setBoardId(boardId) {
    fetch(`/board/details/${boardId}`)
        .then(response => response.json())
        .then(data => {
          const snapshotImageElement = document.querySelector("#carouselExample .carousel-item.active img");
          snapshotImageElement.src = data.snapshot_image;
          const carouselInner = document.querySelector("#carouselExample .carousel-inner");
          carouselInner.innerHTML = '';
          carouselInner.innerHTML += `
                    <div class="carousel-item active">
                      <img src="${data.snapshot_image}" class="d-block w-100" alt="메인이미지">
                    </div>
                  `;
          data.additional_images.split(',').forEach(image => {
            carouselInner.innerHTML += `
                      <div class="carousel-item">
                        <img src="${image}" class="d-block w-100" alt="서브이미지">
                      </div>
                    `;
          });
          document.querySelector("#seeBoardModal .modal-body .mt-3 p").innerText = data.content;
        })
        .catch(error => console.error("Error fetching board details:", error));
  }

  // 게시판 삭제 모달 정보 설정
  function setBoardInfo(boardId, cusNo) {
    console.log("전달된 게시판 ID:", boardId);
    console.log("전달된 고객 번호:", cusNo);
    $("#deleteBoardId").val(boardId);
    $("#deleteBoardCusNo").val(cusNo);
  }
</script>
</body>
</html>
