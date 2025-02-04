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
            });// 선택한 별점 값을 숨겨진 input에 저장
            document.getElementById('rating-value').value = value;
        });
    });

    // 글자수 카운트 이벤트
    document.getElementById('review-comment').addEventListener('input', function () {
        document.querySelector('.text-count').textContent = `${this.value.length}/500`;
    });

    // 리뷰 등록 버튼 클릭 이벤트
    document.querySelector('.action-buttons button').addEventListener('click', function () {
        insertReview();
    });
});

function insertReview() {
    // 별점 값 가져오기
    const rating = document.getElementById('rating-value').value;
    if (!rating) {
        alert("별점을 선택해 주세요.");
        return;
    }

    // 리뷰 내용 가져오기
    const comment = document.getElementById('review-comment').value;
    if (!comment || comment.length < 10) {
        alert("리뷰 내용을 최소 10자 이상 작성해 주세요.");
        return;
    }

    // 사진 첨부 확인 (예시로 사진 업로드가 없을 경우 기본값 처리)
    const photo = document.querySelector('.photo-box').dataset.photoUrl || '';

    // 성별 정보 가져오기
    const genderElement = document.querySelector('input[name="options"]:checked');
    const gender = genderElement ? genderElement.closest('label').textContent.trim() : '';

    // 키와 몸무게 정보 가져오기
    const height = document.querySelector('input[placeholder="키를 입력해주세요"]').value;
    const weight = document.querySelector('input[placeholder="몸무게를 입력해주세요"]').value;

    if (!height || !weight) {
        alert("키와 몸무게 정보를 입력해 주세요.");
        return;
    }

    // 리뷰 등록 확인 경고창
    if (!confirm("리뷰를 등록하시겠습니까?")) {
        return;
    }

    // AJAX 요청
    $.ajax({
        url: 'Controller?type=writeReview&action=insert',
        type: 'POST',
        data: {
            rating: rating,
            comment: comment,
            photo: photo,
            gender: gender,
            height: height,
            weight: weight
        },
        success: function (response) {
            if (response && response.success) {
                alert("리뷰가 성공적으로 등록되었습니다.");
                window.location.href = "Controller?type=myPage";
            } else {
                alert(response.message || "리뷰 등록 중 오류가 발생했습니다.");
            }
        },
        error: function () {
            alert("서버와의 통신 중 오류가 발생했습니다.");
        }
    });
}