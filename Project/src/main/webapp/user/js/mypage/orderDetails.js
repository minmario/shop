//배송지 변경
function updateDeliveryAddress() {
    // 선택된 배송지 ID 가져오기
    const selectedAddressId = document.querySelector('input[name="deliveryAddress"]:checked').value;

    // AJAX 요청
    $.ajax({
        url: 'Controller?type=orderDetails', // 배송지 변경 처리 URL
        type: 'POST',
        data: {
            action: 'update', // 액션 파라미터
            addressId: selectedAddressId    // 선택된 배송지 ID
        },
        success: function(response) {
            // 성공 응답 처리
            if (response.success) {
                alert("배송지가 수정되었습니다.");

                // 모달 닫기
                $('#deliveryModal').modal('hide');

                // 주문 상세 페이지의 주소 업데이트
                document.querySelector('.name').textContent = response.data.deli_name;
                document.querySelector('.phone').textContent = response.data.phone;
                document.querySelector('.address').textContent =
                    `${response.data.pos_code} ${response.data.addr1} ${response.data.addr2}`;
                document.querySelector('.request').textContent = response.data.deli_request || '';
            } else {
                alert("배송지 수정 중 오류가 발생했습니다.");
            }
        },
        error: function() {
            alert("서버와의 통신 중 문제가 발생했습니다.");
        }
    });
}