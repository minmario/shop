document.addEventListener("DOMContentLoaded", function () {
    // 초기화
    document.getElementById("cus_pw").value = "";
    document.getElementById("btn-confirm").disabled = true;

    // 비밀번호 입력 값 4자 이상 체크
    document.getElementById("cus_pw").addEventListener("keyup", function () {
        const passwordInput = this;
        const errorMessage = document.getElementById("errorMessage");
        const confirmButton = document.getElementById("btn-confirm");

        if (passwordInput.value.length < 4) {
            passwordInput.classList.add("invalid");
            errorMessage.classList.add("visible");
            confirmButton.disabled = true;
        } else {
            passwordInput.classList.remove("invalid");
            errorMessage.classList.remove("visible");
            confirmButton.disabled = false;
        }
    });
});

function onCustomerConfirm() {
    const cus_pw =  document.getElementById("cus_pw").value;

    if (cus_pw.length < 4) {
        return;
    }

    $.ajax({
        url: "Controller?type=myPage&action=confirm",
        method: "POST",
        data: {
            cus_pw: cus_pw
        },
        success: function (response) {
            if (response.data.valid) {
                window.location.href = "Controller?type=myPage&action=edit";
            }
        },
        error: function (error) {
            console.log("error : " + error);
        }
    });

}