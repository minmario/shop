//delivery 관련 jsp

// 배송지 모달 > 요청 사항 필드 추가
function addInput() {
    let selectValue = document.getElementById("request-select").value;
    let customInput = document.getElementById("custom-input");

    if (selectValue == "5") {
        customInput.style.display = "block";
    } else {
        customInput.style.display = "none";
    }
}

//배송지 추가
function sendDeliInfo() {

    let deli_request = $("#deli_request").val();
    const selectText = $("#request-select option:selected").text();

    // '직접 입력' 필드가 비어 있으면 선택된 옵션의 텍스트를 사용
    if (!deli_request && selectText !== ":: 배송 요청사항을 선택하세요 ::") {
        deli_request = selectText;
    }

    const formData = {
        name: $("#name").val(),
        phone: $("#phone").val(),
        pos_code: $("#pos_code").val(),
        addr1: $("#addr1").val(),
        addr2: $("#addr2").val(),
        deli_request: deli_request,
        chkDefault: $("#chkDefault").is(":checked") ? "1" : "0",
    };


    // 유효성 검사
    if (!formData.name || !formData.phone || !formData.pos_code || !formData.addr1 || !formData.addr2) {
        alert("필수 정보를 모두 입력해주세요.");
        return;
    }

    // // Ajax 요청
    $.ajax({
        url: "Controller?type=addDelivery",
        method: "POST",
        data: formData,
        success: function (response) {
            alert("배송지 정보가 저장되었습니다.");
            $("#addrModal").modal("hide"); // 모달 닫기
            $(".delivery-section").html(response); // 새로고침 없이 내용 갱신
        },
        error: function () {
            alert("배송지 추가 중 오류가 발생했습니다. 다시 시도해주세요.");
        },
    });
}

//배송지 수정
function editDeliInfo(id, name, phone, pos_code, addr1, addr2, request, is_default) {

    let deli_request = $("#deli_request").val();
    const selectText = $("#request-select option:selected").text();

    // '직접 입력' 필드가 비어 있으면 선택된 옵션의 텍스트를 사용
    if (!deli_request && selectText !== ":: 배송 요청사항을 선택하세요 ::") {
        deli_request = selectText;
    }

    const formData = {
        id: id,
        name: $("#name").val(),
        phone: $("#phone").val(),
        pos_code: $("#pos_code").val(),
        addr1: $("#addr1").val(),
        addr2: $("#addr2").val(),
        deli_request: deli_request,
        chkDefault: $("#chkDefault").is(":checked") ? "1" : "0",
    };


    // 유효성 검사
    if (!formData.name || !formData.phone || !formData.pos_code || !formData.addr1 || !formData.addr2) {
        alert("필수 정보를 모두 입력해주세요.");
        return;
    }

    // // Ajax 요청
    $.ajax({
        url: "Controller?type=editDelivery",
        method: "POST",
        data: formData,
        success: function (response) {
            alert("배송지 정보가 저장되었습니다.");
            $("#addrModal").modal("hide"); // 모달 닫기
            $(".delivery-section").html(response); // 새로고침 없이 내용 갱신
        },
        error: function () {
            alert("배송지 수정 중 오류가 발생했습니다. 다시 시도해주세요.");
        },
    });
}

//배송지 조회
function viewDelivery() {
    // AJAX 요청으로 ViewDeliveryAction 호출
    $.ajax({
        url: "Controller?type=viewDelivery",
        type: "POST",
        success: function (response) {
            // 배송지 섹션만 표시하고 다른 섹션은 숨김
            const allSections = [
                "#order-article",
                "#refund-article",
                "#review-article",
                "#inquiry-article",
                "#question-article",
                "#point-article",
                "#coupon-article",
                "#delivery-article"
            ];
            allSections.forEach((section) => {
                if (section === "#delivery-article") {
                    $(section).show();
                } else {
                    $(section).hide();
                }
            });

            // 응답 데이터를 #delivery-article에 렌더링
            $("#delivery-article").html(response);
        },
        error: function (status, error) {
            console.error("배송지 정보를 가져오는 데 실패했습니다.", error);
        }
    });
}
