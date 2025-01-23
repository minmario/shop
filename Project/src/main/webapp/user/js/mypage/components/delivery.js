// 배송지 모달 > 요청 사항 필드 추가
function addInput() {
    let selectValue = document.getElementById("request-select").value;
    let customInput = document.getElementById("custom-input");

    customInput.style.display = selectValue === "직접 입력" ? "block" : "none";
}

// 추가 모달 열기
function insertDeliveryModal() {
    $("#addrModalTitle").text("배송지 추가");
    $(".btn-delivery-event").text("추가");

    // 입력란 비우기
    $("#addrModal #name").val("");
    $("#addrModal #phone").val("");
    $("#addrModal #pos_code").val("");
    $("#addrModal #addr1").val("");
    $("#addrModal #addr2").val("");
    $("#addrModal #request-select").val("0");
    $("#addrModal #chkDefault").prop("checked", false);
    $("#addrModal #addr_id").val("");
}

// 수정 모달 열기
function updateDeliveryModal(obj) {
    $("#addrModalTitle").text("배송지 수정");
    $(".btn-delivery-event").text("수정");

    // 기존 데이터를 입력란에 채우기
    $("#addrModal #name").val($(obj).closest(".address-details").find(".name").text());
    $("#addrModal #phone").val($(obj).closest(".address-details").find(".phone").text());
    $("#addrModal #pos_code").val($(obj).closest(".address-details").find(".pos_code").text());
    $("#addrModal #addr1").val($(obj).closest(".address-details").find(".addr1").text());
    $("#addrModal #addr2").val($(obj).closest(".address-details").find(".addr2").text());
    const request = $(obj).closest(".address-details").find(".request").text();
    $("#addrModal #deli_request").val(request);
    let is_default = $(obj).closest(".address-details").find(".default").length > 0;

    // 요청 사항 select 박스와 직접 입력 동기화
    if (["문 앞에 놔주세요", "경비실에 맡겨주세요", "택배함에 넣어주세요", "배송 전에 연락주세요"].includes(request)) {
        $("#addrModal #request-select").val(request);
        $("#addrModal #custom-input").hide();
    } else if (request.length == 0) {
        $("#addrModal #request-select").val("0");
        $("#addrModal #custom-input").hide();
    } else {
        $("#addrModal #request-select").val("직접 입력");
        $("#addrModal #custom-input").show();
        $("#addrModal #deli_request").val(request);
    }

    // 기본 배송지 설정 체크박스
    $("#addrModal #chkDefault").prop("checked", is_default);

    $("#addrModal #addr_id").val($(obj).closest(".address-box").data("value"));
}

// 추가 및 수정
function onSendDeliveryInfo() {
    const regPhone = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
    if(!regPhone.test($("#phone").val())) {
        alert('핸드폰 번호를 확인하세요.');
        $("#phone").val("");
        $("#phone").focus();
        return;
    }

    const formData = {
        id: $("#addrModal #addr_id").val(), // 배송지 ID (수정 시 필요)
        name: $("#addrModal #name").val(),
        phone: $("#addrModal #phone").val(),
        pos_code: $("#addrModal #pos_code").val(),
        addr1: $("#addrModal #addr1").val(),
        addr2: $("#addrModal #addr2").val(),
        deli_request: $("select[name=request-select] option:selected").val() != "0" ? $("select[name=request-select] option:selected").text() : null,
        chkDefault: $("#addrModal #chkDefault").is(":checked") ? "1" : "0"
    };

    // 유효성 검사
    if (!formData.name || !formData.phone || !formData.pos_code || !formData.addr1 || !formData.addr2) {
        alert("필수 정보를 모두 입력해주세요.");
        return;
    }

    let action = "insert";
    if ($("#addrModal").find("#addr_id").val()) {
        action = "update";
    }

    // Ajax 요청
    $.ajax({
        url: action === "insert" ? "Controller?type=delivery&action=insert" : "Controller?type=delivery&action=update",
        method: "POST",
        data: formData,
        success: function (response) {
            // 모달 닫기
            $("#addrModal").find(".btn.btn-outline-secondary").click();
            
            // 메세지
            alert(action === "insert" ? "배송지 정보가 추가되었습니다." : "배송지 정보가 수정되었습니다.");
            
            // 배송지 목록
            selectDelivery();
        },
        error: function () {
            // 모달 닫기
            $("#addrModal").find(".btn.btn-outline-secondary").click();
            
            // 메세지
            alert(action === "insert" ? "배송지 추가 중 오류가 발생했습니다." : "배송지 수정 중 오류가 발생했습니다. 다시 시도해주세요.");
        }
    });
}

// 배송지 삭제
function deleteDelivery(id) {
    if (!confirm("정말 삭제하시겠습니까?"))
        return;

    $.ajax({
        url: "Controller?type=delivery&action=delete",
        method: "POST",
        data: {
            id: id
        },
        success: function (response) {
            alert("배송지가 삭제되었습니다.");

            // 배송지 목록
            selectDelivery();
        },
        error: function () {
            alert("삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
        }
    });
}

// 배송지 조회
function selectDelivery() {
    $.ajax({
        url: "Controller?type=delivery&action=select",
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

// 우편 번호 검색
function getPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            let addr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('pos_code').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}