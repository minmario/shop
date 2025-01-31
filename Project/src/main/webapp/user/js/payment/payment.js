document.addEventListener("DOMContentLoaded", () => {
    const deliverySelect = document.getElementById('delivery-request');
    const deliveryMessage = document.getElementById("delivery-message");
    const charCount = document.getElementById("char-count");

    // 옵션 변경 시 이벤트 리스너 추가
    deliverySelect.addEventListener('change', function () {
        toggleMessageVisibility();
    });

    // 글자 수 카운트 업데이트 이벤트 리스너 추가
    deliveryMessage.addEventListener('keyup', function () {
        charCount.textContent = deliveryMessage.value.length + "/50";
    });

    // 메시지 표시/숨김 함수
    function toggleMessageVisibility() {
        if (deliverySelect.value === '직접 입력') {
            deliveryMessage.style.display = "block";
            charCount.style.display = "block";
            deliveryMessage.value = "";
            charCount.innerText = "0/50";
        } else {
            deliveryMessage.style.display = "none";
            charCount.style.display = "none";
            charCount.style.display = "none";
        }
    }

    // 페이지 로드 시 초기 상태 설정
    toggleMessageVisibility();
});

// 주문 코드
function onGetOrderCode() {
    // 오늘 날짜 가져오기
    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const date = String(today.getDate()).padStart(2, '0');

    // 랜덤 4자리 숫자 생성
    const randomFourDigits = Math.floor(1000 + Math.random() * 9000);

    // 날짜와 랜덤 숫자 결합
    const result = year + month + date + randomFourDigits;

    return result;
}

// 결제 API
function onPayment() {
    const order_code = onGetOrderCode();
    const total_amount = document.getElementById("total_amount").innerText.replaceAll(',', '').replace('원', '');

    $.ajax({
        url: 'Controller?type=order&action=payment',
        method: 'POST',
        data: {
            order_code: order_code,
            prod_name: document.getElementById("product-name").innerText,
            quantity: document.getElementById("product-count").innerText,
            total_amount: total_amount,
            tax_free_amount: Math.floor(parseInt(total_amount, 10) * 0.1)
        },
        dataType: "JSON",
        success: function (response) {

        }, error: function (err) {
            window.location.href = err.responseJSON.next_redirect_pc_url;
        }
    });
}

// 주문 배송지 변경
function updateDeliveryAddr() {
    // 기존 배송지 ID
    const DeliveryID = document.querySelector(".deli-no").value;
    // 선택된 배송지 ID 가져오기
    const selectedDeliveryId = document.querySelector('input[name="deliveryAddress"]:checked').value;
    const orderCode = document.querySelector("#orderCode").value;

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

// 적립금 입력
function formatCurrency() {
    const pointInput = document.getElementById('point-input');
    let inputValue = pointInput.value;

    inputValue = inputValue.replace(/[^0-9]/g, '');

    if (!inputValue) {
        pointInput.value = '';
        return;
    }

    const formattedValue = parseInt(inputValue, 10).toLocaleString();
    pointInput.value = formattedValue;
}

// 적립급 사용
function applyPoint() {
    const pointInputElement = document.getElementById('point-input');
    const maxPointsElement = document.getElementById('max-points');
    const savePointsElement = document.getElementById('save-points');
    const usedPointElement = document.getElementById('used-point');

    const maxPoints = parseInt(maxPointsElement.textContent.replace(/[^0-9]/g, ''), 10);
    const savePoints = parseInt(savePointsElement.textContent.replace(/[^0-9]/g, ''), 10);
    const inputValue = parseInt(pointInputElement.value.replaceAll(/[^0-9]/g, ""), 10);

    console.log("maxPoints : " + maxPoints);
    console.log("savePoints : " + savePoints);
    console.log("inputValue : " + inputValue);

    if (isNaN(inputValue) || inputValue > maxPoints) {
        pointInputElement.value = savePoints;
    }

    if (isNaN(inputValue) || inputValue > savePoints) {
        pointInputElement.value = savePoints;
    }

    usedPointElement.textContent = "- " + parseInt(inputValue).toLocaleString() + "원";
}

// 사용 적립금 초기화
function resetPoint() {
    // 포인트 입력 초기화 및 표시 초기화
    document.getElementById('point-input').value = '';
    document.getElementById('used-point').textContent = '- 0원';
}