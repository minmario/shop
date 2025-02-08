document.addEventListener('DOMContentLoaded', function () {
    if (performance.navigation.type === 2) { // 뒤로 가기 탐지
        alert("뒤로가기");
        location.reload(); // 강제 새로고침
    }
});

function onClickLogout() {
    window.location.replace("Controller?type=logout");
}