document.addEventListener("DOMContentLoaded", function () {
    const countdownValue = 3; // 타이머를 3초로 설정
    const timerElement = document.getElementById("timer");
    const progressCircle = document.querySelector(".circle-progress");
    const timerContainer = document.getElementById("timer-container");
    const orderCompleted = document.getElementById("order-completed");
    const completedText = document.querySelector(".completed-text");
    const container = document.querySelector(".container");

    // Progress circle 설정
    const radius = progressCircle.r.baseVal.value;
    const circumference = 2 * Math.PI * radius;

    progressCircle.style.strokeDasharray = circumference;
    progressCircle.style.strokeDashoffset = circumference;

    function setProgress(value) {
        const offset = circumference - (value / countdownValue) * circumference;
        progressCircle.style.strokeDashoffset = offset;
    }

    // 초기 상태 설정
    let countdown = countdownValue;
    const timerContainerRect = timerContainer.getBoundingClientRect(); // 타이머 위치
    const containerRect = container.getBoundingClientRect(); // 컨테이너 위치

    // 타이머 중심점
    const timerCenterX = timerContainerRect.left + timerContainerRect.width / 2;
    const timerCenterY = timerContainerRect.top + timerContainerRect.height / 2;

    // "주문 완료" 초기 위치를 container 중앙으로 설정
    const containerCenterX = containerRect.left + containerRect.width / 2;
    const containerCenterY = containerRect.top + containerRect.height / 2;

    // 초기 위치 유지
    orderCompleted.style.top = (containerCenterY - containerRect.top) + "px";
    orderCompleted.style.left = (containerCenterX - containerRect.left) + "px";

    // 카운트다운 시작
    timerElement.textContent = countdown;
    setProgress(countdown);

    const countdownInterval = setInterval(function () {
        countdown--;
        timerElement.textContent = countdown;
        setProgress(countdown);

        // 이동 비율
        const progress = (countdownValue - countdown) / countdownValue;

        // 이동 중 위치와 크기 조정
        const newTop = (1 - progress * 1.1) * (containerCenterY - containerRect.top) + progress * (timerCenterY - containerRect.top);
        const newLeft = (1 - progress * 1.1) * (containerCenterX - containerRect.left) + progress * (timerCenterX - containerRect.left);
        const newFontSize = 60 - progress * (60 - 22);

        orderCompleted.style.top = newTop + "px";
        orderCompleted.style.left = newLeft + "px";
        completedText.style.fontSize = newFontSize + "px";

        if (countdown <= 0) {
            clearInterval(countdownInterval);

            // "주문 완료"를 타이머 위치에 고정
            orderCompleted.style.top = (timerCenterY - containerRect.top) + "px";
            orderCompleted.style.left = (timerCenterX - containerRect.left) + "px";
            completedText.style.fontSize = "22px";

            timerContainer.style.display = "none";

            setTimeout(function(){
                // 주문 상세 조회
                selectOrderDetails();
            }, 1500);
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
