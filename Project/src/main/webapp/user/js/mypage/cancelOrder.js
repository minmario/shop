$(document).ready(function () {
    // 전체 선택 체크박스 이벤트
    $('#select-all').on('change', function () {
        const isChecked = $(this).is(':checked');
        $('.product-item input[type="checkbox"]').prop('checked', isChecked);

        // 상품 결제 금액, 환불 금액 갱신
        updateCancelInfo();
    });

    // 개별 상품 체크박스 이벤트
    $('.product-item input[type="checkbox"]').on('change', function () {
        // 모든 상품 체크박스가 선택되었는지 확인
        const allChecked = $('.product-item input[type="checkbox"]').length === $('.product-item input[type="checkbox"]:checked').length;
        $('#select-all').prop('checked', allChecked);

        // 상품 결제 금액, 환불 금액 갱신
        updateCancelInfo();
    });

    function updateCancelInfo() {
        let totalAmount = 0;
        let pointUsed = parseInt($('#cancel-point-used').val(), 10);
        if (isNaN(pointUsed)) pointUsed = 0;

        // 체크된 상품의 가격을 합산
        $('.product-item input[type="checkbox"]:checked').each(function () {
            const productItem = $(this).closest('.product-item');
            const priceText = productItem.find('.product-price').text().replace(/[^0-9]/g, '');
            const price = parseInt(priceText, 10) || 0;

            totalAmount += price;
        });

        // 적립금 사용액을 표시
        $('.cancel-refund-info li:nth-child(2) span:nth-child(2)').text(formatCurrency(pointUsed) + '원');

        // 환불 예정 금액 (상품 총 결제 금액에서 사용된 포인트 차감)
        const finalRefundAmount = Math.max(totalAmount - pointUsed, 0);

        // 각 금액을 표시 (숫자 3자리마다 쉼표 추가)
        $('.cancel-refund-info li:nth-child(1) span:nth-child(2)').text(formatCurrency(totalAmount) + '원');
        $('.cancel-refund-info li:nth-child(4) span:nth-child(2)').text(formatCurrency(finalRefundAmount) + '원');
    }

    // 숫자를 3자리마다 쉼표로 포맷하는 함수
    function formatCurrency(number) {
        return number.toLocaleString('ko-KR');
    }
});

$(document).ready(function () {
    // 라디오 버튼 선택 시 이벤트 처리
    $('input[name="cancelReason"]').on('change', function () {
        const selectedValue = $(this).val();

        if (selectedValue === "reason4") {
            $('#custom-reason-input').show();  // 기타 선택 시 입력 필드 표시
        } else {
            $('#custom-reason-input').hide();  // 다른 사유 선택 시 입력 필드 숨김
        }
    });
});

function getSelectedCancelReason() {
    // 선택된 라디오 버튼 가져오기
    const selectedRadio = document.querySelector('input[name="cancelReason"]:checked');

    if (!selectedRadio) {
        alert("취소 사유를 선택해 주세요.");
        return null;
    }

    // 선택된 라디오 버튼의 label 값 가져오기
    const reasonLabel = document.querySelector(`label[for="${selectedRadio.id}"]`).textContent.trim();

    return reasonLabel;
}

function cancelRequest() {
    // 선택된 상품의 prod_no 목록 가져오기
    let selectedProducts = [];
    $('.product-item input[type="checkbox"]:checked').each(function () {
        selectedProducts.push($(this).closest('.product-item').find('input[name="prod_no"]').val());
    });

    if (selectedProducts.length === 0) {
        alert("취소할 상품을 선택해 주세요.");
        return;
    }

    // ordercode 값을 가져오기
    const orderCode = $('#orderCode').val();

    // 취소 사유 가져오기
    let reason = getSelectedCancelReason();
    if (!reason) {
        return;  // 취소 사유가 선택되지 않았으면 함수 종료
    }

    // '기타' 사유일 경우 추가 입력값 가져오기
    if (reason === '기타') {
        const customReason = $('input[name="customCancelReason"]').val();
        if (!customReason) {
            alert("기타 사유를 입력해 주세요.");
            return;
        }
        reason = customReason;
    }

    // 취소 요청 확인 경고창
    if (!confirm("주문을 취소하시겠습니까?")) {
        return;  // 사용자가 취소를 누르면 함수 종료
    }

    // 계좌 정보는 주문 상태가 '0'이 아닌 경우에만 가져오기
    let bank = '';
    let accountNumber = '';
    if ($('#cancel-bank-select').length > 0 && $('#account-number').length > 0) {
        bank = $('#cancel-bank-select').find('option:selected').val();
        accountNumber = $('#account-number').val();

        if (!bank || !accountNumber) {
            alert("환불 계좌 정보를 입력해 주세요.");
            return;
        }
    }

    // 환불 예정 금액 가져오기
    const refundAmount = $('.cancel-refund-info .cancel-refund-amount').text().replace(/[^0-9]/g, '');

    // AJAX 요청
    $.ajax({
        url: 'Controller?type=cancelOrder&action=update',
        type: 'POST',
        data: {
            prod_no_list: selectedProducts,
            reason: reason,
            bank: bank,
            account_number: accountNumber,
            orderCode: orderCode,
            refund_amount: refundAmount
        },
        success: function (response) {
            if (response && response.success) {
                alert("주문 취소가 완료되었습니다.");
                window.location.href = "Controller?type=myPage";
            } else {
                alert(response.message || "주문 취소 중 오류가 발생했습니다.");
            }
        },
        error: function () {
            alert("서버와의 통신 중 오류가 발생했습니다.");
        }
    });
}