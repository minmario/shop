function selectRefundTab(action) {
    const targetTable = "#list-" + action;

    // AJAX 요청으로 서버에서 데이터 가져오기
    $.ajax({
        url: "Controller?type=refund&action=" + action,
        type: "POST",
        success: function (response) {
            const allSections = [
                "#list-all",
                "#list-cancelRefund",
                "#list-exchange"
            ];

            // 모든 섹션 숨기고 선택된 섹션만 표시
            allSections.forEach((section) => {
                if (section === targetTable) {
                    $(section).html(response).show();
                } else {
                    $(section).hide();
                }
            });

            // 탭 활성화 상태 관리
            document.querySelectorAll(".nav-link").forEach(function (element) {
                if (element.classList.contains("active")) {
                    element.classList.remove("active");
                }
            });
            document.querySelector('[data-target="#' + targetTable.substring(1) + '"]').classList.add('active');
        },
        error: function (status, error) {
            console.error("환불 정보를 가져오는 데 실패했습니다.", error);
        }
    });
}