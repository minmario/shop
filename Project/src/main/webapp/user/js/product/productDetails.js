document.addEventListener("DOMContentLoaded", function () {
    const tabs = document.querySelectorAll(".tab-btn");
    const panels = document.querySelectorAll(".tab-panel");

    tabs.forEach((tab) => {
        tab.addEventListener("click", function () {
            tabs.forEach((btn) => btn.classList.remove("active"));
            panels.forEach((panel) => panel.classList.remove("active"));

            this.classList.add("active");
            const target = this.getAttribute("data-target");
            document.getElementById(target).classList.add("active");
        });
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const categoryTabs = document.querySelectorAll(".review-categories li");
    const reviewLists = document.querySelectorAll(".review-list");

    categoryTabs.forEach((tab) => {
        tab.addEventListener("click", function () {
            categoryTabs.forEach((tab) => tab.classList.remove("active"));
            reviewLists.forEach((list) => list.classList.remove("active"));

            this.classList.add("active");
            const target = this.getAttribute("data-target");
            document.getElementById(target).classList.add("active");
        });
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const sizeSelect = document.getElementById("size-select");
    const genderSelect = document.getElementById("gender-select");
    const heightInput = document.getElementById("height-input");
    const weightInput = document.getElementById("weight-input");
    const photoToggle = document.getElementById("photo-review-toggle");
    const mySizeToggle = document.getElementById("my-size-toggle");

    sizeSelect.addEventListener("change", () => {
        console.log("사이즈 선택:", sizeSelect.value);
    });

    genderSelect.addEventListener("change", () => {
        console.log("성별 선택:", genderSelect.value);
    });

    heightInput.addEventListener("input", () => {
        console.log("키 입력:", heightInput.value);
    });

    weightInput.addEventListener("input", () => {
        console.log("몸무게 입력:", weightInput.value);
    });

    photoToggle.addEventListener("change", () => {
        console.log("사진 후기만:", photoToggle.checked);
    });

    mySizeToggle.addEventListener("change", () => {
        console.log("내 사이즈:", mySizeToggle.checked);
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const inquiryItems = document.querySelectorAll(".inquiry-item");

    inquiryItems.forEach((item) => {
        const header = item.querySelector(".inquiry-header");
        const arrow = header.querySelector(".arrow");
        const content = item.querySelector(".inquiry-content");

        header.addEventListener("click", () => {
            const isOpen = item.classList.contains("open");

            inquiryItems.forEach((i) => {
                if (i !== item) {
                    i.classList.remove("open");
                    i.querySelector(".inquiry-content").style.display = "none";
                    i.querySelector(".arrow").classList.replace("bi-chevron-up", "bi-chevron-down");
                }
            });

            if (isOpen) {
                item.classList.remove("open");
                content.style.display = "none";
                arrow.classList.replace("bi-chevron-up", "bi-chevron-down");
            } else {
                item.classList.add("open");
                content.style.display = "block";
                arrow.classList.replace("bi-chevron-down", "bi-chevron-up");
            }
        });
    });
});