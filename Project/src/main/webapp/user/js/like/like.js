// 좋아요 해제
function deleteProdLike(value) {
    $.ajax({
        url: "Controller?type=like&action=unlike",
        method: 'POST',
        data: {
            prod_no: value
        },
        success: function () {
            window.location.href = "Controller?type=like&action=select";
        },
        error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}