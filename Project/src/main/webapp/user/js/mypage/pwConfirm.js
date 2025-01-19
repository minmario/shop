document.getElementById('togglePassword').addEventListener('click', function () {
    const passwordInput = document.getElementById('passwordInput');
    const icon = this.querySelector('i');
    const isPasswordVisible = passwordInput.getAttribute('type') === 'text';

    passwordInput.setAttribute('type', isPasswordVisible ? 'password' : 'text');

    icon.classList.toggle('bi-eye');
    icon.classList.toggle('bi-eye-slash');
});

document.getElementById('clearInput').addEventListener('click', function () {
    document.getElementById('passwordInput').value = '';
});

document.addEventListener("DOMContentLoaded", function () {
    const passwordInput = document.getElementById("passwordInput");
    const errorMessage = document.getElementById("errorMessage");

    passwordInput.addEventListener("input", function () {
        if (passwordInput.value.length < 4) {
            passwordInput.classList.add("invalid");
            errorMessage.classList.add("visible");
        } else {
            passwordInput.classList.remove("invalid");
            errorMessage.classList.remove("visible");
        }
    });

    const clearInput = document.getElementById("clearInput");
    clearInput.addEventListener("click", function () {
        passwordInput.value = "";
        passwordInput.classList.add("invalid");
        errorMessage.classList.add("visible");
    });

    const togglePassword = document.getElementById("togglePassword");
    togglePassword.addEventListener("click", function () {
        const icon = togglePassword.querySelector("i");
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            icon.classList.remove("bi-eye-slash");
            icon.classList.add("bi-eye");
        } else {
            passwordInput.type = "password";
            icon.classList.remove("bi-eye");
            icon.classList.add("bi-eye-slash");
        }
    });
});
