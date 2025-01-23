//delivery 관련 js

// 배송지 모달 > 요청 사항 필드 추가
function addInput() {
    let selectValue = document.getElementById("request-select").value;
    let customInput = document.getElementById("custom-input");

    if (selectValue == "직접 입력") {
        customInput.style.display = "block";
    } else {
        customInput.style.display = "none";
    }
}

// 수정 모달 열기
function handleDeliInfo(obj) {
    // 기존 데이터를 입력란에 채우기
    $("#name").val($(obj).closest(".address-details").find(".name").text());
    $("#phone").val($(obj).closest(".address-details").find(".phone").text());
    $("#pos_code").val($(obj).closest(".address-details").find(".pos_code").text());
    $("#addr1").val($(obj).closest(".address-details").find(".addr1").text());
    $("#addr2").val($(obj).closest(".address-details").find(".addr2").text());
    const request = $(obj).closest(".address-details").find(".request").text();
    $("#deli_request").val(request);
    let is_default = $(obj).closest(".address-details").find(".default").length > 0;

    // 요청 사항 select 박스와 직접 입력 동기화
    if (["문 앞에 놔주세요", "경비실에 맡겨주세요", "택배함에 넣어주세요", "배송 전에 연락주세요"].includes(request)) {
        $("#request-select").val(request);
        $("#custom-input").hide();
    } else {
        $("#request-select").val("직접 입력");
        $("#custom-input").show();
        $("#deli_request").val(request);
    }

    // 기본 배송지 설정 체크박스
    $("#chkDefault").prop("checked", is_default);

    // 모달 열기
    $("#addrModal").modal("show");

    $("#addrModal").find("#addr_id").val($(obj).closest(".address-box").data("value"));
}

// 추가 및 수정
function onSendDeliveryInfo() {
    const deli_request = $("#deli_request").val() || ($("#request-select option:selected").text() !== ":: 배송 요청사항을 선택하세요 ::" ? $("#request-select option:selected").text() : "");

    let action = "add";
    if ($("#addrModal").find("#addr_id").val()) {
        action = "edit";
    }

    const formData = {
        id: $("#addr_id").val(), // 배송지 ID (수정 시 필요)
        name: $("#name").val(),
        phone: $("#phone").val(),
        pos_code: $("#pos_code").val(),
        addr1: $("#addr1").val(),
        addr2: $("#addr2").val(),
        deli_request: deli_request,
        chkDefault: $("#chkDefault").is(":checked") ? "1" : "0"
    };

    // 유효성 검사
    if (!formData.name || !formData.phone || !formData.pos_code || !formData.addr1 || !formData.addr2) {
        alert("필수 정보를 모두 입력해주세요.");
        return;
    }

    // Ajax 요청
    $.ajax({
        url: action === "add" ? "Controller?type=addDelivery" : "Controller?type=editDelivery",
        method: "POST",
        data: formData,
        success: function (response) {
            $("#addrModal").modal("hide"); // 모달 닫기

            $("#addrModal").find(".btn.btn-outline-secondary").click();

            alert(action === "add" ? "배송지 정보가 추가되었습니다." : "배송지 정보가 수정되었습니다.");
            $(".delivery-section-container").html(response); // 새로고침 없이 내용 갱신
        },
        error: function () {
            alert(action === "add" ? "배송지 추가 중 오류가 발생했습니다." : "배송지 수정 중 오류가 발생했습니다. 다시 시도해주세요.");
        }
    });
}

//모달 닫기
function closemodal() {
    $("#addrModal").modal("hide"); // 모달 닫기

    $("#addrModal").find(".closemodal").click();
}

function deleteDeliInfo(id) {
    if (!confirm("정말 삭제하시겠습니까?"))
        return;

    $.ajax({
        url: "Controller?type=deleteDelivery",
        method: "POST",
        data: { id },
        success: function (response) {
            alert("배송지가 삭제되었습니다.");
            $(".delivery-section-container").html(response); // 새로고침 없이 내용 갱신
        },
        error: function () {
            alert("삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
        }
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
