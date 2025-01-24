function toggleText(element) {
    const ellipsisText = '... [더보기]';
    const fullText = element.getAttribute('data-full-text');

    if (element.textContent.trim().endsWith(ellipsisText)) {
        element.textContent = fullText;
    } else {
        const shortText = fullText.substring(0, 30) + ellipsisText;
        element.textContent = shortText;
    }
}

function selectInquiry() {
    $.ajax({
        url: "Controller?type=board&action=all",
        type: "POST",
        success: function (response) {
            // 1:1문의 섹션만 표시하고 다른 섹션은 숨김
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
            allSections.forEach((section) => {
                if (section === "#inquiry-article") {
                    $(section).show();
                } else {
                    $(section).hide();
                }
            });

            // 응답 데이터를 #inquiry-article에 렌더링
            $("#inquiry-article").html(response);
        },
        error: function (status, error) {
            console.error("1:1문의 정보를 가져오는 데 실패했습니다.", error);
        }
    });
}

$(document).ready(function () {
    // 기간 설정 옵션 변경 시 날짜 선택 필드 표시
    $("#date-range").change(function () {
        if ($(this).val() === "custom") {
            $("#custom-date-picker").show();
        } else {
            $("#custom-date-picker").hide();
        }
    });

    // 검색 버튼 클릭 시
    $(".search-button").click(function () {
        const status = $("#status").val(); // 처리 상태
        const dateRange = $("#date-range").val(); // 기간
        const startDate = $("#start-date").val(); // 시작 날짜 (사용자 입력)
        const endDate = $("#end-date").val(); // 종료 날짜 (사용자 입력)

        // AJAX 요청
        $.ajax({
            url: "Controller?type=board&action=search",
            method: "POST",
            data: {
                status: status,
                dateRange: dateRange,
                startDate: startDate,
                endDate: endDate
            },
            success: function (response) {
                // 검색 결과를 렌더링
                $(".inquiry-container").html(response);
            },
            error: function () {
                alert("검색 중 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    });
});