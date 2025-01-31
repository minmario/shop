//반품 사유 필드 추가
function addReasonInput() {
    let selectValue = document.getElementById("select").value;
    let refundInput = document.getElementById("refund-input");

    if (selectValue == "5") {
        refundInput.style.display = "block";
    } else {
        refundInput.style.display = "none";
    }
}

// 배송지 모달 > 요청 사항 필드 추가
function addInputRequest() {
    let selectValue = document.getElementById("request-select").value;
    let customInput = document.getElementById("custom-input");

    if (selectValue == "5") {
        customInput.style.display = "block";
    } else {
        customInput.style.display = "none";
    }
}

$(document).ready(function () {
    // 전체 선택 체크박스 이벤트
    $('#select-refund-all').on('change', function () {
        const isChecked = $(this).is(':checked');
        $('.refund-checkbox').prop('checked', isChecked);

        // 상품 결제 금액, 환불 금액 갱신
        updateRefundInfo();
    });

    // 개별 상품 체크박스 이벤트
    $('.refund-checkbox').on('change', function () {
        // 모든 상품 체크박스가 선택되었는지 확인
        const allChecked = $('.refund-checkbox').length === $('.refund-checkbox:checked').length;
        $('#select-refund-all').prop('checked', allChecked);

        // 상품 결제 금액, 환불 금액 갱신
        updateRefundInfo();
    });

    function updateRefundInfo() {
        let totalAmount = 0;
        let pointUsed = parseInt($('#point-used').val(), 10);
        if (isNaN(pointUsed)) pointUsed = 0;

        // 체크된 상품의 가격을 합산
        $('.refund-checkbox:checked').each(function () {
            const price = parseInt($(this).data('price'), 10) || 0;
            const count = parseInt($(this).data('count'), 10) || 1;

            totalAmount += price * count;
        });

        // 적립금 사용액을 표시
        $('.refund-info .points-used').text(formatCurrency(pointUsed) + '원');

        // 환불 예정 금액 (상품 총 결제 금액에서 사용된 포인트 차감)
        const finalRefundAmount = Math.max(totalAmount - pointUsed, 0);

        // 각 금액을 표시 (숫자 3자리마다 쉼표 추가)
        $('.refund-info .item-price').text(formatCurrency(totalAmount) + '원');
        $('.refund-info .refund-amount').text(formatCurrency(finalRefundAmount) + '원');
    }

    // 숫자를 3자리마다 쉼표로 포맷하는 함수
    function formatCurrency(number) {
        return number.toLocaleString('ko-KR');
    }
});

function refundRequest() {
    // 선택된 상품의 prod_no 목록 가져오기
    let selectedProducts = [];
    $('.refund-checkbox:checked').each(function () {
        selectedProducts.push($(this).closest('.product-content').find('input[name="prod_no"]').val());
    });

    if (selectedProducts.length === 0) {
        alert("반품할 상품을 선택해 주세요.");
        return;
    }

    // 반품 사유 가져오기
    let reason = $('#select').val();
    if (reason === "0") {
        alert("반품 사유를 선택해 주세요.");
        return;
    }
    if (reason === "5") {
        reason = $('input[name="request-reason"]').val();
        if (!reason) {
            alert("반품 사유를 입력해 주세요.");
            return;
        }
    }

    // 회수지 번호 가져오기
    const retrieveDeliElement = document.querySelector('input[name="retrieve_deli_no"]:checked');
    if (!retrieveDeliElement) {
        alert("회수지를 선택해 주세요.");
        return;
    }
    const retrieveDeliNo = retrieveDeliElement.value;

    // 계좌 정보 가져오기
    const bank = $('#bank-select').find('option:selected').text();
    const accountNumber = $('#account-number').val();

    if (!bank || !accountNumber) {
        alert("반품 계좌 정보를 입력해 주세요.");
        return;
    }

    // AJAX 요청
    $.ajax({
        url: 'Controller?type=refundRequest&action=update',
        type: 'POST',
        data: {
            prod_no_list: selectedProducts,
            reason: reason,
            retrieve_deli_no: retrieveDeliNo,
            bank: bank,
            account_number: accountNumber
        },
        success: function (response) {
            if (response && response.success) {
                alert("반품 신청이 완료되었습니다.");
                window.location.href = "Controller?type=mypage";
            } else {
                alert(response.message || "반품 신청 중 오류가 발생했습니다.");
            }
        },
        error: function () {
            alert("서버와의 통신 중 오류가 발생했습니다.");
        }
    });
}