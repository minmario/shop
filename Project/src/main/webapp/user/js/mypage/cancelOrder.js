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
        let pointUsed = parseInt($('#point-used').val(), 10);
        if (isNaN(pointUsed)) pointUsed = 0;

        // 체크된 상품의 가격을 합산
        $('.product-item input[type="checkbox"]:checked').each(function () {
            const productItem = $(this).closest('.product-item');
            const priceText = productItem.find('.product-price').text().replace(/[^0-9]/g, '');
            const price = parseInt(priceText, 10) || 0;

            totalAmount += price;
        });

        // 적립금 사용액을 표시
        $('.refund-info li:nth-child(2) span:nth-child(2)').text(formatCurrency(pointUsed) + '원');

        // 환불 예정 금액 (상품 총 결제 금액에서 사용된 포인트 차감)
        const finalRefundAmount = Math.max(totalAmount - pointUsed, 0);

        // 각 금액을 표시 (숫자 3자리마다 쉼표 추가)
        $('.refund-info li:nth-child(1) span:nth-child(2)').text(formatCurrency(totalAmount) + '원');
        $('.refund-info li:nth-child(4) span:nth-child(2)').text(formatCurrency(finalRefundAmount) + '원');
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