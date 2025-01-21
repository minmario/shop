let countdown = 5;
const redirectMessage = document.getElementById('redirectMessage');

const countdownInterval = setInterval(() => {
    countdown--;
    if (countdown > 0) {
        redirectMessage.textContent = `${countdown}초 뒤에 메인 페이지로 돌아갑니다`;
    } else {
        clearInterval(countdownInterval);
        window.location.href = 'Controller';
    }
}, 1000);