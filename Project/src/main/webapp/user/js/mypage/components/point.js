function selectPoint(action) {
    const targetTable = "#table-" + action;

    // AJAX 요청으로 Action 호출
    $.ajax({
        url: "Controller?type=point&action=" + action,
        type: "POST",
        success: function (response) {
            // 해당 테이블만 표시하고 다른 테이블은 숨김
            const allTables = [
                "#table-all",
                "#table-earned",
                "#table-used",
                "#table-upcoming"
            ];
            allTables.forEach((table) => {
                if (table === "#table-" + action) {
                    $(table).show(); // 선택된 섹션만 표시
                } else {
                    $(table).hide(); // 나머지 섹션 숨김
                }
            });

            $("#tables table").hide();

            // 응답 데이터를 해당 탭에 렌더링
            $(targetTable).html(response); // 응답 데이터 삽입
            $(targetTable).show(); // 해당 테이블만 표시
        },
        error: function (status, error) {
            console.error("포인트 정보를 가져오는 데 실패했습니다.", error);
        }
    });
}