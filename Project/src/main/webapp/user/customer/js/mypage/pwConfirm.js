$(function () {
    // 초기화
    $("#cus_pw").val("");
    $("#btn-confirm").attr("disabled", true);

    // 비밀번호 입력 값 4자 이상 체크
    $("#cus_pw").on("keyup", function () {
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
        let cus_pw =  $("#cus_pw").val();

        if (cus_pw.length < 4) {
            return;
        }

        $("#passwordForm").submit();

        $("#cus_pw").val("");
    });
});