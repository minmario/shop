<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>판매자 관리</title>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>

<div class="container-fluid mt-4">
    <!-- 판매자 목록 영역 -->
    <div class="col-9">
        <div class="d-flex justify-content-between align-items-center">
            <h5>판매자 목록</h5>
            <div>
                <button class="btn btn-secondary me-2" data-bs-toggle="modal" data-bs-target="#sellerDenyModal">판매자 거절</button>
                <button class="btn btn-primary add-user-btn" data-bs-toggle="modal" data-bs-target="#sellerModal">판매자 추가</button>
            </div>
        </div>

        <div class="mt-3">
            <div class="input-group">
                <span class="input-group-text">
                    <i class="bi bi-search"></i>
                </span>
                <input type="text" class="form-control" placeholder="전체 판매자 검색">
            </div>
        </div>

        <table class="table mt-3">
            <thead class="table-light">
            <tr>
                <th><input type="checkbox"></th>
                <th>닉네임</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>주소</th>
                <th>삭제여부</th>
                <th>사유</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input type="checkbox"></td>
                <td>사용자1</td>
                <td>마루치</td>
                <td>000-000-0000</td>
                <td>example1@example.com</td>
                <td>경기도</td>
                <td>0</td>
                <td>명품</td>
                <td><button class="btn btn-outline-secondary btn-sm">수정</button>
                    <button class="btn btn-outline-secondary btn-sm">삭제</button></td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>사용자2</td>
                <td>이도</td>
                <td>000-000-0000</td>
                <td>example2@example.com</td>
                <td>경기도</td>
                <td>0</td>
                <td>인기가 많음</td>
                <td><button class="btn btn-outline-secondary btn-sm">수정</button>
                    <button class="btn btn-outline-secondary btn-sm">삭제</button></td>
            </tr>
            </tbody>
        </table>

        <div class="mt-3 mb-4">
            <button class="btn btn-outline-secondary">초기화</button>
        </div>

        <div class="col-md-12">
            <span class="text-danger">*거절 사유는 테이블에 저장하지 않습니다.</span>
        </div>
    </div>

    <!-- 판매자 거절 모달 -->
    <div class="modal fade" id="sellerDenyModal" tabindex="-1" aria-labelledby="sellerDenyModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="sellerDenyModalLabel">판매자 거절 사유</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <textarea class="form-control" rows="3">입점을 추가한 이유를 적어주세요.</textarea>
                            <span class="text-danger">*특수문자사용시 스마트스토어 정책에 따라 전송 에러가 발생합니다. 텍스트와 숫자로 안내문구를 작성해주시기 바랍니다.</span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary">저장</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 판매자 추가 모달 -->
    <div class="modal fade" id="sellerModal" tabindex="-1" aria-labelledby="sellerModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="sellerModalLabel">판매자 설정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row mb-3">
                        <div class="col-md-2 fw-bold">판매자 id</div>
                        <div class="col-md-2">
                            <input type="text" class="form-control" value="aaaa">
                        </div>
                        <div class="col-md-1 text-end fw-bold">판매자 pw</div>
                        <div class="col-md-1">
                            <input type="text" class="form-control" value="1111">
                        </div>
                        <div class="col-md-1 text-end fw-bold">이름</div>
                        <div class="col-md-1">
                            <input type="text" class="form-control" value="마루치">
                        </div>
                    </div>

                    <hr>

                    <div class="row mb-3">
                        <div class="col-md-2 fw-bold">연락처</div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" value="02-1234-5678">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-2 fw-bold">이메일</div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" value="email@example.com">
                        </div>
                    </div>

                    <hr>

                    <h5 class="card-title">승인 사유</h5>
                    <div class="row">
                        <div class="col-md-12">
                            <textarea class="form-control" rows="3">입점을 추가한 이유를 적어주세요.</textarea>
                            <span class="text-danger">*특수문자사용시 스마트스토어 정책에 따라 전송 에러가 발생합니다.</span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary">저장</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 부트스트랩 관련 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
