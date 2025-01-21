<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/retiredNotice.css"/>
</head>
<body>
    <!-- header -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <div class="wrap">
        <div class="row">
            <div class="container">
                <div class="retired-header">
                    <h2>회원 탈퇴</h2>
                </div>
                <div class="retired-content">
                    <div class="form-group">
                      <label for="password-input" class="form-label">비밀번호를 입력해 주세요</label>
                      <input type="password" id="password-input" class="form-control" placeholder="비밀번호 입력">
                    </div>
                    <div class="notice-section">
                        <h4 class="notice-title">탈퇴 시 유의 사항</h4>
                        <ul class="notice-list">
                            <li>
                                <strong>아이디 재사용 및 복구 불가</strong>
                                <p>사용하고 계신 아이디를 탈퇴하시면 본인과 타인 모두 해당 아이디 재사용 및 복구가 불가합니다.</p>
                            </li>
                            <li>
                                <strong>회원정보/서비스 이용기록 삭제</strong>
                                <p>회원정보, 적립금, 관심 브랜드, 쪽지, 친구 등의 데이터가 영구히 삭제되며 복구가 불가합니다. 다만, 모든 주문의 주문 정보는 5년간 별도 보관합니다.</p>
                            </li>
                            <li>
                                <strong>연동 아이디 이용 불가</strong>
                                <p>탈퇴 시 무신사 페이 탈퇴, 솔드아웃 앱에서 "무신사 아이디로 로그인" 이용이 불가합니다.</p>
                            </li>
                            <li>
                                <strong>회원 탈퇴 후 재가입</strong>
                                <p>탈퇴 시 무신사 페이 탈퇴, 솔드아웃 앱에서 "무신사 아이디로 로그인" 이용이 불가합니다.</p>
                            </li>
                            <li>
                                <strong>등록 게시물 유지</strong>
                                <p>각종 게시판의 게시글, 댓글, 후기 등의 데이터는 삭제되지 않습니다. 삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 직접 삭제하시기 바랍니다. 이미 적립금 지급이 완료된 후기는 삭제가 불가합니다.</p>
                            </li>
                        </ul>
                    </div>
                    <div class="button-group">
                        <button type="button" class="btn btn-outline-dark" onclick="location.href='Controller?type='">내 게시글 확인</button>
                        <button type="button" class="btn btn-outline-dark" onclick="location.href='Controller?type='">내 후기 확인</button>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="agreement-checkbox">
                        <label class="form-check-label" for="agreement-checkbox">유의사항을 모두 확인하였으며, 이에 동의합니다.</label>
                    </div>
                    <div class="form-actions">
                      <button type="button" class="btn btn-light" data-toggle="modal" data-target="#retiredModal">다음</button>
                      <button type="button" class="btn btn-dark" onclick="location.href='Controller?type=myPage'">탈퇴 그만두기</button>
                    </div>
              </div>
            </div>
        </div>

        <%-- footer --%>
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>

    <%-- 회원 탈퇴 모달 --%>
    <div class="modal fade" id="retiredModal" tabindex="-1" role="dialog" aria-labelledby="retiredModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <h5 class="modal-title">정말 탈퇴 신청을 진행하시겠어요?</h5>
                    <p class="modal-description">
                        탈퇴 후 계정 정보가 영구히 삭제되며 복구가 불가합니다. 탈퇴 신청을 진행하시겠어요?
                    </p>
                    <div class="modal-actions d-flex justify-content-between">
                        <button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-dark" onclick="location.href='Controller'">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="./user/js/mypage/retiredNotice.js"></script>
</body>
</html>
