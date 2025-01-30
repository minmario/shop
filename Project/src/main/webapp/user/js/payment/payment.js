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
        success: function (res) {

        }, error: function (err) {
            window.location.href = err.responseJSON.next_redirect_pc_url;
        }
    });
}