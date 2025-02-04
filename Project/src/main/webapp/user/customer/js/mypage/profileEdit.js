// 구매자 정보 조회
function selectCustomer() {
    $.ajax({
        url: "Controller?type=profileEdit&action=select",
        method: "POST",
        success: function (response) {
            console.log(response);
            $("#profile-acticle").html(response);
        },
        error: function (err) {
            alert("정보 수정 중 오류가 발생했습니다. 다시 시도해 주세요.");
        }
    });
}

// 구매자 정보 수정
function updateCustomer() {
    const email =  $("#email").val();
    const phone =  $("#phone").val();

    const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
    if(!regEmail.test(email)) {
        alert('이메일을 확인하세요.');
        $("#email").val("");
        $("#email").focus();
        return;
    }

    const regPhone = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
    if(!regPhone.test(phone)) {
        alert('핸드폰 번호를 확인하세요.');
        $("#phone").val("");
        $("#phone").focus();
        return;
    }

    $.ajax({
        url: "Controller?type=profileEdit&action=update",
        method: "POST",
        data: {
            email: email,
            phone: phone
        },
        success: function (response) {
            alert("수정하였습니다.");

            // 모달 닫기
            $(".modal-header .close").click();

            // 회원 정보 조회
            selectCustomer();
        },
        error: function (err) {
            alert("정보 수정 중 오류가 발생했습니다. 다시 시도해 주세요.");
        }
    });
}
