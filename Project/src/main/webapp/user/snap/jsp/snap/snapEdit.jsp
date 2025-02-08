<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Snap 수정 모달 내부 내용 -->
<div class="modal-header border-0 pb-0">
    <h5 class="modal-title" id="snapEditModalLabel">Snap 수정</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
</div>
<div class="modal-body">
    <form id="snapEditForm" action="${pageContext.request.contextPath}/Controller?type=snapUpdate" method="post">
        <!-- 숨겨진 필드 -->
        <input type="hidden" name="id" value="${board.id}">
        <input type="hidden" name="existingSnapshotImage" value="${board.snapshot_image}">
        <input type="hidden" name="existingAdditionalImages" value="${board.additional_images}">
        <input type="hidden" name="prod_no" value="${board.prod_no}">

        <div class="edit-container row">
            <!-- 왼쪽 영역: 이미지 캐러셀 -->
            <div class="col-md-6 image-section">
                <div id="editCarousel" class="carousel slide border rounded" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${board.snapshot_image}" class="d-block w-100" alt="메인 이미지">
                        </div>
                        <c:if test="${not empty board.additional_images}">
                            <c:forEach var="imgUrl" items="${fn:split(board.additional_images, ',')}">
                                <div class="carousel-item">
                                    <img src="${fn:trim(imgUrl)}" class="d-block w-100" alt="추가 이미지">
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#editCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">이전</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#editCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">다음</span>
                    </button>
                </div>
            </div>
            <!-- 오른쪽 영역: 수정 폼 (스텝 기반) -->
            <div class="col-md-6 info-section">
                <!-- Step 1: 내용과 태그 입력 -->
                <div class="step active" id="step1">
                    <div class="mb-3">
                        <label for="content" class="form-label">내용</label>
                        <textarea id="content" name="content" class="form-control" rows="6" required>${board.content}</textarea>
                    </div>
                    <div class="mb-3">
                        <label for="tags" class="form-label">태그</label>
                        <input type="text" id="tags" name="tags" class="form-control" value="${board.tags}">
                        <small class="text-primary">태그는 콤마로 구분 (예: #태그1, #태그2)</small>
                    </div>
                </div>
                <!-- Step 2: 성별, 계절, 스타일 선택 -->
                <div class="step" id="step2">
                    <!-- 성별 -->
                    <div class="mb-3">
                        <label class="form-label">성별</label>
                        <div class="d-flex gap-3">
                            <button type="button" class="btn btn-outline-primary gender-btn ${board.gender eq '남성' ? 'active' : ''}" data-value="남성">남성</button>
                            <button type="button" class="btn btn-outline-primary gender-btn ${board.gender eq '여성' ? 'active' : ''}" data-value="여성">여성</button>
                        </div>
                        <input type="hidden" name="gender" id="genderInput" value="${board.gender}">
                    </div>
                    <!-- 계절 -->
                    <div class="mb-3">
                        <label class="form-label">계절 (최대 2개)</label>
                        <div class="d-flex flex-wrap gap-2">
                            <button type="button" class="btn btn-outline-success season-btn ${fn:contains(board.season, '봄') ? 'active' : ''}" data-value="봄">봄</button>
                            <button type="button" class="btn btn-outline-success season-btn ${fn:contains(board.season, '여름') ? 'active' : ''}" data-value="여름">여름</button>
                            <button type="button" class="btn btn-outline-success season-btn ${fn:contains(board.season, '가을') ? 'active' : ''}" data-value="가을">가을</button>
                            <button type="button" class="btn btn-outline-success season-btn ${fn:contains(board.season, '겨울') ? 'active' : ''}" data-value="겨울">겨울</button>
                        </div>
                        <input type="hidden" name="season" id="seasonInput" value="${board.season}">
                    </div>
                    <!-- 스타일 -->
                    <div class="mb-3">
                        <label class="form-label">스타일 태그 (최대 2개)</label>
                        <div class="d-flex flex-wrap gap-2">
                            <button type="button" class="btn btn-outline-info style-btn ${fn:contains(board.style, '캐주얼') ? 'active' : ''}" data-value="캐주얼">캐주얼</button>
                            <button type="button" class="btn btn-outline-info style-btn ${fn:contains(board.style, '스트릿') ? 'active' : ''}" data-value="스트릿">스트릿</button>
                            <button type="button" class="btn btn-outline-info style-btn ${fn:contains(board.style, '걸리시') ? 'active' : ''}" data-value="걸리시">걸리시</button>
                            <button type="button" class="btn btn-outline-info style-btn ${fn:contains(board.style, '미니멀') ? 'active' : ''}" data-value="미니멀">미니멀</button>
                            <button type="button" class="btn btn-outline-info style-btn ${fn:contains(board.style, '스포티') ? 'active' : ''}" data-value="스포티">스포티</button>
                            <button type="button" class="btn btn-outline-info style-btn ${fn:contains(board.style, '시크') ? 'active' : ''}" data-value="시크">시크</button>
                            <button type="button" class="btn btn-outline-info style-btn ${fn:contains(board.style, '시티보이') ? 'active' : ''}" data-value="시티보이">시티보이</button>
                            <button type="button" class="btn btn-outline-info style-btn ${fn:contains(board.style, '로맨틱') ? 'active' : ''}" data-value="로맨틱">로맨틱</button>
                            <button type="button" class="btn btn-outline-info style-btn ${fn:contains(board.style, '고프코어') ? 'active' : ''}" data-value="고프코어">고프코어</button>
                            <button type="button" class="btn btn-outline-info style-btn ${fn:contains(board.style, '워크웨어') ? 'active' : ''}" data-value="워크웨어">워크웨어</button>
                            <button type="button" class="btn btn-outline-info style-btn ${fn:contains(board.style, '레트로') ? 'active' : ''}" data-value="레트로">레트로</button>
                            <button type="button" class="btn btn-outline-info style-btn ${fn:contains(board.style, '클래식') ? 'active' : ''}" data-value="클래식">클래식</button>
                        </div>
                        <input type="hidden" name="style" id="styleInput" value="${board.style}">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- Modal Footer -->
<div class="modal-footer border-0 pt-0">
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
    <button type="submit" form="snapEditForm" class="btn btn-primary">수정 완료</button>
</div>

<!-- Bootstrap JS (경로 수정 필요) -->
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', () => {
    // 스텝 전환 처리 (Step 1과 Step 2)
    const steps = document.querySelectorAll('.step');
    let currentStep = 0;
    // 스텝 전환 버튼(예시로 info-section 하단에 추가한 경우, 만약 따로 위치한다면 id로 가져오세요)
    const prevStepBtn = document.getElementById('prevStep');
    const nextStepBtn = document.getElementById('nextStep');

    function updateSteps() {
      steps.forEach((step, index) => {
        step.classList.toggle('active', index === currentStep);
      });
      if(prevStepBtn) prevStepBtn.disabled = currentStep === 0;
      if(nextStepBtn) nextStepBtn.style.display = currentStep === steps.length - 1 ? 'none' : 'inline-block';
    }

    if(prevStepBtn && nextStepBtn) {
      prevStepBtn.addEventListener('click', () => {
        if (currentStep > 0) {
          currentStep--;
          updateSteps();
        }
      });

      nextStepBtn.addEventListener('click', () => {
        if (currentStep < steps.length - 1) {
          currentStep++;
          updateSteps();
        }
      });
    }

    updateSteps();

    // 성별, 계절, 스타일 버튼 처리
    const genderButtons = document.querySelectorAll('.gender-btn');
    const seasonButtons = document.querySelectorAll('.season-btn');
    const styleButtons = document.querySelectorAll('.style-btn');

    const genderInput = document.getElementById('genderInput');
    const seasonInput = document.getElementById('seasonInput');
    const styleInput = document.getElementById('styleInput');

    genderButtons.forEach(button => {
      button.addEventListener('click', () => {
        genderButtons.forEach(btn => btn.classList.remove('active'));
        button.classList.add('active');
        genderInput.value = button.dataset.value;
      });
    });

    seasonButtons.forEach(button => {
      button.addEventListener('click', () => {
        let selectedSeasons = seasonInput.value ? seasonInput.value.split(',') : [];
        if (selectedSeasons.includes(button.dataset.value)) {
          button.classList.remove('active');
          selectedSeasons = selectedSeasons.filter(season => season !== button.dataset.value);
        } else {
          if (selectedSeasons.length < 2) {
            button.classList.add('active');
            selectedSeasons.push(button.dataset.value);
          } else {
            alert('최대 2개의 계절만 선택 가능합니다.');
          }
        }
        seasonInput.value = selectedSeasons.join(',');
      });
    });

    styleButtons.forEach(button => {
      button.addEventListener('click', () => {
        let selectedStyles = styleInput.value ? styleInput.value.split(',') : [];
        if (selectedStyles.includes(button.dataset.value)) {
          button.classList.remove('active');
          selectedStyles = selectedStyles.filter(style => style !== button.dataset.value);
        } else {
          if (selectedStyles.length < 2) {
            button.classList.add('active');
            selectedStyles.push(button.dataset.value);
          } else {
            alert('최대 2개의 스타일 태그만 선택 가능합니다.');
          }
        }
        styleInput.value = selectedStyles.join(',');
      });
    });
  });
</script>
</body>
</html>
