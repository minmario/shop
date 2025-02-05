// function selectRefundTab(action) {
//     const targetTable = "#list-" + action;
//
//     $.ajax({
//         url: "Controller?type=refund&action=" + action,
//         type: "POST",
//         success: function (response) {
//             const allSections = [
//                 "#list-all",
//                 "#list-cancelRefund",
//                 "#list-exchange"
//             ];
//
//             // 모든 섹션 숨기기
//             allSections.forEach((section) => {
//                 $(section).hide();
//             });
//
//             // 기존 섹션 내용 중 데이터 부분만 교체
//             const listContainer = $(targetTable).find(".wrap-refund-list");
//             listContainer.html(response.data);  // 서버에서 받은 데이터를 삽입
//             $(targetTable).show();
//
//             // 탭 활성화 상태 관리
//             document.querySelectorAll(".nav-link").forEach(function (element) {
//                 element.classList.remove("active");
//             });
//             document.querySelector('[data-target="#' + targetTable.substring(1) + '"]').classList.add('active');
//         },
//         error: function (status, error) {
//             console.error("환불 정보를 가져오는 데 실패했습니다.", error);
//         }
//     });
// }

function selectRefundTab(action) {
    const targetTable = `#list-`+ action;

    $.ajax({
        url: `Controller?type=refund&action=`+ action,
        type: "POST",
        success: function (response) {
            const allSections = [
                "#order-article",
                "#refund-article",
                "#review-article",
                "#inquiry-article",
                "#question-article",
                "#point-article",
                "#coupon-article",
                "#delivery-article"
            ];

            // 모든 섹션 숨기고 선택된 섹션만 표시
            allSections.forEach((section) => {
                if (section === "#refund-article") {
                    $(section).show();
                } else {
                    $(section).hide();
                }
            });

            // 응답 데이터를 해당 섹션에 삽입
            $("#refund-article").html(response);
            $(targetTable).show();

            // 탭 활성화 상태 관리
            document.querySelectorAll(".nav-link").forEach(function (element) {
                if (element.classList.contains("active")) {
                    element.classList.remove("active");
                }
            });
            document.querySelector('[data-target="#refund-' + action + '"]').classList.add('active');
            $("#refund-list .list").hide();
            $("#refund-" + action).show();
        },
        error: function (status, error) {
            console.error("취소/반품/교환 정보를 가져오는 데 실패했습니다.", error);
        }
    });
}

