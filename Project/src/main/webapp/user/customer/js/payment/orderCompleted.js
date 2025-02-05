document.addEventListener("DOMContentLoaded", function () {
    var countdownValue = 3;
    var timerElement = document.getElementById('timer');
    var progressCircle = document.querySelector('.circle-progress');
    var timerContainer = document.getElementById('timer-container');
    var orderCompleted = document.getElementById('order-completed');

    // Progress circle 설정
    var radius = progressCircle.r.baseVal.value;
    var circumference = 2 * Math.PI * radius;

    progressCircle.style.strokeDasharray = circumference;
    progressCircle.style.strokeDashoffset = circumference;

    function setProgress(value) {
        var offset = circumference - (value / 5) * circumference;
        progressCircle.style.strokeDashoffset = offset;
    }

    // 카운트다운 시작
    timerElement.textContent = countdownValue;
    setProgress(countdownValue);

    var countdownInterval = setInterval(function () {
        countdownValue--;
        timerElement.textContent = countdownValue;

        setProgress(countdownValue);

        if (countdownValue <= 0) {
            clearInterval(countdownInterval);
            timerContainer.style.display = 'none';
            orderCompleted.style.display = 'flex';  // 타이머 대신 "주문 완료" 표시

            selectOrderDetails();
        }
    }, 1000);
});

// 주문 상세 조회
function selectOrderDetails() {
    const order_code = document.getElementById("order-details").dataset.order;

    $.ajax({
        url: "Controller?type=order&action=completed",
        method: 'POST',
        data: {
            order_code: order_code
        },
        success: function (response) {
            console.log('response : ' + response);
            $("#order-details").html(response);
        },
        error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}
