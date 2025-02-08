// 프로필 변경
function updateProfile() {
    const form = document.getElementById('change-profile-form');
    const formData = new FormData(form);

    // formData에 추가
    formData.append('nickname', document.getElementById('nickname-input').value);

    const photoInput = document.getElementById('profile-input');
    if (photoInput.files.length > 0) {
        formData.append('photo', photoInput.files[0]);
    }

    for (let pair of formData.entries()) {
        console.log(pair[0] + ": " + pair[1]);
    }

    // 입력 데이터 유효성 검사
    if (!formData.get('nickname')) {
        alert("닉네임을 입력해 주세요.");
        return;
    }

    if (!confirm("프로필을 변경하시겠습니까?")) {
        return;
    }

    $.ajax({
        url: 'Controller?type=myPage&action=update_profile',
        type: 'POST',
        data: formData,
        processData: false,  // 데이터 직렬화 금지
        contentType: false,  // 기본적으로 multipart로 설정됨
        success: function (response) {
            console.log("서버 응답:", response);
            if (response.success) {
                alert(response.message);
            } else {
                alert(response.message || "프로필 변경 중 오류가 발생했습니다.");
            }

            window.location.replace("Controller?type=myPage");
        },
        error: function (xhr) {
            console.error("프로필 변경 중 서버 오류 발생:", xhr.responseText);
            alert("서버 오류 발생: " + xhr.responseText);
        }
    });
}

// 사진 변경 기능
function triggerProfileInput() {
    document.getElementById('profile-input').click();
}

document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('profile-input').addEventListener('change', function (event) {
        const file = event.target.files[0];

        if (file) {
            const reader = new FileReader();

            reader.onload = function (e) {
                // 이미지 미리보기 추가
                const photoBox = document.querySelector('.photo-box');
                photoBox.dataset.photoName = file.name;
                photoBox.innerHTML = `<img src="${e.target.result}" alt="첨부된 사진" class="preview-img">`;
            };

            reader.readAsDataURL(file);
        }
    });
});

// 배송지 수정 모달 열기
function updateDeliveryModal(delivery_no) {
    $("#addrModalTitle").text("배송지 수정");
    $(".btn-delivery-event").text("수정");

    $.ajax({
        url: "Controller?type=delivery&action=search",
        method: "POST",
        data: {
            id: delivery_no
        },
        success: function (response) {
            if (response.success) {
                if (response.data) {
                    const item = response.data;

                    $("#addrModal #addr_id").val(item.id);
                    $("#addrModal #name").val(item.name);
                    $("#addrModal #phone").val(item.phone);
                    $("#addrModal #pos_code").val(item.pos_code);
                    $("#addrModal #addr1").val(item.addr1);
                    $("#addrModal #addr2").val(item.addr2);
                    $("#addrModal #deli_request").val(item.request);
                    $("#addrModal #chkDefault").prop("checked", item.is_default === "1" ? true : false);

                    // 요청 사항 select 박스와 직접 입력 동기화
                    if (["문 앞에 놔주세요", "경비실에 맡겨주세요", "택배함에 넣어주세요", "배송 전에 연락주세요"].includes(item.request)) {
                        $("#addrModal #request-select").val(item.request);
                        $("#addrModal #custom-input").hide();
                    } else {
                        $("#addrModal #request-select").val("직접 입력");
                        $("#addrModal #custom-input").show();
                        $("#addrModal #custom-input").val(item.request);
                    }
                }
            } else {
                alert("서버 처리 중 오류가 발생했습니다.");
            }
        }, error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}