function selectQuestion() {
    $.ajax({
        url: "Controller?type=question&action=all",
        type: "POST",
        success: function (response) {
            // 상품문의 섹션만 표시하고 다른 섹션은 숨김
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
                if (section === "#question-article") {
                    $(section).show();
                } else {
                    $(section).hide();
                }
            });

            // 응답 데이터를 #question-article에 렌더링
            $("#question-article").html(response);
        },
        error: function (status, error) {
            console.error("상품문의 정보를 가져오는 데 실패했습니다.", error);
        }
    });
}

function searchQuestion(){
    const status = document.getElementById("question-status").value;
    const startDate = document.getElementById("question-start-date").value;
    const endDate = document.getElementById("question-end-date").value;

    const today = new Date().toISOString().split("T")[0];
    if (endDate > today) {
        alert("조회 기간의 종료일은 오늘 날짜를 넘어설 수 없습니다.");
        return;
    }

    $.ajax({
        url: "Controller?type=question&action=option",
        type: "POST",
        data: {
            status: status,
            startDate: startDate,
            endDate: endDate
        },
        success: function (response) {
            $("#question-article").html(response);
        },
        error: function (status, error) {
            console.error("상품문의 정보를 가져오는 데 실패했습니다.", error);
        }
    });
}