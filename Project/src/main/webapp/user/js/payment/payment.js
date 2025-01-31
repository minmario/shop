document.addEventListener("DOMContentLoaded", () => {
    const deliveryOptions = document.getElementById("delivery-options");
    const deliveryMessage = document.getElementById("delivery-message");
    const charCount = document.getElementById("char-count");
    const buttons = document.querySelectorAll('.radio-button');

    deliveryOptions.addEventListener("change", (event) => {
        if (event.target.value === "직접입력") {
            deliveryMessage.style.display = "block";
            charCount.style.display = "block";
            deliveryMessage.value = "";
            charCount.innerText = "0/50";
        } else {
            deliveryMessage.style.display = "none";
            charCount.style.display = "none";
            charCount.style.display = "none";
        }
    });

    deliveryMessage.addEventListener("keyup", () => {
        const currentLength = deliveryMessage.value.length;
        charCount.innerText = currentLength + "/50";
    });

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            buttons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
        });
    });
});

function toggleButtonGroup(show) {
    const buttonGroup = document.querySelector('.button-group');
    const selectGroup = document.querySelector('.select-group');
    buttonGroup.style.display = show ? 'grid' : 'none';
    selectGroup.style.display = show ? 'flex' : 'none';
}

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
function updateDeliveryAddress() {
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

// 사용 적립금 입력
function handlePointInput() {
    const inputElement = document.getElementById('point-input');
    const usedPointElement = document.getElementById('used-point');

    // 입력 값 가져오기
    let inputValue = inputElement.value;

    // 숫자가 아닌 값 제거 및 음수 방지
    inputValue = inputValue.replace(/[^0-9]/g, '');

    // 값이 없으면 return
    if (!inputValue) {
        return;
    }

    // 입력값을 다시 설정 (숫자가 아닌 문자는 제거된 상태로)
    inputElement.value = inputValue;

    // 사용 포인트 표시
    usedPointElement.textContent = "-" + parseInt(inputValue).toLocaleString() + "원";
}

// 사용 적립금 초기화
function resetPoint() {
    // 포인트 입력 초기화 및 표시 초기화
    document.getElementById('point-input').value = '';
    document.getElementById('used-point').textContent = '-0원';
}