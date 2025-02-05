document.addEventListener('DOMContentLoaded', function () {
    const stars = document.querySelectorAll('.rating-stars .star');

    // 별점 클릭 이벤트 처리
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

            // 선택한 별점 값을 숨겨진 input에 저장
            document.getElementById('rating-value').value = value;

            // 별점 값 콘솔에 출력
            console.log("선택된 별점:", value);
        });
    });

    // 글자수 카운트 이벤트
    document.getElementById('review-comment').addEventListener('input', function () {
        document.querySelector('.text-count').textContent = `${this.value.length}/500`;
        console.log("리뷰 입력 중... 현재 글자수:", this.value.length);
    });

    // 리뷰 등록 버튼 클릭 이벤트
    document.querySelector('.action-buttons button').addEventListener('click', function () {
        insertReview();
    });
});

function insertReview() {
    // 별점 값 가져오기
    const rating = document.getElementById('rating-value').value;
    console.log("별점 값:", rating);
    if (!rating) {
        alert("별점을 선택해 주세요.");
        return;
    }

    // 리뷰 내용 가져오기
    const comment = document.getElementById('review-comment').value;
    console.log("리뷰 내용:", comment);
    if (!comment || comment.length < 10) {
        alert("리뷰 내용을 최소 10자 이상 작성해 주세요.");
        return;
    }

    // 사진 첨부 확인
    const photo = document.querySelector('.photo-box').dataset.photoUrl || '';
    console.log("첨부된 사진 URL:", photo);

    // 성별 정보 가져오기
    const genderElement = document.querySelector('input[name="options"]:checked');
    const gender = genderElement ? genderElement.value : '';
    console.log("선택된 성별 값:", gender);

    if (!gender) {
        alert("성별을 선택해 주세요.");
        return;
    }

    // 키와 몸무게 정보 가져오기
    const height = document.getElementById('height').value;
    const weight = document.getElementById('weight').value;
    const isUpdateChecked = document.getElementById('update-body-info').checked;

    console.log("입력된 키:", height);
    console.log("입력된 몸무게:", weight);

    if (!height || !weight) {
        alert("키와 몸무게 정보를 입력해 주세요.");
        return;
    }

    // 리뷰 등록 확인 경고창
    if (!confirm("리뷰를 등록하시겠습니까?")) {
        return;
    }

    // AJAX 요청
    console.log("리뷰 등록 요청 전송...");
    $.ajax({
        url: 'Controller?type=writeReview&action=insert',
        type: 'POST',
        data: {
            rating: rating,
            comment: comment,
            photo: photo,
            gender: gender,
            height: height,
            weight: weight,
            isUpdateChecked: isUpdateChecked
        },
        success: function (response) {
            console.log("리뷰 등록 성공 응답:", response);
            if (response && response.success) {
                alert("상품리뷰가 등록되었습니다.");
                window.location.href = "Controller?type=myPage";
            } else {
                alert(response.message || "리뷰 등록 중 오류가 발생했습니다.");
            }
        },
        error: function () {
            console.error("리뷰 등록 중 서버와의 통신 오류 발생.");
            alert("서버와의 통신 중 오류가 발생했습니다.");
        }
    });
}

// 사진 추가 기능
function triggerFileInput() {
    document.getElementById('photo-input').click();
}

document.getElementById('photo-input').addEventListener('change', function (event) {
    const file = event.target.files[0];

    if (file) {
        const reader = new FileReader();

        reader.onload = function (e) {
            // 이미지 미리보기 추가
            const photoBox = document.querySelector('.photo-box');
            photoBox.innerHTML = `<img src="${e.target.result}" alt="첨부된 사진" class="preview-img">`;
        };

        reader.readAsDataURL(file);
    }
});
