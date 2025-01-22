$(function () {
    // 초기화
    $("#passwordInput").val("");
    $("#btn-confirm").attr("disabled", true);

    // 비밀번호 입력 값 4자 이상 체크
    $("#passwordInput").on("keyup", function () {
        if ($(this).val().length < 4) {
            $(this).addClass("invalid");
            $("#errorMessage").addClass("visible");
            $("#btn-confirm").attr("disabled", true);
        } else {
            $(this).removeClass("invalid");
            $("#errorMessage").removeClass("visible");
            $("#btn-confirm").attr("disabled", false);
        }
    });

    // 완료 버튼 클릭 시
    $("#btn-confirm").on('click', function () {
        let pw =  $("#passwordInput").val();

        if (pw.length < 4) {
            return;
        }

        $.ajax({
            url: 'Controller?type=confirmAction',
            method: 'POST',
            data: {
                cus_pw: pw
            },
            success: function (data) {

            },
            error: function (err) {
                alert("비밀번호 검증 중 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    });
});