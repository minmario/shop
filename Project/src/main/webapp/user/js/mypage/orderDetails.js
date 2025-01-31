//주문 배송지 변경
function updateDeliveryAddress() {
    // 기존 배송지 ID
    const DeliveryID = document.querySelector(".deli-no").value;
    // 선택된 배송지 ID 가져오기
    const selectedDeliveryId = document.querySelector('input[name="deliveryAddress"]:checked').value;
    const orderCode = document.querySelector("#orderCode").value;

    // AJAX 요청
    $.ajax({
        url: 'Controller?type=orderDetails&action=update', // 배송지 변경 처리 URL
        type: 'POST',
        data: {
            pre_delivery_id: DeliveryID,
            delivery_id: selectedDeliveryId,  // 선택된 배송지 ID
            order_code: orderCode // 현재 주문 코드도 함께 전달
        },
        success: function(response) {
            if (response.success) {
                alert("배송지가 수정되었습니다.");
                $('#changeDeliveryModal').click();
                // 변경된 데이터를 DOM에 반영
                document.querySelector('.name').textContent = response.data.deli_name;
                document.querySelector('.phone').textContent = response.data.phone;
                document.querySelector('.address').textContent =
                    `${response.data.pos_code} ${response.data.addr1} ${response.data.addr2}`;
            } else {
                alert("배송지 수정 중 오류가 발생했습니다.");
            }
        },
        error: function() {
            alert("서버와의 통신 중 문제가 발생했습니다.");
        }
    });
}

// $(document).ready(function () {
//     $('.option-button').on('click', function () {
//         // 숨긴 필드에서 prod_no 값을 가져옴
//         const prodNo = $(this).closest('.product-item').find('.prod-no').val();
//
//         // AJAX 요청
//         $.ajax({
//             url: 'Controller?type=orderDetails&action=select_size',
//             method: 'POST',
//             data: { prod_no: prodNo },
//             success: function (response) {
//                 if (response.success) {
//                     $('#size-options').empty();
//                     response.options.forEach(function (option) {
//                         $('#size-options').append(`<option value="${option}">${option}</option>`);
//                     });
//                 } else {
//                     alert("옵션 정보를 가져오는 데 실패했습니다.");
//                 }
//             },
//             error: function () {
//                 alert("서버와의 통신 중 오류가 발생했습니다.");
//             }
//         });
//     });
// });
